import '../../Config/Colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_7th_bookhub/Screens/BookScreen/BookScreen.dart';

class BookActionBtn extends StatelessWidget {
  final String bookUrl;
  const BookActionBtn({super.key, required this.bookUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Get.to(BookScreen(
                bookUrl: bookUrl,
              ));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                SvgPicture.asset("Assets/Icons/book.svg"),
                SizedBox(width: 10),
                Text(
                  "READ BOOK",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.background,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
