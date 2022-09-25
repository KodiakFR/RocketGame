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
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.height;
    return Stack(children: [
      Container(
        padding:
            EdgeInsets.symmetric(vertical: height / 50, horizontal: width / 80),
        height: height / 8,
        width: width / 2.5,
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
                  padding: EdgeInsets.only(left: width / 100),
                  width: width / 5,
                  height: height / 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Text(
                    playerModel.pseudo!,
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: height / 65),
                  ),
                ),
                Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(right: width / 12),
                          padding: EdgeInsets.only(right: width / 150),
                          width: width / 15,
                          height: height / 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Text(
                            '${playerModel.money}',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: height / 65),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: width / 16),
                          height: height / 45,
                          width: width / 40,
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
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: width / 100),
                  width: width / 5,
                  height: height / 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Text(
                    '${playerModel.city}',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: height / 65),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: width / 15,
                  height: height / 50,
                  margin: EdgeInsets.only(right: width / 12),
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Text(
                    ' ${DateFormat('hh:mm').format(DateTime.now().toLocal())}',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: height / 65),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: width/15,
                  height: height/50,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Text(
                    'Level ${playerModel.level}',
                    style:  TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: height / 65
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(right: width/20),
                  child: LinearPercentIndicator(
                    width: width/4,
                    lineHeight: height/180,
                    percent: ((playerModel.xpActually! * 100) /
                            playerModel.xpNextLevel!) /
                        100,
                    backgroundColor: Colors.white,
                    progressColor: Colors.red,
                  ),
                )
              ],
            )
          ],
        ),
      ),
      Container(
        height: height / 8,
        width: width /8,
        margin: EdgeInsets.only(
          left: width / 3,
        ),
        decoration: const BoxDecoration(
          //color: Colors.red,
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
