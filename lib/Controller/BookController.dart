import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:uuid/uuid.dart';
import '../Config/Messages.dart';
import '../Models/BookModel.dart';

class BookController extends GetxController {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController author = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController pages = TextEditingController();
  TextEditingController rating = TextEditingController();
  TextEditingController language = TextEditingController();
  TextEditingController price = TextEditingController();
  ImagePicker imagePicker = ImagePicker();
  final storage = FirebaseStorage.instance;
  final db = FirebaseFirestore.instance;
  final fAuth = FirebaseAuth.instance;
  RxString imageUrl = "".obs;
  RxString pdfUrl = "".obs;

  var bookPdfUrl = "".obs; // Observable for the book PDF URL
  var bookimageUrl = "".obs;
  var cimageUrl = "".obs;

  // int index = 0;
  RxBool isImageUploading = false.obs;
  RxBool isPdfUploading = false.obs;
  RxBool isPostUploading = false.obs;
  var bookData = RxList<BookModel>();
  var currentUserBooks = RxList<BookModel>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllBooks();
  }

  void getAllBooks() async {
    bookData.clear();
    // successMessage("Book Get Fun");
    var books = await db.collection("Books").get();
    for (var book in books.docs) {
      bookData.add(BookModel.fromJson(book.data()));
    }
  }

  void getUserBook() async {
    currentUserBooks.clear();
    var books = await db
        .collection("userBook")
        .doc(fAuth.currentUser!.uid)
        .collection("Books")
        .get();
    for (var book in books.docs) {
      currentUserBooks.add(BookModel.fromJson(book.data()));
    }
  }

  void pickImage() async {
    isImageUploading.value = true;
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      print(image.path);
      uploadImageToFirebase(File(image.path));
    }
    isImageUploading.value = false;
  }

  void uploadImageToFirebase(File image) async {
    var uuid = Uuid();
    var filename = uuid.v1();
    var storageRef = storage.ref().child("Images/$filename");
    var response = await storageRef.putFile(image);
    String downloadURL = await storageRef.getDownloadURL();
    imageUrl.value = downloadURL;
    print("Download URL: $downloadURL");
    isImageUploading.value = false;
  }

  void createBook() async {
    if (title.text.isEmpty ||
        description.text.isEmpty ||
        author.text.isEmpty ||
        category.text.isEmpty ||
        price.text.isEmpty ||
        pages.text.isEmpty ||
        language.text.isEmpty ||
        rating.text.isEmpty ||
        imageUrl.value.isEmpty ||
        pdfUrl.value.isEmpty) {
      errorMessage("Please fill in all the fields");
      return;
    }
    isPostUploading.value = true;
    // index ++;
    var newBook = BookModel(
      // id: "$index",
      title: title.text,
      description: description.text,
      coverUrl: imageUrl.value,
      bookurl: pdfUrl.value,
      author: author.text,
      category: category.text,
      price: int.parse(price.text),
      pages: int.parse(pages.text),
      language: language.text,
      // audioLen: audioLen.text,
      rating: rating.text,
    );

    // Use doc() without passing any arguments to generate a unique ID
    var documentReference = db.collection("Books").doc();

    // Get the automatically generated ID
    var newBookId = documentReference.id;

    // Set the ID in the BookModel
    newBook.id = newBookId;

    await db.collection("Books").add(newBook.toJson());
    addBookInUserDb(newBook);
    isPostUploading.value = false;
    title.clear();
    description.clear();
    category.clear();
    pages.clear();
    language.clear();
    rating.clear();
    author.clear();
    price.clear();
    imageUrl.value = "";
    pdfUrl.value = "";
    successMessage("Book added successfully");
    getAllBooks();
    getUserBook();
    Get.back();
    // Get.to(ProfileScreen());
  }

  void pickPDF() async {
    isPdfUploading.value = true;
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      File file = File(result.files.first.path!);

      if (file.existsSync()) {
        Uint8List fileBytes = await file.readAsBytes();
        String fileName = result.files.first.name;
        // print("File Bytes: $fileBytes");

        final response =
            await storage.ref().child("Pdf/$fileName").putData(fileBytes);

        final downloadURL = await response.ref.getDownloadURL();
        pdfUrl.value = downloadURL;
        // print(downloadURL);
      } else {
        // print("File does not exist");
      }
    } else {
      // print("No file selected");
    }
    isPdfUploading.value = false;
  }

  void addBookInUserDb(BookModel book) async {
    await db
        .collection("userBook")
        .doc(fAuth.currentUser!.uid)
        .collection("Books")
        .add(book.toJson());
  }

// Function to clear the PDF URL
  void clearBookPdfUrl() {
    bookPdfUrl.value = "";
    pdfUrl.value = "";
    imageUrl.value = "";
    bookimageUrl.value = "";
    cimageUrl.value = "";
  }

  void updateBook(
    String? id,
    String title,
    String description,
    String author,
    String category,
    int price,
    int pages,
    String language,
    String rating,
    String imageUrl,
    String pdfUrl,
  ) async {
    // Query the document from the "Books" collection
    var booksQuerySnapshot =
        await db.collection("Books").where("id", isEqualTo: id).get();

    // Query the document from the "userBook" collection
    var userBookQuerySnapshot = await db
        .collection("userBook")
        .doc(fAuth.currentUser!.uid)
        .collection("Books")
        .where("id", isEqualTo: id)
        .get();

    if (booksQuerySnapshot.docs.isNotEmpty &&
        userBookQuerySnapshot.docs.isNotEmpty) {
      // Get the document IDs
      var bookDocumentId = booksQuerySnapshot.docs.first.id;
      var userBookDocumentId = userBookQuerySnapshot.docs.first.id;

      var updatedBook = BookModel(
        title: title,
        description: description,
        coverUrl: imageUrl,
        bookurl: pdfUrl,
        author: author,
        category: category,
        price: price,
        pages: pages,
        language: language,
        rating: rating,
      );

      // Update the document in the "Books" collection
      await db
          .collection("Books")
          .doc(bookDocumentId)
          .update(updatedBook.toJson());

      // Update the document in the "userBook" collection
      await db
          .collection("userBook")
          .doc(fAuth.currentUser!.uid)
          .collection("Books")
          .doc(userBookDocumentId)
          .update(updatedBook.toJson());

      successMessage("Book details updated");
      getAllBooks();
      getUserBook();
      Get.back();
    } else {
      errorMessage("Book not found");
    }
  }

}
