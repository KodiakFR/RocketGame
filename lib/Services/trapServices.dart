import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:team_rocket_game/Models/TrapModel.dart';
import 'package:team_rocket_game/Services/playerServices.dart';

import '../Models/PlayerModel.dart';

class TrapService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
   final  FirebaseStorage storage = FirebaseStorage.instance;
   final PlayerServices _playerServices = PlayerServices();

/**
 * Méthode permettant d'ajouter un piège dans l'inventaire du joueur
 * Si le joueur n'avait pas ce piège alors ça écrit un nouveau document en base
 * sinon il change la quantité 
 */
  Future<bool> addTrap(TrapModel trapModel, int qte) async {

    PlayerModel playerModel = await _playerServices.getPlayer;

    int totalPrice = trapModel.price * qte;

    if(playerModel.money! >= totalPrice)
    {
        int newMoneyPlayer = playerModel.money! - totalPrice;

        _playerServices.updateMoney(newMoneyPlayer);

        DocumentReference documentReference = _firebaseFirestore
        .collection('players/${_auth.currentUser!.uid}/trapInventary')
        .doc(trapModel.id);

    DocumentSnapshot documentSnapshot = await documentReference.get();

    if (documentSnapshot.exists) {
      int oldQte = (await documentReference.get()).get('qantity');

      int newQte = oldQte + qte;

      TrapModel inventaryTrapModel = TrapModel(
        trapModel.id,
        trapModel.name,
        trapModel.description,
        trapModel.levelMin,
        trapModel.scarcity,
        trapModel.success,
        trapModel.timer,
        newQte,
        trapModel.price,
        trapModel.url,
      );

      await documentReference.update(inventaryTrapModel.toJson());
      return true;
    } else {
      trapModel.qantity = qte;
      await documentReference.set(trapModel.toJson());
      return true;
    }
      
    }else{
      return false;
    }

  
  }

  /**
   * Méthode qui permet de récupérer un TrapMolde a partir de son ID
   */
  Future<TrapModel> getTrapById(String idTrap) async {
    String id = idTrap;
    String name;
    String description;
    String scarcity;
    int levelMin;
    int success;
    int timer;
    int price;
    String url;

    DocumentReference documentReference =
        _firebaseFirestore.collection('traps').doc(idTrap);

    name = (await documentReference.get()).get('name');
    description = (await documentReference.get()).get('description');
    scarcity = (await documentReference.get()).get('scarcity');
    levelMin = (await documentReference.get()).get('levelMin');
    success = (await documentReference.get()).get('sucess');
    timer = (await documentReference.get()).get('timer');
    price = (await documentReference.get()).get('price');
    url = (await documentReference.get()).get('url');

    return TrapModel.inventory(
      id,
      name,
      description,
      levelMin,
      scarcity,
      success,
      timer,
      price,
      url,
    );
  }

 
  /**
   * Méthode qui permet de récupérer la liste de tous les traps d'un joueur avec l'id du joueur
   */
  Future<List<TrapModel>> getAllTrapByUid() async {
    try {
      final List<TrapModel> traps = [];
      QuerySnapshot snapshot = await _firebaseFirestore
          .collection('players/${_auth.currentUser!.uid}/trapInventary').orderBy('price')
          .get();

      final data = snapshot.docs
          .map((doc) => (doc.data() as Map<String, dynamic>))
          .toList();

      data.forEach((element) {
        TrapModel trapModel = TrapModel.fromJson(element);
        traps.add(trapModel);
      });

      return traps;
    } catch (e) {
      final List<TrapModel> traps = [];
      return traps;
    }
  }

  /**
   * Méthod qui permet inserer un piège dans la collection des hautes herves du joueurs 
   */

  /**
   * Méthode qui permet de suprimer une quantité dans l'inventaire du joueur. 
   * Si la quantité est de 0 on supprime le document 
   */
  Future<void> removeQteInventary(String IdTrapModel, int qteRemove) async {
    try {
      DocumentReference documentReference = _firebaseFirestore
          .collection('players/${_auth.currentUser!.uid}/trapInventary')
          .doc(IdTrapModel);

      TrapModel trapModel = TrapModel(
        (await documentReference.get()).get('id'),
        (await documentReference.get()).get('name'),
        (await documentReference.get()).get('description'),
        (await documentReference.get()).get('levelMin'),
        (await documentReference.get()).get('scarcity'),
        (await documentReference.get()).get('sucess'),
        (await documentReference.get()).get('timer'),
        (await documentReference.get()).get('qantity'),
        (await documentReference.get()).get('price'),
        (await documentReference.get()).get('url'),
      );

      trapModel.qantity = trapModel.qantity! - qteRemove;


      if (trapModel.qantity! == 0) {
        final CollectionReference<Map<String, dynamic>> trapCollection =
            FirebaseFirestore.instance
                .collection('players/${_auth.currentUser!.uid}/trapInventary');
        await trapCollection.doc(IdTrapModel).delete();
      } else {
        await documentReference.set(trapModel.toJson());
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteTrap(String IdTrapModel) async {
    final CollectionReference<Map<String, dynamic>> trapCollection =
        FirebaseFirestore.instance
            .collection('players/${_auth.currentUser!.uid}/trapInventary');
    try {
      return await trapCollection.doc(IdTrapModel).delete();
    } catch (e) {}
  }

  Future<bool> removeTrap(String idTrapModel, int idTallGrass) async {
    TrapModel trap = await getTrapById(idTrapModel);

    int random = 0;
    random = Random().nextInt(100);
    bool trapSuccess;
    if (random < trap.success) {
      trapSuccess = true;
    } else {
      trapSuccess = false;
    }
    final CollectionReference<Map<String, dynamic>> trapCollection =
        FirebaseFirestore.instance
            .collection('players/${_auth.currentUser!.uid}/tallGrass');
    try {
      await trapCollection.doc(idTallGrass.toString()).delete();
    } catch (e) {}
    return trapSuccess;
  }

  Future<List<TrapModel>> getAllTraps() async {
    final List<TrapModel> traps = [];
    try {
      QuerySnapshot snapshot =
          await _firebaseFirestore.collection('traps').orderBy('price').get();

      final data  = snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();

      for (var trap in data) {
        TrapModel trapModel = TrapModel.fromJson(trap);
        traps.add(trapModel);
      }
      } catch (e) {
        print('error : $e');
      }

      return traps;
   
  }

   Future<String> getUrlImage(TrapModel trapModel) async{
    String url;
  url = await storage.ref('/IMG/Trap/${trapModel.id}.png').getDownloadURL();
 
    return url;
  }
}
