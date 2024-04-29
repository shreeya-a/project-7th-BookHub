import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_7th_bookhub/Components/BackButton.dart';
import 'package:project_7th_bookhub/Components/BookTile.dart';
import 'package:project_7th_bookhub/Controller/AuthController.dart';
import 'package:project_7th_bookhub/Controller/BookController.dart';
import 'package:project_7th_bookhub/Screens/AddNewBook/AddNewBook.dart';
import 'package:get/get.dart';
import '../../Components/ProfileBookTile.dart';
import '../BookDetails/BookDetails.dart';
import '../UpdateBookDetails/EditBookDetailsScreen.dart';

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
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Logout'),
                                    content: Text('Are you sure you want to logout?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(); // Close the dialog
                                        },
                                        child: Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(); // Close the dialog
                                          Future.delayed(Duration.zero, () {
                                            authController.signout();
                                          });// Perform logout
                                        },
                                        child: Text('Logout'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: Icon(Icons.exit_to_app),
                            color: Theme.of(context).colorScheme.background,
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
                            child: Image.network(
                              "${authController.auth.currentUser!.photoURL}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "${authController.auth.currentUser!.displayName}",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.background,
                          fontSize: 20

                        ),

                      ),
                      SizedBox(height: 10,),
                      Text(
                        "${authController.auth.currentUser!.email}",

                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                 color: Colors.white54,
                              fontSize: 15

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
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  Obx(
                        () => Column(
                      children: bookController.currentUserBooks
                          .map(
                            (e) => ProfileBookTile(
                          title: e.title!,
                          coverUrl: e.coverUrl!,
                          author: e.author!,
                          price: e.price!,
                          rating: e.rating!,
                          category: e.category!,
                          onTap: () {
                            Get.to(BookDetails(book: e));
                          },
                          onEdit: () {
                            // Handle edit action for the book 'e'
                            Get.to(() => EditBookDetails(book: e,));
                          },

                        ),
                      )
                          .toList(),
                    ),
                  ),


                ],
              ),

            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
