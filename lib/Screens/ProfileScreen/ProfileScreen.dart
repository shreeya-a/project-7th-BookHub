import 'package:flutter/material.dart';
import 'package:project_7th_bookhub/Components/BackButton.dart';
import 'package:project_7th_bookhub/Components/BookTile.dart';
import 'package:project_7th_bookhub/Components/PrimaryButton.dart';
import 'package:project_7th_bookhub/Controller/AuthController.dart';
import 'package:project_7th_bookhub/Controller/BookController.dart';
import 'package:project_7th_bookhub/Models/Data.dart';
import 'package:project_7th_bookhub/Screens/AddNewBook/AddNewBook.dart';
import 'package:project_7th_bookhub/Screens/HomeScreen/HomeScreen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
AuthController authController = Get.put(AuthController());
BookController bookController = Get.put(BookController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddNewBookPage());
        },
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // height: 500,
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              color: Theme.of(context).colorScheme.primary,
              child:
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                            "Profile",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                              color:
                              Theme.of(context).colorScheme.background,
                            ),
                          ),
                // ---- sign out button ---
                          IconButton(
                            onPressed: () {
                              authController.signout();
                            },
                            icon: Icon(Icons.exit_to_app ),
                            color:
                            Theme.of(context).colorScheme.background,
                          ),
                        ],
                      ),
                      SizedBox(height: 60),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              width: 2,
                              color: Theme.of(context).colorScheme.background,
                            )),
                        child: Container(
                          width: 120,
                          height: 120,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              "Assets/Images/boundraries.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                       "Anu Prajapati",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.background),
                      ),
                      Text(
                        "prajapatianu433@gmail.com",
                        style:
                        Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimaryContainer,
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Your Books",
                          style: Theme.of(context).textTheme.labelMedium),
                    ],
                  ),
                  SizedBox(height: 20),
                  Column(
                      children: bookController.bookData
                          .map((e) => BookTile(
                        title: e.title!,
                        coverUrl: e.coverUrl!,
                        author: e.author!,
                        price: e.price!,
                        rating: e.rating!,
                        category: e.category!,
                        ontap: () {},
                      ))
                          .toList(),
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
