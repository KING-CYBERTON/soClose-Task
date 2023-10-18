
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../Controller/AuthController.dart';
// import '../../Controller/FstoreConroller.dart';
// import '../../DataModel/UserModel.dart';

// class UserProfileScreen extends StatefulWidget {
//   const UserProfileScreen({super.key});

//   @override
//   _UserProfileScreenState createState() => _UserProfileScreenState();
// }

// class _UserProfileScreenState extends State<UserProfileScreen> {
//   late Future<UserData> _userDataFuture;
//   final repo = Get.put(FireRepo());

//   final email = FirebaseAuth.instance.currentUser?.email;

//   @override
//   void initState() {
//     super.initState();
//     _userDataFuture = FireRepo.instance.getUserData(email.toString());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: const Text(
//             'Accont Profile',
//             style: TextStyle(fontStyle: FontStyle.italic),
//           ),
//           actions: [
//             IconButton(
//               icon: const Icon(
//                 Icons.edit,
//                 color: Colors.white,
//               ),
//               onPressed: () {
//                 Get.toNamed('/Form');
//               },
//             ),
//           ]),
//       body: FutureBuilder<UserData>(
//         future: _userDataFuture,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             final userData = snapshot.data!;
//             return Center(
//               child: Container(
//                 width: 350,
//                 height: 600,
//                 decoration: BoxDecoration(
//                   image: const DecorationImage(
//                       image: AssetImage("assets/images/Splash.jpg"),
//                       fit: BoxFit.fill),
//                   color: Colors.white,
//                   boxShadow: const [
//                     BoxShadow(
//                       blurRadius: 10,
//                       offset: Offset(1, 1),
//                       color: Color.fromARGB(255, 145, 56, 115),
//                     )
//                   ],
//                   border: Border.all(
//                     color: const Color.fromARGB(255, 139, 51, 103),
//                     width: 2,
//                   ),
//                   borderRadius: BorderRadius.circular(11),
//                 ),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       const SizedBox(height: 30),
//                       const CircleAvatar(
//                         radius: 100,
//                         backgroundColor: Colors.transparent,
//                         backgroundImage: AssetImage('assets/images/logo.png'),
//                       ),
//                       Container(
//                         width: 300,
//                         decoration: BoxDecoration(
//                           color: const Color.fromARGB(255, 46, 75, 61)
//                               .withOpacity(0.5),
//                           borderRadius: BorderRadius.circular(10),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.5),
//                               spreadRadius: 2,
//                               blurRadius: 5,
//                               offset: const Offset(0, 3),
//                             ),
//                           ],
//                         ),
//                         padding: const EdgeInsets.all(10),
//                         child: Text(
//                           userData.username,
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                             fontStyle: FontStyle.italic,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       Container(
//                         width: 300,
//                         decoration: BoxDecoration(
//                           color: const Color.fromARGB(255, 46, 75, 61)
//                               .withOpacity(0.5),
//                           borderRadius: BorderRadius.circular(10),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.5),
//                               spreadRadius: 2,
//                               blurRadius: 5,
//                               offset: const Offset(0, 3),
//                             ),
//                           ],
//                         ),
//                         padding: const EdgeInsets.all(10),
//                         child: Text(
//                           "Biograpy: ${userData.biography}",
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       Container(
//                         width: 300,
//                         decoration: BoxDecoration(
//                           color: const Color.fromARGB(255, 46, 75, 61)
//                               .withOpacity(0.5),
//                           borderRadius: BorderRadius.circular(10),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.5),
//                               spreadRadius: 2,
//                               blurRadius: 5,
//                               offset: const Offset(0, 3),
//                             ),
//                           ],
//                         ),
//                         padding: const EdgeInsets.all(10),
//                         child: Text(
//                           "Region:  ${userData.region}",
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontStyle: FontStyle.italic,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       Center(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               width: 300,
//                               decoration: BoxDecoration(
//                                 color: const Color.fromARGB(255, 46, 75, 61)
//                                     .withOpacity(0.5),
//                                 borderRadius: BorderRadius.circular(10),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.grey.withOpacity(0.5),
//                                     spreadRadius: 2,
//                                     blurRadius: 5,
//                                     offset: const Offset(0, 3),
//                                   ),
//                                 ],
//                               ),
//                               padding: const EdgeInsets.all(10),
//                               child: Text(
//                                 "Age: ${userData.age}",
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 20),
//                             Container(
//                               width: 300,
//                               decoration: BoxDecoration(
//                                 color: const Color.fromARGB(255, 46, 75, 61)
//                                     .withOpacity(0.5),
//                                 borderRadius: BorderRadius.circular(10),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.grey.withOpacity(0.5),
//                                     spreadRadius: 2,
//                                     blurRadius: 5,
//                                     offset: const Offset(0, 3),
//                                   ),
//                                 ],
//                               ),
//                               padding: const EdgeInsets.all(10),
//                               child: Text(
//                                 "no_of_trees: ${userData.no_of_trees}",
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 20),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       ElevatedButton(
//                         onPressed: () {
//                           GetAuth.instance.logOut();
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.red,
//                           shadowColor: const Color.fromARGB(26, 81, 160, 180),
//                         ),
//                         child: Text(
//                           'Log out',
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.lightGreen[800],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           } else if (snapshot.hasError) {
//             print(snapshot.error.toString());
//             return Center(
//               child: Container(
//                 width: 350,
//                 height: 600,
//                 decoration: BoxDecoration(
//                   image: const DecorationImage(
//                       image: AssetImage("assets/images/Splash.jpg"),
//                       fit: BoxFit.fill),
//                   color: Colors.white,
//                   boxShadow: const [
//                     BoxShadow(
//                       blurRadius: 10,
//                       offset: Offset(1, 1),
//                       color: Color.fromARGB(255, 145, 56, 115),
//                     )
//                   ],
//                   border: Border.all(
//                     color: const Color.fromARGB(255, 139, 51, 103),
//                     width: 2,
//                   ),
//                   borderRadius: BorderRadius.circular(11),
//                 ),
//                 child: Center(
//                   child: Container(
//                     width: 300,
//                     color: Colors.white24.withOpacity(0.5),
//                     child: const Text(
//                       "Welcome to tree life\n Please fill your profile details to continue ",
//                       style: TextStyle(
//                           color: Color.fromARGB(255, 10, 10, 10),
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           } else {
//             return const Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//     );
//   }
// }
