import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_7th_bookhub/Components/MultiLineTextFormField.dart';
import 'package:project_7th_bookhub/Components/MyTextFormField.dart';
import 'package:project_7th_bookhub/Controller/BookController.dart';
import 'package:project_7th_bookhub/Controller/PdfController.dart';
import '../../Components/BackButton.dart';
import '../../Config/Colors.dart';
import '../../Models/BookModel.dart';

class EditBookDetails extends StatelessWidget {
  final BookModel book;

  const EditBookDetails({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BookController bookController = Get.put(BookController());
    TextEditingController titleController = TextEditingController(text: book.title);
    TextEditingController descriptionController = TextEditingController(text: book.description);
    TextEditingController authorController = TextEditingController(text: book.author);
    TextEditingController categoryController = TextEditingController(text: book.category);
    TextEditingController priceController = TextEditingController(text: book.price.toString());
    TextEditingController pagesController = TextEditingController(text: book.pages.toString());
    TextEditingController languageController = TextEditingController(text: book.language);
    TextEditingController ratingController = TextEditingController(text: book.rating);

    // Load existing image URL
    var imageUrl = book.coverUrl ?? "";
    var bookpdfUrl = book.bookurl ?? "";

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              color: Theme.of(context).colorScheme.primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyBackButton(),
                            Text(
                              "EDIT BOOK DETAILS",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .background,
                              ),
                            ),
                            SizedBox(width: 60)
                          ],
                        ),
                        SizedBox(height: 60),
                        InkWell(
                          onTap: () {
                            bookController.pickImage();
                          },
                          child: Container(
                            height: 190,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Theme.of(context).colorScheme.background,
                            ),
                            child: Center(
                              child: Obx(
                                    () => bookController.isImageUploading.value
                                    ? CircularProgressIndicator(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primary,
                                )
                                    : imageUrl.isEmpty
                                    ? Image.asset(
                                    "Assets/Icons/addImage4.png")
                                    : imageUrl.startsWith('http') ||
                                    imageUrl.startsWith('https')
                                    ? ClipRRect(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  child: Image.network(
                                    imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                )
                                    : ClipRRect(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  child: Image.file(
                                    File(imageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Obx(() => Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: bookpdfUrl.isEmpty
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: bookController.isPdfUploading.value
                              ? Center(
                            child: CircularProgressIndicator(
                              color: backgroundColor,
                            ),
                          )
                              : bookpdfUrl.isEmpty
                              ? InkWell(
                            onTap: () {
                              bookController.pickPDF();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("Assets/Icons/upload.png"),
                                SizedBox(width: 8),
                                Text(
                                  "Upload PDF",
                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Theme.of(context).colorScheme.background,
                                  ),
                                ),
                              ],
                            ),
                          )
                              : InkWell(
                            onTap: () {
                              bookController.pickPDF(); // Change this line to toggle between delete and upload
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Change PDF",
                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Theme.of(context).colorScheme.background,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Image.asset(
                                  "Assets/Icons/delete.png",
                                  width: 20,
                                ),
                              ],
                            ),
                          ),
                        )),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  MyTextFormField(
                    hintText: "Book title",
                    icon: Icons.book,
                    controller: titleController,
                  ),
                  SizedBox(height: 10),
                  MultiLineTextField(
                    hintText: "Book Description",
                    controller: descriptionController,
                  ),
                  SizedBox(height: 10),
                  MyTextFormField(
                    hintText: "Author Name",
                    icon: Icons.person,
                    controller: authorController,
                  ),
                  SizedBox(height: 10),
                  MyTextFormField(
                    hintText: "Category",
                    icon: Icons.person,
                    controller: categoryController,
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: MyTextFormField(
                          isNumber: true,
                          hintText: "Price",
                          icon: Icons.currency_rupee,
                          controller: priceController,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: MyTextFormField(
                          hintText: "Pages",
                          isNumber: true,
                          icon: Icons.book,
                          controller: pagesController,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: MyTextFormField(
                          hintText: "Language",
                          icon: Icons.language,
                          controller: languageController,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: MyTextFormField(
                          isNumber: true,
                          hintText: "Rating",
                          icon: Icons.star,
                          controller: ratingController,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Cancel button
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 2,
                                color: Colors.red,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.close,
                                  color: Colors.red,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "CANCEL",
                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 3),
                      // Save button
                      Expanded(
                        child: Obx(() => Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: bookController.isPostUploading.value
                              ? Center(
                            child: CircularProgressIndicator(
                              color: backgroundColor,
                            ),
                          )
                              : InkWell(
                            onTap: () {
                              // Update book details
                              bookController.updateBook(
                                book.id,
                                titleController.text,
                                descriptionController.text,
                                authorController.text,
                                categoryController.text,
                                int.parse(priceController.text),
                                int.parse(pagesController.text),
                                languageController.text,
                                ratingController.text,
                                bookController.imageUrl.value,
                                bookpdfUrl,
                              );
                              bookController.clearBookPdfUrl();
                              // Navigate back
                              // Get.back();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.upload_sharp,
                                  color: Theme.of(context).colorScheme.background,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "SAVE",
                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Theme.of(context).colorScheme.background,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
