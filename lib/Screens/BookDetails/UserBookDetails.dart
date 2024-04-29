import 'package:flutter/material.dart';

import '../../Models/BookModel.dart';
import 'BookActionBtn.dart';

class UserBookDetailsHeader extends StatelessWidget {
  final String coverUrl;
  final String title;
  final String author;
  final String description;
  final String rating;
  final String pages;
  final String langugae;
  final String category;

  const UserBookDetailsHeader({
    Key? key,
    required this.coverUrl,
    required this.title,
    required this.author,
    required this.description,
    required this.rating,
    required this.pages,
    required this.langugae,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // MyBackButton(), // Include your back button here
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
            ),
            // SvgPicture.asset(
            //   "Assets/Icons/heart.svg",
            //   color: Theme.of(context).colorScheme.background,
            // ),
          ],
        ),
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                coverUrl,
                width: 170,
              ),
            )
          ],
        ),
        SizedBox(height: 30),
        Text(
          title,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Theme.of(context).colorScheme.background,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "By : $author",
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: Colors.white54,
            fontSize: 16,
          ),
        ),
        // SizedBox(height: 10),
        // Text(
        //   description,
        //   maxLines: 2,
        //   textAlign: TextAlign.center,
        //   style: Theme.of(context).textTheme.labelSmall?.copyWith(
        //     color: Theme.of(context).colorScheme.onPrimaryContainer,
        //   ),
        // ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  "Rating",
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Colors.white54,
                  ),
                ),
                Text(
                  rating,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.background,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Pages",
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Colors.white54,
                  ),
                ),
                Text(
                  pages,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.background,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Language",
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Colors.white54,
                  ),
                ),
                Text(
                  langugae,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.background,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Category",
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Colors.white54,
                  ),
                ),
                Text(
                  category,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.background,
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class UserBookDetails extends StatelessWidget {
  final BookModel book;

  const UserBookDetails({Key? key, required this.book}) : super(key: key);

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
                    child: UserBookDetailsHeader(
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
                        "user specific About book",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          // fontStyle: FontStyle.italic,
                        ),
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
