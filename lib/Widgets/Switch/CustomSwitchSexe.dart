import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_rocket_game/Models/PlayerModel.dart';
import 'package:team_rocket_game/bloC/playerBloc.dart';

class CustomSwitchSexe extends StatelessWidget {
  const CustomSwitchSexe({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _colorGenre = Colors.blue;
    return Row(
      children: [
        BlocBuilder<PlayerBloc, PlayerModel>(
          builder: (context, playerState) {
              return Switch(
              value: playerState.genre!,
              onChanged: (value) {
               context.read<PlayerBloc>().onChangedGenre();
                if (playerState.genre == false) {
                  print(playerState.genre);
                  _colorGenre = Colors.blue;
                } else {
                  print(playerState.genre);
                  _colorGenre = Colors.pink;
                }
              },
              activeColor: Colors.blue,
              inactiveThumbColor: Colors.pink,
              inactiveTrackColor: Colors.pink,
            );
          },
        ),
        BlocBuilder<PlayerBloc, PlayerModel>(
          builder: (context, state) {
            return Text(
              'Tu es ${context.read<PlayerBloc>().valueGenre()}',
              style: TextStyle(
                color: _colorGenre,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        )
      ],
    );
  }
}
