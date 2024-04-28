import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:project_7th_bookhub/Controller/BookController.dart';

class MyInputTextField extends StatelessWidget {
  const MyInputTextField({super.key});

  @override
  Widget build(BuildContext context) {
    BookController bookController = Get.put(BookController());
    TextEditingController searchController = TextEditingController();

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
              controller: searchController,
                  onChanged: (value) {
                    bookController.searchBooks(value.toString().toLowerCase());
                  },
              decoration: const InputDecoration(
                  hintText: "Search",
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  )
              ),
            ),
          ),
          Obx(
            () => Flexible(
              child: SizedBox(
                height: 20, // Adjust the height as needed
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: bookController.searchResults.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> bookData = bookController.searchResults[index];
                    return ListTile(
                      title: Text(bookData['title'] ?? 'kk'),
                      subtitle: Text(bookData['author'] ?? 'kk'),
                      onTap: () {
                        // Handle tile tap
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],

      ),

    );
  }
}

//
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:project_7th_bookhub/Controller/BookController.dart';
//
//
//
// class MyInputTextField extends StatelessWidget {
//   const MyInputTextField({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     BookController bookController = Get.put(BookController());
//     TextEditingController searchController = TextEditingController();
//
//     // Wrap the ListView.builder with a SizedBox to provide a fixed height
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             color: Theme.of(context).colorScheme.background,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Row(
//             children: [
//               const SizedBox(width: 20),
//               InkWell(
//                 onTap: () {
//                   bookController.getAllBooks();
//                 },
//                 child: SvgPicture.asset("Assets/Icons/search.svg"),
//               ),
//               const SizedBox(width: 10),
//               Expanded(
//                 child: TextFormField(
//                   controller: searchController,
//                   onChanged: (value) {
//                     bookController.searchBooks(value);
//                   },
//                   decoration: const InputDecoration(
//                     hintText: "Search",
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         // Wrap the ListView.builder with a SizedBox to provide a fixed height
//         Expanded(
//           child: SizedBox(
//             height: 200, // Adjust the height as needed
//             child: ListView.builder(
//               scrollDirection: Axis.vertical,
//               itemCount: bookController.searchResults.length,
//               itemBuilder: (context, index) {
//                 Map<String, dynamic> bookData = bookController.searchResults[index];
//                 return ListTile(
//                   title: Text(bookData['title'] ?? ''),
//                   subtitle: Text(bookData['author'] ?? ''),
//                   onTap: () {
//                     // Handle tile tap
//                   },
//                 );
//               },
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

