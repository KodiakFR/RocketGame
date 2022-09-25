import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_rocket_game/Widgets/Switch/CustomSwitchSexe.dart';
import 'package:team_rocket_game/Widgets/TextField/customTextFieldConfirmPassword.dart';
import 'package:team_rocket_game/Widgets/TextField/customTextFieldEmail.dart';
import 'package:team_rocket_game/Widgets/TextField/customTextFieldPassword.dart';
import 'package:team_rocket_game/Widgets/TextField/customTextFieldPseudo.dart';
import 'package:team_rocket_game/bloC/playerBloc.dart';
import 'package:team_rocket_game/bloC/user.bloc.dart';

import '../Models/PlayerModel.dart';
import '../Models/UserModel.dart';
import '../Services/playerServices.dart';
import '../Services/userServices.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);

  final UserServices _userSevices = UserServices();
  final PlayerServices playerServices = PlayerServices();

  final _key = GlobalKey<FormState>();
  final RegExp emailRegex = RegExp(r"[a-z0-9\._-]+@[a-z0-9\._-]+\.[a-z]+");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage('lib/IMG/Background/background_home.jpg'),
                      fit: BoxFit.cover)),
              child: Form(
                key: _key,
                child: Container(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CustomTextFieldPseudo(),
                      SizedBox(height: 10),
                      CustomTextFieldEmail(),
                      SizedBox(height: 10),
                      CustomTextFieldPassword(),
                      SizedBox(height: 10),
                      CustomTextFieldConfirmPassword(),
                      SizedBox(height: 10),
                      CustomSwitchSexe(),
                          BlocBuilder<PlayerBloc, PlayerModel>(
                              builder: (context, playerBloc) {
                                return BlocBuilder<UserBloc, UserModel>(
                                  builder: (context, UserBloc) {
                                    return  Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                        ElevatedButton(
                              onPressed: () {
                                if (_key.currentState!.validate()) {
                                  UserModel userModel = UserModel(
                                    email: UserBloc.email,
                                    password: UserBloc.password,
                                  );
                                  PlayerModel player;
                                  _userSevices
                                      .create(userModel)
                                      .then((value) => {
                                            if (value.uid != null)
                                              {
                                                player = PlayerModel(
                                                  value.uid,
                                                  playerBloc.pseudo,
                                                  playerBloc.genre,
                                                  0,
                                                  1,
                                                  100,
                                                  0,
                                                  'Bourgpalette',
                                                  null,
                                                ),
                                                playerServices
                                                    .createPlayer(player)
                                              }
                                          });
                                 Navigator.pushReplacementNamed(context, '/');
                                }
                              },
                              child: const Text('Inscription'),
                              style:
                                  ElevatedButton.styleFrom(primary: Colors.red),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(context, '/connexion');                              },
                              child: const Text('Connexion'),
                              style:
                                  ElevatedButton.styleFrom(primary: Colors.red),
                            )
                            
                          ]);
                                  },);
                              },)
                    
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
