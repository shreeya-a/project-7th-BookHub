
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Components/BackButton.dart';

class UserBookDetailsHeader extends StatelessWidget {
  final String coverUrl;
  final String title;
  final String author;
  final String description;
  final String rating;
  final String pages;
  final String langugae;
  final String category;
  const UserBookDetailsHeader(
      {super.key,
        required this.coverUrl,
        required this.title,
        required this.author,
        required this.description,
        required this.rating,
        required this.pages,
        required this.langugae,
        required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyBackButton(),
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
            fontSize:16,
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
