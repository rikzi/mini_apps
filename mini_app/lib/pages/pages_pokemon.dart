import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_app/bloc/fetchbloc_bloc.dart';
import 'package:mini_app/service/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonPages extends StatelessWidget {
  const PokemonPages({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    String userProfile = user.photoURL!;
    return BlocProvider(
      create: (context) => FetchblocBloc()..add(InitialFetching()),
      child: Scaffold(
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
                leading:
                    CircleAvatar(backgroundImage: NetworkImage(userProfile)),
                title: Text(user.displayName ?? '-'),
                subtitle: Text(user.email ?? '-'),
                trailing: IconButton(
                    onPressed: () {
                      AuthService().signOut();
                    },
                    icon: const Icon(Icons.logout)),
              ),
            ),
          ),
        ),
        body: BlocBuilder<FetchblocBloc, FetchblocState>(
          builder: (context, state) {
            if (state is FetchLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is FetchSuccess) {
              final result = state.result;
              return GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 30)
                    .copyWith(top: 20),
                itemCount: result.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 2 / 3),
                itemBuilder: (context, index) =>
                    gridCard(title: result[index].name),
              );
            }
            return const Center(
              child: Text('data empty'),
            );
          },
        ),
      ),
    );
  }

  Widget gridCard({required String title}) {
    return Container(
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
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: Center(
              child: Text(
                title,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
          Container(
            height: 4,
            color: Colors.black,
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
