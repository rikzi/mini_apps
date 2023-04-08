import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mini_app/pages/pages_pokemon.dart';
import 'package:mini_app/service/auth_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final auth = RepositoryProvider.of<AuthService>(context);
    final user = FirebaseAuth.instance.currentUser!;
    String userProfile = user.photoURL ?? 'null';
    return Scaffold(
      backgroundColor: Colors.yellow.shade200,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.yellow.shade400,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 2,
                      offset: const Offset(0, 2))
                ]),
            child: ListTile(
              leading: userProfile == 'null'
                  ? CircleAvatar(backgroundImage: NetworkImage(userProfile))
                  : CircleAvatar(backgroundColor: Colors.yellow),
              title: Text(
                user.displayName ?? '-',
                overflow: TextOverflow.ellipsis,
              ),
              subtitle:
                  Text(user.email ?? '-', overflow: TextOverflow.ellipsis),
              trailing: IconButton(
                  onPressed: () {
                    AuthService().signOut();
                  },
                  icon: const Icon(Icons.logout)),
            ),
          ),
        ),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const PokemonPages(),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30)
                .copyWith(top: 10, bottom: 10),
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: const Text(
              'SHOW POKEMON',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          ),
        ),
      ),
    );
  }
}
