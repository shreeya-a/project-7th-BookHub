import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_7th_bookhub/Components/BookTile.dart';
import 'package:project_7th_bookhub/Config/Colors.dart';
// import 'package:flutter/widgets.dart';

import 'package:project_7th_bookhub/Models/Data.dart';
import 'package:project_7th_bookhub/Screens/BookDetails/BookDetails.dart';
import 'package:project_7th_bookhub/Screens/HomeScreen/Widgets/AppBar.dart';
import 'package:project_7th_bookhub/Screens/HomeScreen/Widgets/CategoryWidget.dart';
import 'package:project_7th_bookhub/Screens/HomeScreen/Widgets/SearchBar.dart';

import '../../Components/BookCard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              color: Theme.of(context).colorScheme.primary,
              // height: 500,
              child: Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const SizedBox(height: 50),
                          //--AppBar--
                          const HomeAppBar(),

                          // header start

                          //-- heading content--
                          const SizedBox(height: 50),
                          Row(
                            children: [
                              Text("Good Morining! ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background,
                                      )),
                              Text("Bibliophile",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background,
                                      ))
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                    "Time to read a book and enhance your knowledge",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background,
                                        )),
                              )
                            ],
                          ),

                          // ---Search bar---
                          const SizedBox(height: 20),
                          const MyInputTextField(),

                          // ---Categories---

                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                "Topics",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                    ),
                              ),
                            ],
                          ),
                          // Categories types
                          const SizedBox(height: 10),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: categoryData
                                  .map(
                                    (e) => CategoryWidget(
                                        iconPath: e["icon"]!,
                                        btnName: e["label"]!),
                                  )
                                  .toList(),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              // )
            ),

            // -- header end --

            // ----Trending----
            const SizedBox(height: 10),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Trending",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: bookData
                            .map((e) => BookCard(
                                  title: e.title!,
                                  coverUrl: e.coverUrl!,
                                  ontap: () {
                                    // Get.to(BookDetails());
                                  },
                                ))
                            .toList(),
                      ),
                    ),

                    // --- Your Interest section ----
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "Your Interest",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Column(
                      children: bookData
                          .map((e) => BookTile(
                                ontap: () {},
                                title: e.title!,
                                coverUrl: e.coverUrl!,
                                author: e.author!,
                                price: e.price!,
                                rating: e.rating!,
                                totalRating: e.numberofRating!,

                                // **** might have to be changed later ****
                                // totalRating: int.parse(e.numberofRating!)
                              ))
                          .toList(),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
