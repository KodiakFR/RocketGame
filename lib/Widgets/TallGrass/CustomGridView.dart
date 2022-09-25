import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_rocket_game/ModelView/TallGrassMV.dart';
import 'package:team_rocket_game/Models/TallGrassModel.dart';
import 'package:team_rocket_game/Models/TrapModel.dart';
import 'package:team_rocket_game/Screens/tallGrass.dart';
import 'package:team_rocket_game/Services/playerServices.dart';
import 'package:team_rocket_game/Services/tallGrassServices.dart';
import 'package:team_rocket_game/Widgets/Button/DropDownBtnTraps.dart';
import 'package:team_rocket_game/Widgets/TallGrass/CustomLockButon.dart';
import 'package:team_rocket_game/bloC/TallGrass.Bloc/dropDownValue.bloc.dart';
import '../../Models/PlayerModel.dart';
import 'TrapPut.dart';

class CustomGridView extends StatelessWidget {
  TallGrassServices tallGrassServices = TallGrassServices();

  Text _timer = Text('');

  CustomGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TallGrassServices _tallGrassServices = TallGrassServices();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Expanded(
      child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(right: 30, left: 30),
          decoration: BoxDecoration(color: Colors.grey[200]!.withOpacity(0.8)),
          child: FutureBuilder<TallGrassMV>(
            future: _tallGrassServices.getTallGrassMV(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: const CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Text(
                    'Erreur de chargment veuillez verifier votre connection internet');
              }

              final TallGrassMV tallGrassMV = snapshot.data!;
              return GridView.count(
                crossAxisCount: 2,
                children: List.generate(6, (index) {
                  if ((index == 1 && tallGrassMV.playerModel.level! < 3) |
                      (index == 2 && tallGrassMV.playerModel.level! < 15) |
                      (index == 3 && tallGrassMV.playerModel.level! < 24) |
                      (index == 4 && tallGrassMV.playerModel.level! < 35) |
                      (index == 5 && tallGrassMV.playerModel.level! < 50)) {
                    return CustomLockButon();
                  } else if (tallGrassMV.tallGrassPlayer.isNotEmpty) {
                    late TallGrassModel tallGrassModel;
                    bool trapIsPut = false;
                    tallGrassMV.tallGrassPlayer.forEach((element) {
                      if (element.id == index) {
                        trapIsPut = true;
                        tallGrassModel = element;
                      }
                    });
                    if (trapIsPut == true) {
                      return TrapPut(
                        tallGrassModel: tallGrassModel,
                      );
                    }
                  }
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (tallGrassMV.trapsPlayer.isNotEmpty) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return SimpleDialog(
                                      title: const Text('Pièges'),
                                      children: [
                                        const Text('Choisissez votre piège'),
                                        DropDownBtnTraps(
                                            playerModel:
                                                tallGrassMV.playerModel),
                                        BlocBuilder<DropDownValueBloc, String>(
                                            builder: ((context, state) {
                                          return ElevatedButton(
                                            onPressed: () {
                                              tallGrassMV.trapsPlayer.forEach(
                                                (element) {
                                                  if (element.name == state) {
                                                    TrapModel _trap = element;
                                                    trapService
                                                        .removeQteInventary(
                                                            _trap.id, 1);
                                                    tallGrassServices.putTrap(
                                                        _trap,
                                                        index,
                                                        tallGrassMV
                                                            .playerModel.city!);
                                                     Navigator.pushReplacementNamed(context, '/tallGrass');
                                                  }
                                                },
                                              );
                                            },
                                            child: const Text('Confirmer!'),
                                          );
                                        }))
                                      ],
                                    );
                                  });
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Attention'),
                                  content: const Text(
                                      'Vous n\'avez plus de piège de disponnible, allez dans le PokeShop pour en acheter!'),
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
                          },
                          child: const Icon(
                            Icons.add_box,
                            color: Colors.red,
                            size: 50,
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red.withOpacity(0), elevation: 0),
                        ),
                        Text('Ajouter un piège')
                      ],
                    ),
                  );
                }),
              );
            },
          )),
    );
  }
}
