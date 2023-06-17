// import 'package:avatar_glow/avatar_glow.dart';
// import 'package:Ecommerce/utils/mycolors.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../auth.dart';
// import '../utils/pages.dart';

// class ProfileBawah extends StatelessWidget {
//    ProfileBawah({super.key});



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Column(
//         children: [
//           SizedBox(
//             height: 20,
//           ),
//           Expanded(
//             child: Container(
//               child: Column(
//                 children: [
//                   ListTile(
//                     onTap: () {
//                       Get.toNamed(AppPages.changeprofile);
//                     },
//                     leading: Icon(Icons.person),
//                     title: Text(
//                       "Change Profile",
//                       style: TextStyle(
//                         fontSize: 21,
//                       ),
//                     ),
//                     trailing: Icon(Icons.arrow_right),
//                   ),
//                   ListTile(
//                     onTap: () {
//                       Get.toNamed(AppPages.setting);
//                     },
//                     leading: Icon(Icons.settings),
//                     title: Text(
//                       "Setting",
//                       style: TextStyle(
//                         fontSize: 21,
//                       ),
//                     ),
//                     trailing: Icon(Icons.arrow_right),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             margin:
//                 EdgeInsets.only(bottom: context.mediaQueryPadding.bottom + 10),
//             child: Column(
//               children: [
//                 Text(
//                   "E-Commerce App",
//                   style: TextStyle(color: Colors.black45),
//                 ),
//                 Text(
//                   "Demo Version",
//                   style: TextStyle(color: Colors.black45),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),  
//     );
//   }
// }
