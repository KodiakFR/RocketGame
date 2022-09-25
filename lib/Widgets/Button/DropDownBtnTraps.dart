import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_rocket_game/Models/PlayerModel.dart';
import 'package:team_rocket_game/Models/TrapModel.dart';
import 'package:team_rocket_game/Services/trapServices.dart';
import 'package:team_rocket_game/bloC/TallGrass.Bloc/dropDownValue.bloc.dart';

TrapService trapService = TrapService();

class DropDownBtnTraps extends StatelessWidget {
  final PlayerModel playerModel;

  const DropDownBtnTraps({
    Key? key,
    required this.playerModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TrapModel>>(
        future: trapService.getAllTrapByUid(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<TrapModel> listTrap = snapshot.data!;
            final List<String> nameTraps = [];
            listTrap.forEach((element){
              nameTraps.add(element.name);
            });
            context.read<DropDownValueBloc>().onChangedValue(nameTraps.first);
            return BlocBuilder<DropDownValueBloc,String>(
              builder: ((context, dropDownValue){
              return DropdownButton<String>(
              value: dropDownValue,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              underline: Container(
                height: 2,
                color: Colors.red,
              ),
              onChanged: (String? newValue) {
                context.read<DropDownValueBloc>().onChangedValue(newValue!);
              },
              items: nameTraps.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            );
              }));
            
           
          }
          return Center(child: const CircularProgressIndicator());
        });

  }
}
