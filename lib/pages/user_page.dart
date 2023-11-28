// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:app_padroes/components/my_button.dart';
import 'package:app_padroes/controllers/user_controller.dart';
import 'package:app_padroes/models/user.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: const Row(
            children: [
              Image(
                image: AssetImage('assets/images/PRATELEIRA.png'),
                height: 35,
                width: 35,
              ),
              SizedBox(width: 15),
              Text('Prateleira', style: TextStyle(color: Colors.black)),
            ],
          ),
          automaticallyImplyLeading: false,
          elevation: 0.0,
          backgroundColor: Colors.grey[300],
        ),
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: FutureBuilder<User>(
                  future: UserController().userInformation(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        "Bem vindo " + snapshot.data!.getNome + "!",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "Ficamos muito felizes em tê-lo conosco 😊",
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 75),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: FutureBuilder<User>(
                  future: UserController().userInformation(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data!.getEmail);
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
              const SizedBox(height: 75),
              MyButton(
                  onTap: () async {
                    UserController().logout();
                  },
                  texto: "Sair",
                  color: Colors.black),
              const SizedBox(height: 15),
              MyButton(
                  onTap: () async {
                    UserController().logout();
                  },
                  texto: "Excluir Conta",
                  color: Colors.red),
            ],
          ),
        ));
  }
}
