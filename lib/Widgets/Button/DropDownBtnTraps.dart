import 'package:flutter/material.dart';
import 'package:team_rocket_game/Models/PlayerModel.dart';
import 'package:team_rocket_game/Models/TrapModel.dart';
import 'package:team_rocket_game/Services/trapServices.dart';

TrapService trapService = TrapService();

class DropDownBtnTraps extends StatelessWidget {
  final String dropdownValue;
  final Function(String) onValueChange;
  final PlayerModel playerModel;

  const DropDownBtnTraps({
    Key? key,
    required this.dropdownValue,
    required this.onValueChange,
    required this.playerModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TrapModel>>(
        future: trapService.getAllTrapByUid(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<TrapModel> listTrap = snapshot.data!;
            List<String> nameTraps = [];
            listTrap.forEach((element){
              nameTraps.add(element.name);
            });
            return DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              underline: Container(
                height: 2,
                color: Colors.red,
              ),
              onChanged: (String? newValue) {
                onValueChange(newValue!);
              },
              items: nameTraps.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            );
          }
          return const CircularProgressIndicator();
        });
  }
}
