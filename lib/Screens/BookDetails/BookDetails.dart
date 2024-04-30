
import 'package:flutter/material.dart';

// import '../../Config/Colors.dart';
import '../../Models/BookModel.dart';
import 'BookActionBtn.dart';
import 'HeaderWidget.dart';

class BookDetails extends StatelessWidget {
  final BookModel book;
  const BookDetails({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              color: Theme.of(context).colorScheme.primary,
              child: Row(
                children: [
                  Expanded(
                    child: BookDetailsHeader(
                      coverUrl: book.coverUrl!,
                      title: book.title!,
                      author: book.author!,
                      description: book.description!,
                      rating: book.rating!,
                      pages: book.pages.toString(),
                      langugae: book.language.toString(),
                      category: book.category!,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "About book",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          // fontStyle: FontStyle.italic,
                        )
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            book.description!,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // const SizedBox(height: 8),
                  // Row(
                  //   children: [
                  //     Flexible(
                  //       child: Text(
                  //         book.category!,
                  //         style: Theme.of(context).textTheme.labelMedium,
                  //       ),
                  //     ),
                  //   ],
                  // ),

                  // -- open book pdf --
                  const SizedBox(height: 30),
                  BookActionBtn(
                    bookUrl: book.bookurl!,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
