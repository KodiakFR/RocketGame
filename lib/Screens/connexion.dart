import 'package:flutter/material.dart';
import 'package:team_rocket_game/Models/UserModel.dart';
import 'package:team_rocket_game/Screens/home.dart';
import 'package:team_rocket_game/Screens/register.dart';
import 'package:team_rocket_game/Services/userServices.dart';
import 'package:team_rocket_game/Widgets/TextField/customTextFieldEmail.dart';
import 'package:team_rocket_game/Widgets/TextField/customTextFieldPassword.dart';

class Connexion extends StatefulWidget {
  const Connexion({
    Key? key,
  }) : super(key: key);

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  final RegExp emailRegex = RegExp(r"[a-z0-9\._-]+@[a-z0-9\._-]+\.[a-z]+");
  final UserServices _userServices = UserServices();

  String _email = '';
  String _password = '';
  bool _isSecret = true;

  //image
  late Image backgroundImage;

  final _key = GlobalKey<FormState>();
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
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/IMG/Background/background_home.jpg'),
                  fit: BoxFit.cover)),
          child: Form(
            key: _key,
            child: Container(
              //margin: const EdgeInsets.only(top: 140),
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  CustomTextFieldEmail(
                    email: _email,
                    onChangeEmail: (String value) => setState(() {
                      _email = value;
                    }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldPassword(
                    password: _password,
                    onChangedPassword: (String value) => setState(() {
                      _password = value;
                    }),
                    onChangedSecret: (bool isSecret) => setState(() {
                      _isSecret = !isSecret;
                    }),
                    isSecret: _isSecret,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              UserModel userModel =
                                  UserModel(email: _email, password: _password);
                              _userServices.auth(userModel).then((value) {
                                if (value.uid != null) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Home(),
                                      ));
                                } else {
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('Erreur de connexion'),
                                      content: const Text(
                                          'Veuillez verifier votre mail et mot de passe'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'OK'),
                                          child: const Text('OK'),
                                        )
                                      ],
                                    ),
                                  );
                                }
                              });
                            }
                          },
                          child: const Text('Connection'),
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Register(),
                                ));
                          },
                          child: const Text('Insciption'),
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                        )
                      ])
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
