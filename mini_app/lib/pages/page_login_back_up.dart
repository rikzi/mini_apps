// import 'package:google_sign_in/google_sign_in.dart';

// import 'package:flutter/material.dart';

// GoogleSignIn _googleSignIn = GoogleSignIn(
//   scopes: [
//     'email',
//     'https://www.googleapis.com/auth/contacts.readonly',
//   ],
// );

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   Future<void> _handleSignIn() async {
//     try {
//       await _googleSignIn.signIn();
//     } catch (error) {
//       print(error);
//     }
//   }

//   GoogleSignInAccount? _currentUser;

//   @override
//   void initState() {
//     _googleSignIn.onCurrentUserChanged.listen((event) {
//       setState(() {
//         _currentUser = event;
//       });
//     });
//     _googleSignIn.signInSilently();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.yellow.shade200,
//       body: _currentUser == null
//           ? Center(
//               child: buttonCustom(),
//             )
//           : SafeArea(
//               child: Container(
//                 padding: const EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                     color: Colors.yellow.shade400,
//                     borderRadius: const BorderRadius.only(
//                       bottomLeft: Radius.circular(25),
//                       bottomRight: Radius.circular(25),
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                           color: Colors.black.withOpacity(0.25),
//                           blurRadius: 2,
//                           offset: const Offset(0, 2))
//                     ]),
//                 child: ListTile(
//                   leading: GoogleUserCircleAvatar(identity: _currentUser!),
//                   title: Text(_currentUser!.displayName ?? ''),
//                   subtitle: Text(_currentUser!.email),
//                   trailing: IconButton(
//                       onPressed: () {
//                         _googleSignIn.disconnect();
//                       },
//                       icon: const Icon(Icons.logout)),
//                 ),
//               ),
//             ),
//     );
//   }

//   Widget buttonCustom() {
//     return InkWell(
//       onTap: () {
//         _handleSignIn();
//       },
//       child: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 30),
//         padding: const EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: const BorderRadius.all(
//             Radius.circular(25),
//           ),
//           boxShadow: [
//             BoxShadow(
//                 color: Colors.black.withOpacity(0.2),
//                 offset: const Offset(0, 2),
//                 blurRadius: 2,
//                 spreadRadius: 1),
//           ],
//           border: Border.all(width: 1, color: Colors.black),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               height: 40,
//               width: 40,
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage(
//                       'asset/images/google-logo.png',
//                     ),
//                     fit: BoxFit.cover),
//               ),
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//             const Text(
//               'Sign in',
//               style: TextStyle(fontSize: 30),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
