import 'package:flutter/material.dart';
import 'package:team_rocket_game/Models/PlayerModel.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProfilBanner extends StatelessWidget {
  final PlayerModel playerModel;

  const ProfilBanner({
    Key? key,
    required this.playerModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        padding: const EdgeInsets.only(right: 50),
        margin: const EdgeInsets.only(left: 15),
        height: 105,
        width: 330,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 5, top: 2),
                  margin: const EdgeInsets.only(top: 10, left: 20),
                  width: 120,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Text(
                    playerModel.pseudo!,
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 10, top: 2),
                          margin: const EdgeInsets.only(top: 10, right: 30),
                          width: 100,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Text(
                            '${playerModel.money}',
                            style: const TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 90, top: 10),
                          height: 20,
                          width: 20,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('lib/IMG/Icons/IconPokeCoin.png'),
                          )),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 5, top: 2),
                  margin: const EdgeInsets.only(left: 20),
                  width: 170,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Text(
                    'Ville : ${playerModel.city}',
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 5, top: 2),
                  margin: const EdgeInsets.only(right: 30),
                  width: 50,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Text(
                    ' ${DateFormat('hh:mm').format(DateTime.now().toLocal())}',
                    style: const TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.end,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 5, top: 2),
                  margin: const EdgeInsets.only(bottom: 10, left: 20),
                  width: 60,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Text(
                    'Level ${playerModel.level}',
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                LinearPercentIndicator(
                  padding: const EdgeInsets.only(bottom: 10, right: 20),
                  width: 180,
                  lineHeight: 8,
                  percent: ((playerModel.xpActually! * 100) /
                          playerModel.xpNextLevel!) /
                      100,
                  backgroundColor: Colors.white,
                  progressColor: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
      Container(
        height: 105,
        width: 105,
        margin: const EdgeInsets.only(
          left: 275,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'lib/IMG/Icons/IconPokeballrocket.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
      )
    ]);
  }
}
