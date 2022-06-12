import 'dart:async';

import 'package:flutter/material.dart';
import 'package:team_rocket_game/Models/TallGrassModel.dart';
import 'package:team_rocket_game/Models/TrapModel.dart';
import 'package:team_rocket_game/Screens/tallGrass.dart';
import 'package:team_rocket_game/Services/tallGrassServices.dart';
import 'package:team_rocket_game/Widgets/Button/DropDownBtnTraps.dart';
import 'package:team_rocket_game/Widgets/TallGrass/CustomLockButon.dart';
import '../../Models/PlayerModel.dart';
import 'TrapPut.dart';

class CustomGridView extends StatelessWidget {
  final PlayerModel playerModel;
  final List<TrapModel> traps;
  final List<TallGrassModel> allTallGrass;
  final Function(String) onValueChange;
  final Function(Text) onTimerChange;

  TallGrassServices tallGrassServices = TallGrassServices();

  Text _timer = Text('');

  CustomGridView(
      {Key? key,
      required this.playerModel,
      required this.traps,
      required this.allTallGrass,
      required this.onTimerChange,
      required this.onValueChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(right: 30, left: 30),
          decoration: BoxDecoration(color: Colors.grey[200]!.withOpacity(0.8)),
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(6, (index) {
              if ((index == 1 && playerModel.level! < 3) |
                  (index == 2 && playerModel.level! < 15) |
                  (index == 3 && playerModel.level! < 24) |
                  (index == 4 && playerModel.level! < 35) |
                  (index == 5 && playerModel.level! < 50)) {
                return CustomLockButon();
              } else if (allTallGrass.isNotEmpty) {
                late TallGrassModel tallGrassModel;
                bool trapIsPut = false;
                allTallGrass.forEach((element) {
                  if (element.id == index) {
                    trapIsPut = true;
                    tallGrassModel = element;
                  }
                });
                if (trapIsPut == true) {
    
                  return TrapPut(
                      tallGrassModel: tallGrassModel,
                      onChangeTime: (Text value) => onTimerChange(value));
                }
              }
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (traps.isNotEmpty) {
                          String dropdownValue = traps[0].name;
                          showDialog(
                              context: context,
                              builder: (context) {
                                return SimpleDialog(
                                  title: const Text('Pièges'),
                                  children: [
                                    const Text('Choisissez votre piège'),
                                    DropDownBtnTraps(
                                        dropdownValue: dropdownValue,
                                        onValueChange: (value) =>
                                            onValueChange(value),
                                        playerModel: playerModel),
                                    ElevatedButton(
                                      onPressed: () {
                                        traps.forEach(
                                          (element) {
                                            if (element.name == dropdownValue) {
                                              TrapModel _trap = element;
                                              trapService.removeQteInventary(
                                                  _trap.id, 1);
                                              tallGrassServices.putTrap(
                                                  _trap, index, playerModel.city);
                                              Timer(
                                                  Duration(seconds: 0),
                                                  () => Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            TallGrass(),
                                                      )));
                                            }
                                          },
                                        );
                                      },
                                      child: const Text('Confirmer!'),
                                    )
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
                                  onPressed: () => Navigator.pop(context, 'OK'),
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
          )),
    );
  }
}
