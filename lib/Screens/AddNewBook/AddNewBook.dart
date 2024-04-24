import 'package:flutter/material.dart';
import 'package:project_7th_bookhub/Components/MultiLineTextFormField.dart';
import 'package:project_7th_bookhub/Components/MyTextFormField.dart';

import '../../Components/BackButton.dart';

class AddNewBookPage extends StatelessWidget {
  const AddNewBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      Container(
        // height: 500,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        color: Theme.of(context).colorScheme.primary,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyBackButton(),
                    Text(
                      "ADD NEW BOOK",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.background,
                          ),
                    ),
                    SizedBox(height: 70),
                  ],
                ),
                SizedBox(height: 40),
                Container(
                  height: 190,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).colorScheme.background,
                  ),
                  child: Icon(
                    Icons.add,
                    size: 30,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          )
        ]),
      ),
      Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [

            MyTextFormField(
                  hintText: "Book Title",
                  icon: Icons.book,
                  controller: controller,
                ),
            SizedBox(height: 10,),
            MultiLineTextField(
                hintText: "book des",
                icon : Icons.format_align_center_outlined,
                controller: controller),
            MyTextFormField(
                  hintText: "Book Title",
                  icon: Icons.book,
                  controller: controller,
                ),
            SizedBox(height: 10,), MyTextFormField(
                  hintText: "Book Title",
                  icon: Icons.book,
                  controller: controller,
                ),
            SizedBox(height: 10,), MyTextFormField(
                  hintText: "Book Title",
                  icon: Icons.book,
                  controller: controller,
                ),
            SizedBox(height: 10,),

          ],
        ),
      ),
    ])));
  }
}
