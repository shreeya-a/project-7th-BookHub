import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_7th_bookhub/Controller/BookController.dart';

class MyInputTextField extends StatelessWidget {
  const MyInputTextField({super.key});

  @override
  Widget build(BuildContext context) {
    BookController bookController = Get.put(BookController());
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const SizedBox(width: 20),
        InkWell(
          onTap: () {
            bookController.getAllBooks();
          },
          child :
          SvgPicture.asset("Assets/Icons/search.svg"),
        ),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "Search",
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
