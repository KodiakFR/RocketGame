import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:team_rocket_game/Models/EvolutionStoneModel.dart';
import 'package:team_rocket_game/Models/PlayerModel.dart';
import 'playerServices.dart';

class EvolutionStoneServices {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final PlayerServices _playerServices = PlayerServices();

  /**
   * Méthode pour récupérer tout les pierres d'évolution
   */

  Future<List<EvolutionStoneModel>> getAllStones() async {
    List<EvolutionStoneModel> stones = [];

    try {
      QuerySnapshot snapshot =
          await _firebaseFirestore.collection('stones').get();

      final data = snapshot.docs
          .map((doc) => (doc.data() as Map<String, dynamic>))
          .toList();

      data.forEach((stone) {
        EvolutionStoneModel stoneModel = EvolutionStoneModel.fromJson(stone);
        stones.add(stoneModel);
      });
    } catch (e) {
      print(e);
    }

    return stones;
  }

  Future<bool> buyStone(EvolutionStoneModel stone, int qte) async {
    PlayerModel playerModel = await _playerServices.getPlayer;

    int totalPrice = stone.price * qte;
    if (playerModel.money! >= totalPrice) {
      int newMoneyPlayer = playerModel.money! - totalPrice;

     await _playerServices.updateMoney(newMoneyPlayer);
      DocumentReference documentReference = _firebaseFirestore
          .collection('players/${_auth.currentUser!.uid}/stoneInventary')
          .doc(stone.id);
      DocumentSnapshot documentSnapshot = await documentReference.get();

      if (documentSnapshot.exists) {
        int oldQte = (await documentReference.get()).get('qantity');

        int newQte = oldQte + qte;

        EvolutionStoneModel stoneModel = EvolutionStoneModel(
          stone.id,
          stone.name,
          stone.description,
          stone.price,
          newQte,
          stone.type,
          stone.url,
        );
        await documentReference.update(stoneModel.toJson());
        return true;
      } else {
        stone.qantity = qte;
        await documentReference.set(stone.toJson());
        return true;
      }
    } else {
      return false;
    }
  }

  /**
   * Récupération de la liste de piérre d'évolution pocédé par un joueur
   */

  Future<List<EvolutionStoneModel>> getAllStonesByUid() async {
    try {
      final List<EvolutionStoneModel> stones = [];
      QuerySnapshot snapshot = await _firebaseFirestore
          .collection('players/${_auth.currentUser!.uid}/stoneInventary')
          .get();

      final data = snapshot.docs
          .map((doc) => (doc.data() as Map<String, dynamic>))
          .toList();

      data.forEach((element) {
        EvolutionStoneModel stone = EvolutionStoneModel.fromJson(element);
        stones.add(stone);
      });
      return stones;
    } catch (e) {
      final List<EvolutionStoneModel> stones = [];
      return stones;
    }
  }
}
