import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:team_rocket_game/Provider/TimerProvider.dart';
import 'package:team_rocket_game/Screens/connexion.dart';
import 'package:team_rocket_game/Screens/home.dart';
import 'package:team_rocket_game/Services/userServices.dart';

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
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rocket Game',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: ChangeNotifierProvider(
          create: (_) => TimerProvider(Text('')),
          child: StreamBuilder(
            stream: _userServices.userConnected,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return Home();
                }
                return Connexion();
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
