import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

import 'package:project_7th_bookhub/Models/Data.dart';
import 'package:project_7th_bookhub/Screens/HomeScreen/Widgets/AppBar.dart';
import 'package:project_7th_bookhub/Screens/HomeScreen/Widgets/CategoryWidget.dart';
import 'package:project_7th_bookhub/Screens/HomeScreen/Widgets/SearchBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                                  color:
                                      Theme.of(context).colorScheme.background,
                                ),
                          ),
                        ],
                      ),
                      // Categories types
                      const SizedBox(height: 10),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: categoryData.map(
                          (e) => CategoryWidget(
                                  iconPath: e["icon"]!, btnName: e["label"]!),
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
          )
        ],
      ),
    );
  }
}
