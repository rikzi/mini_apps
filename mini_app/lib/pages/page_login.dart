import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_app/service/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // final auth = RepositoryProvider.of<AuthService>(context);
    return Scaffold(
        backgroundColor: Colors.yellow.shade200,
        body: Center(
          child: buttonCustom(() {
            AuthService().signInWithGoogle();
          }),
        ));
  }

  Widget buttonCustom(void Function()? ontap) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(0, 2),
                blurRadius: 2,
                spreadRadius: 1),
          ],
          border: Border.all(width: 1, color: Colors.black),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'asset/images/google-logo.png',
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'Sign in',
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
