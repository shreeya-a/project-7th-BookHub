import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../Controller/BookController.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    BookController bookController = Get.put(BookController());

    return InkWell(
      onTap: () {
        Get.back();
        // bookController.getUserBook();
        // bookController.getUserBook();
      },
      child: Row(
        children: [
          SvgPicture.asset("Assets/Icons/back.svg"),
          SizedBox(width: 10),
          Text(
            "Back",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.background,
            ),
          )
        ],
      ),
    );
  }
}
