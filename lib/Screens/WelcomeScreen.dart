import 'package:flutter/material.dart';
import 'package:project_7th_bookhub/Components/PrimaryButton.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
       children: [
         Container(
           height: 500,
           padding: const EdgeInsets.all(20),
           color: Theme.of(context).colorScheme.primary,
           child: Row( mainAxisAlignment: MainAxisAlignment.center, children: [
               Expanded(
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     const SizedBox(height: 50),
                     Image.asset("Assets/Images/book.png", width: 360,
                     ),

                     const SizedBox(height: 50),
                     //bookhub title
                     Text(
                         "BookHub",
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Theme.of(context).colorScheme.background,),
                     ),
                     //description
                     const SizedBox(height: 10),
                     Flexible(
                       child: Text(
                         "Here you can find best book for you and you can also read book and listens book ",
                         textAlign: TextAlign.center,
                         style: Theme.of(context).textTheme.labelSmall?.copyWith(
                           color: Theme.of(context).colorScheme.background,
                         ),
                       ),
                     ),
                   ],
                 ),
               )
             ],
           ),
         ),
         Padding(
           padding: const EdgeInsets.all(10),
           child: Column(
             children: [
               const SizedBox(height: 30),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(
                     "Disclaimer",
                     style: Theme.of(context).textTheme.labelMedium,
                   ),
                 ],
               ),
               const SizedBox(height: 10),
               Row(
                 children: [
                   Flexible(
                     child: Text(
                       "n publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum",
                       textAlign: TextAlign.center,
                       style: Theme.of(context).textTheme.labelSmall,
                     ),
                   ),
                 ],
               ),



             ],
           ),
         ),

         // continue button
         const Spacer(),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: PrimaryButton(
             btnName: "CONTINUE",
             onTap: () {},
           )
         )


         
       ],
     ),
    );
  }
}
