import 'package:flutter/material.dart';
import 'package:team_rocket_game/Models/TrapModel.dart';
import 'package:team_rocket_game/Services/EvolutionStoneServices.dart';
import 'package:team_rocket_game/Services/trapServices.dart';
import '../../Models/EvolutionStoneModel.dart';

class Widget_gridlist_Inventary extends StatelessWidget {
  final String menu;
  Widget_gridlist_Inventary({
    Key? key,
    required this.menu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TrapService trapService = TrapService();
    EvolutionStoneServices evolutionStoneServices = EvolutionStoneServices();
    switch (menu) {
      case 'Pièges':
        return Flexible(
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.grey.shade300.withOpacity(0.8),
            margin: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: FutureBuilder<List<TrapModel>>(
              future: trapService.getAllTrapByUid(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: Text('Chargement...'));
                } else {
                  final List<TrapModel> traps = snapshot.data!;
                  return ListView.builder(
                      itemCount: traps.length,
                      itemBuilder: (context, index) {
                        final TrapModel trap = traps[index];
                        return ListTile(
                          leading: Container(width: 60, height: 60, child: Image.network(trap.url)),
                          title: Text(trap.name),
                          trailing: Text('x ${trap.qantity}'),
                        );
                      });
                }
              },
            ),
          ),
        );
      case 'Baies':
        return Flexible(
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.grey.shade300.withOpacity(0.8),
            margin: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: FutureBuilder<List<TrapModel>>(
              future: trapService.getAllTrapByUid(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: Text('Chargement...'));
                } else {
                  final List<TrapModel> traps = snapshot.data!;
                  return ListView.builder(
                      itemCount: traps.length,
                      itemBuilder: (context, index) {
                        final TrapModel trap = traps[index];
                        return ListTile(
                          title: Text(trap.name),
                          trailing: Text('x ${trap.qantity}'),
                        );
                      });
                }
              },
            ),
          ),
        );
      case 'Pierres':
        return Flexible(
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.grey.shade300.withOpacity(0.8),
            margin: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: FutureBuilder<List<EvolutionStoneModel>>(
              future: evolutionStoneServices.getAllStonesByUid(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: Text('Chargement...'));
                } else {
                  final List<EvolutionStoneModel> stones = snapshot.data!;
                  return ListView.builder(
                      itemCount: stones.length,
                      itemBuilder: (context, index) {
                        final EvolutionStoneModel stone = stones[index];
                        return ListTile(
                          leading: Container(width: 60, height: 60, child: Image.network(stone.url)),
                          title: Text(stone.name),
                          trailing: Text('x ${stone.qantity}'),
                        );
                      });
                }
              },
            ),
          ),
        );
      default:
        return Flexible(child: Container());
    }
  }
}
