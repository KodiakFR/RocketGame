import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:team_rocket_game/Models/PlayerModel.dart';

class PlayerServices {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> createPlayer(PlayerModel playerModel) async {
    try {
      DocumentReference documentReference =
          _firebaseFirestore.collection('players').doc(playerModel.uid);

      DocumentSnapshot documentSnapshot = await documentReference.get();

      if (documentSnapshot.exists) {}
      await documentReference.set(playerModel.toJson());
    } catch (e) {
      print(e);
    }
  }

  Future<PlayerModel> get getPlayer async {
    if (_auth.currentUser!.uid == null) {}
    try {
      DocumentReference documentReference =
          _firebaseFirestore.collection('players').doc(_auth.currentUser!.uid);

      PlayerModel playerModel = PlayerModel(
        _auth.currentUser!.uid,
        (await documentReference.get()).get('pseudo'),
        (await documentReference.get()).get('genre'),
        (await documentReference.get()).get('money'),
        (await documentReference.get()).get('level'),
        (await documentReference.get()).get('xpNextLevel'),
        (await documentReference.get()).get('xpActually'),
        (await documentReference.get()).get('city'),
        (await documentReference.get()).get('move'),
      );
      return playerModel;
    } catch (e) {
      return PlayerModel.empty();
    }
  }

  /**
   * Permet de mettre à jour l'argent du joueur
   */
  Future<void> updateMoney(int newMoney) async {
    final PlayerServices _playerServices = PlayerServices();

    PlayerModel playerModel = await _playerServices.getPlayer;

    playerModel.money = newMoney;
    playerModel.move = null;
    print(playerModel.move);

    DocumentReference documentReference =
        _firebaseFirestore.collection('players').doc(_auth.currentUser!.uid);

    DocumentSnapshot snapshot = await documentReference.get();
    if (snapshot.exists) {
      await documentReference.update(playerModel.toJson());
    }
  }
}
