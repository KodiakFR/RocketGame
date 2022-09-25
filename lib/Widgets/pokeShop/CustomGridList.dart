import 'package:flutter/material.dart';
import 'package:team_rocket_game/Models/EvolutionStoneModel.dart';
import 'package:team_rocket_game/Models/PlayerModel.dart';
import 'package:team_rocket_game/Models/TrapModel.dart';
import 'package:team_rocket_game/Screens/pokeshop.dart';
import 'package:team_rocket_game/Services/EvolutionStoneServices.dart';
import 'package:team_rocket_game/Services/playerServices.dart';
import 'package:team_rocket_game/Services/trapServices.dart';
import 'package:team_rocket_game/Widgets/Button/DropDownBtnTraps.dart';

class CustomGridList extends StatelessWidget {
  final bool menu;
  final Function(int) onChangedDropdowValue;
  final Function(int) onChangedTotalPrice;
  const CustomGridList({
    required this.menu,
    required this.onChangedDropdowValue,
    required this.onChangedTotalPrice,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    EvolutionStoneServices stoneServices = EvolutionStoneServices();
    TrapService _trapService = TrapService();
    PlayerServices _playerServices = PlayerServices();
    int dropDownValue = 1;
    int totalPrice = 0;
    List<DropdownMenuItem<int>> items = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        .map<DropdownMenuItem<int>>((int value) {
      return DropdownMenuItem<int>(value: value, child: Text(value.toString()));
    }).toList();
    if (menu == true) {
      return Flexible(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: width/25),
          width: MediaQuery.of(context).size.width,
          color: Colors.grey.shade300.withOpacity(0.8),
          child: FutureBuilder<List<TrapModel>>(
              future: _trapService.getAllTraps(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: Text('Chargement...'));
                  
                } 
                if (snapshot.hasError){
                  return Text('il y a une erreur de chargement... ${snapshot.error}');
                }
                else {
                  final List<TrapModel> traps = snapshot.data!;
                  return FutureBuilder<PlayerModel>(
                      future: _playerServices.getPlayer,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(child: Text('Chargement...'));
                        } else {
                          final PlayerModel playerModel = snapshot.data!;
                          return ListView.builder(
                              itemCount: traps.length,
                              itemBuilder: (context, index) {
                                final TrapModel trap = traps[index];
                                if (trap.levelMin > playerModel.level!) {
                                  return ListTile(
                                    leading: Icon(Icons.lock),
                                    trailing: Image.network(
                                        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FTrap%2Finterogation.png?alt=media&token=e7d074db-5686-443f-bf77-b9f6fec2fbcf'),
                                    title: Text('????'),
                                    subtitle: Text(
                                        'Piège disponnible au level ${trap.levelMin}.'),
                                  );
                                }
                                return ListTile(
                                  leading: Text('${trap.price.toString()} ₽'),
                                  trailing: Image.network(trap.url),
                                  title: Text(trap.name),
                                  subtitle: Text(
                                    trap.description!,
                                    textAlign: TextAlign.justify,
                                  ),
                                  isThreeLine: true,
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: Text(trap.name),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text('Combien en voulez vous?'),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            Container(
                                              width: 60,
                                              child: DropdownButtonFormField(
                                                  value: dropDownValue,
                                                  items: items,
                                                  onChanged: (int? newValue) {
                                                    onChangedDropdowValue(
                                                        newValue!);
                                                    dropDownValue = newValue;
                                                  }),
                                            ),
                                          ],
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, 'Retour'),
                                            child: const Text('Retour'),
                                          ),
                                          TextButton(
                                            onPressed: () async {
                                              bool addTrapReturn =
                                                  await trapService.addTrap(
                                                      trap, dropDownValue);
                                              if (addTrapReturn == false) {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) =>
                                                          AlertDialog(
                                                    title:
                                                        const Text('Attention'),
                                                    content: const Text(
                                                        'Vous n\'avez pas assez d\'argent pour acheter tous ça!'),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context, 'OK'),
                                                        child: const Text('OK'),
                                                      )
                                                    ],
                                                  ),
                                                );
                                              } else {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) =>
                                                          AlertDialog(
                                                    title:
                                                        const Text('Attention'),
                                                    content: Text(
                                                        'Vous venez d\'acheter $dropDownValue ${trap.name} '),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        onPressed: () => Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    Pokeshop())),
                                                        child: const Text('OK'),
                                                      )
                                                    ],
                                                  ),
                                                );
                                              }
                                            },
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              });
                        }
                      });
                }
              }),
        ),
      );
    } else {
      return Flexible(
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: width/25),
            width: MediaQuery.of(context).size.width,
            color: Colors.grey.shade300.withOpacity(0.8),
            child: FutureBuilder<List<EvolutionStoneModel>>(
              future: stoneServices.getAllStones(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: Text('Chargement...'),
                  );
                } else {
                  final List<EvolutionStoneModel> stones = snapshot.data!;
                  return ListView.builder(
                      itemCount: stones.length,
                      itemBuilder: (context, index) {
                        final EvolutionStoneModel stone = stones[index];
                        return ListTile(
                          leading: Text('${stone.price.toString()} ₽'),
                          title: Text(stone.name),
                          subtitle: Text(
                            stone.description,
                            textAlign: TextAlign.justify,
                          ),
                          isThreeLine: true,
                          trailing: Image.network(stone.url),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: Text(stone.name),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Combien en voulez vous?'),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      width: 60,
                                      child: DropdownButtonFormField(
                                          value: dropDownValue,
                                          items: items,
                                          onChanged: (int? newValue) {
                                            onChangedDropdowValue(newValue!);
                                            dropDownValue = newValue;
                                          }),
                                    ),
                                  ],
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Retour'),
                                    child: const Text('Retour'),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      bool addTrapReturn = await stoneServices
                                          .buyStone(stone, dropDownValue);
                                      if (addTrapReturn == false) {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            title: const Text('Attention'),
                                            content: const Text(
                                                'Vous n\'avez pas assez d\'argent pour acheter tous ça!'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () =>
                                                    Navigator.pop(context, 'OK'),
                                                child: const Text('OK'),
                                              )
                                            ],
                                          ),
                                        );
                                      } else {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            title: const Text('Félicitation!'),
                                            content: Text(
                                                'Vous venez d\'acheter $dropDownValue ${stone.name} '),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () => Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Pokeshop())),
                                                child: const Text('OK'),
                                              )
                                            ],
                                          ),
                                        );
                                      }
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      });
                }
              },
            )),
      );
    }
  }
}
