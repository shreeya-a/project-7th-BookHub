import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_7th_bookhub/Screens/HomeScreen/Widgets/AppBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            color: Theme.of(context).colorScheme.primary,
            height: 500,
            // child: Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: 50),
                        //--AppBar--
                        HomeAppBar(),
                        //-- heading content--
                        SizedBox(height: 50),
                        Row(
                          children: [
                            Text("Good Morining! ", style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Theme.of(context).colorScheme.background,
                            )),
                            Text("Bibliophile", style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              color: Theme.of(context).colorScheme.background,)
                            )
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Flexible(
                                child: Text("Time to read a book and enhance your knowledge", style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                  color: Theme.of(context).colorScheme.background,)
                                ),
                            )
                          ],
                        ),

                        // ---Search bar---

                      ],
                    ),
                  )
                ],
              ),
            ),
          // )
        ],
      ),
    );
  }
}
