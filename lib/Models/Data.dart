import 'BookModel.dart';

var categoryData = [
  {
    "icon": "Assets/Icons/heart.svg",
    "label": "Romance",
  },
  {
    "icon": "Assets/Icons/plane.svg",
    "label": "Travel",
  },
  {
    "icon": "Assets/Icons/world.svg",
    "label": "Documentary",
  },
  {
    "icon": "Assets/Icons/heart.svg",
    "label": "Love Story",
  },
];

var bookData = [
  BookModel(
      id: "1",
      title:
      "Boundraties",
      description:
      "n publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum",

      author: "Nitish Roy",
      coverUrl: "Assets/Images/boundraries.jpg",
      rating: "4.2",
      category: "Documentary",

      price: 100,
      pages: 234,
      language: "ENG",
      //
      ),
  BookModel(
      id: "2",
      title: "Daily Stoic",
      description:
      "n publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum",

      author: "Nitish Roy",
      coverUrl: "Assets/Images/daily stoic.jpg",
      rating: "4.2",
      category: "Documentary",
      price: 100,

      language: "ENG",
      pages: 234,
      bookurl:
      "https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf"),
  BookModel(
      id: "3",
      title: "Give and Take",
      description:
      "n publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum",

      author: "Nitish Roy",
      coverUrl: "Assets/Images/Give and Take.jpg",
      rating: "4.2",
      category: "Documentary",

      price: 100,
      language: "ENG",
      pages: 234,
      bookurl:
      "https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf"),
  BookModel(
    id: "4",
    title: "When the moon split",
    description:
    "n publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum",

    author: "Nitish Roy",
    coverUrl: "Assets/Images/When the moon split.jpg",
    rating: "4.2",
    category: "Documentary",
    price: 100,
    pages: 234,
    language: "ENG",

    bookurl:
    "https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf",
  )
];
