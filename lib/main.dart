import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_rocket_game/Models/PlayerModel.dart';
import 'package:team_rocket_game/Models/UserModel.dart';
import 'package:team_rocket_game/Screens/connexion.dart';
import 'package:team_rocket_game/Screens/home.dart';
import 'package:team_rocket_game/Screens/pokeshop.dart';
import 'package:team_rocket_game/Screens/register.dart';
import 'package:team_rocket_game/Screens/sale.dart';
import 'package:team_rocket_game/Screens/tallGrass.dart';
import 'package:team_rocket_game/Services/userServices.dart';
import 'package:team_rocket_game/bloC/TallGrass.Bloc/dropDownValue.bloc.dart';
import 'package:team_rocket_game/bloC/playerBloc.dart';
import 'package:team_rocket_game/bloC/user.bloc.dart';
import 'bloC/Register.Bloc/iconPrivatePassword.bloc.dart';
import 'bloC/Register.Bloc/textFieldConfirmPassword.bloc.dart';

bool isFireBaseReady = true;
void main() async {
  //Initialise l'application
  WidgetsFlutterBinding.ensureInitialized();

  //Initialise la connection avec Firebase
  await Firebase.initializeApp();
  //supprime la top bar android
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final UserServices _userServices = UserServices();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => IconPrivatePasswordBloc(true)),
          BlocProvider(create: (context) => TextFieldConfirmPasswordBloc('')),
          BlocProvider(create: (context) => PlayerBloc(PlayerModel.empty()),),
          BlocProvider(create: (context) => UserBloc(UserModel.empty()),),
          BlocProvider(create: (context)=> DropDownValueBloc('')),
        ],
        child: MaterialApp(
          routes: {
            '/home':(context)=> const Home(),
            '/connexion': (context) => const Connexion(),
            '/register': (context) => Register(),
            '/tallGrass': (context) => TallGrass(),
            '/pokeshop' :(context) => const Pokeshop(),
            '/vente' :(context) => Sale(),
          },
          debugShowCheckedModeBanner: false,
          title: 'Rocket Game',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: StreamBuilder(
            stream: _userServices.userConnected,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return const Home();
                }
                return const Connexion();
              }
              return const Scaffold(
                body: SafeArea(
                  child: Center(
                    child: Text('Loadiing...'),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
