import 'package:flutter/material.dart';
import 'package:team_rocket_game/Models/PlayerModel.dart';
import 'package:team_rocket_game/Models/TrapModel.dart';
import 'package:team_rocket_game/Models/UserModel.dart';
import 'package:team_rocket_game/Screens/connexion.dart';
import 'package:team_rocket_game/Services/playerServices.dart';
import 'package:team_rocket_game/Services/userServices.dart';
import 'package:team_rocket_game/Widgets/TextField/customTextFieldConfirmPassword.dart';
import 'package:team_rocket_game/Widgets/TextField/customTextFieldEmail.dart';
import 'package:team_rocket_game/Widgets/TextField/customTextFieldPassword.dart';
import 'package:team_rocket_game/Widgets/TextField/customTextFieldPseudo.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _key = GlobalKey<FormState>();
  final RegExp emailRegex = RegExp(r"[a-z0-9\._-]+@[a-z0-9\._-]+\.[a-z]+");
  String _email = '';
  String _password = '';
  String _confirmPassword = '';
  String _name = '';
  String _genre = 'un garçon';
  Color _colorGenre = Colors.blue;
  bool _sexe = true;
  bool isSecret = true;

  //Images
  late Image backgroundImage;

  final UserServices _userSevices = UserServices();
  final PlayerServices playerServices = PlayerServices();

  @override
  void initState() {
    super.initState();
    backgroundImage = Image.asset('lib/IMG/Background/background_home.jpg');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(backgroundImage.image, context);
  }

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
                          AssetImage("lib/IMG/Background/background_home.jpg"),
                      fit: BoxFit.cover)),
              child: Form(
                key: _key,
                child: Container(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CustomTextFieldPseudo(
                          name: _name,
                          onChangedPseudo: (value) => setState(() {
                                _name = value;
                              })),
                      const SizedBox(height: 10),
                      CustomTextFieldEmail(
                          email: _email,
                          onChangeEmail: (value) => setState(() {
                                _email = value;
                              })),
                      const SizedBox(
                        height: 9,
                      ),
                      CustomTextFieldPassword(
                        password: _password,
                        onChangedPassword: (String value) => setState(() {
                          _password = value;
                        }),
                        onChangedSecret: (bool isSrecret) => setState(() {
                          isSecret = !isSecret;
                        }),
                        isSecret: isSecret,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFieldConfirmPassword(
                          password: _password,
                          confirmPassword: _confirmPassword,
                          onChangedPassword: (String value) => setState(() {
                                _confirmPassword = value;
                              }),
                          onChangedSecret: (bool isSecret) => setState(() {
                                isSecret = !isSecret;
                              }),
                          isSecret: isSecret),
                      Row(
                        children: [
                          Switch(
                            value: _sexe,
                            onChanged: (value) {
                              setState(() {
                                _sexe = !_sexe;
                                if (_sexe == true) {
                                  _genre = 'un garçon';
                                  _colorGenre = Colors.blue;
                                } else {
                                  _genre = 'une fille';
                                  _colorGenre = Colors.pink;
                                }
                              });
                            },
                            activeColor: Colors.blue,
                            inactiveThumbColor: Colors.pink,
                            inactiveTrackColor: Colors.pink,
                          ),
                          Text(
                            'Tu es $_genre',
                            style: TextStyle(
                              color: _colorGenre,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (_key.currentState!.validate()) {
                                  UserModel userModel = UserModel(
                                    email: _email,
                                    password: _password,
                                  );
                                  PlayerModel player;
                                  _userSevices
                                      .create(userModel)
                                      .then((value) => {
                                            if (value.uid != null)
                                              {
                                                player = PlayerModel(
                                                    value.uid,
                                                    _name,
                                                    _sexe,
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
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Connexion(),
                                      ));
                                }
                              },
                              child: const Text('Inscription'),
                              style:
                                  ElevatedButton.styleFrom(primary: Colors.red),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Connexion(),
                                    ));
                              },
                              child: const Text('Connexion'),
                              style:
                                  ElevatedButton.styleFrom(primary: Colors.red),
                            )
                          ])
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
