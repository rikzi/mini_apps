// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mini_app/pages/page_home.dart';
import 'package:mini_app/pages/page_login.dart';

class AuthService {
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: <String>['email']);
  // GoogleSignInAuthentication? googleAuth;
  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // if(snapshot.hasError){
        //   return
        // }
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return LoginPage();
        }
      },
    );
  }

  signInWithGoogle() async {
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signOut() async {
    FirebaseAuth.instance.signOut();
    await googleSignIn.signOut();
  }
}
