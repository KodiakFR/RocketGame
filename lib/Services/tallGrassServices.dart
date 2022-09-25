import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:team_rocket_game/ModelView/TallGrassMV.dart';
import 'package:team_rocket_game/Models/PlayerModel.dart';
import 'package:team_rocket_game/Models/TallGrassModel.dart';
import 'package:team_rocket_game/Models/TrapModel.dart';
import 'package:team_rocket_game/Services/playerServices.dart';
import 'package:team_rocket_game/Services/trapServices.dart';

class TallGrassServices {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  /**
   * Méthode permettant de poser une piège dans les hautes herbes
   */
  Future<void> putTrap(TrapModel trapModel, int index, String city) async {
    DocumentReference documentReference = _firebaseFirestore
        .collection('/players/${_auth.currentUser!.uid}/tallGrass')
        .doc(index.toString());

    DocumentSnapshot snapshot = await documentReference.get();

    //vérifié que le document avec l'index n'existe pas
    if (snapshot.exists) {
    } else {
      DateTime timeInDatetime =
          DateTime.now().add(Duration(minutes: trapModel.timer));

      print('$timeInDatetime + ${trapModel.timer}');

      Timestamp catchTime = Timestamp.fromDate(timeInDatetime);

      TallGrassModel tallGrassModel =
          TallGrassModel(index, trapModel.id, trapModel.name, catchTime, city);

      await documentReference.set(tallGrassModel.toJson());
    }
  }
   /**
    * Méthode qui récupére la liste de piège des hautes herbes
    */
  Future<List<TallGrassModel>> getAllTrapsTallGrass()async{

    final List<TallGrassModel> traps = [];

     QuerySnapshot snapshot = await _firebaseFirestore.collection('/players/${_auth.currentUser!.uid}/tallGrass/').get();

    final data = snapshot.docs.map((doc) => (doc.data() as Map<String, dynamic>)).toList();

    data.forEach((element) {
      TallGrassModel tallGrassModel = TallGrassModel.fromJson(element);
      traps.add(tallGrassModel);
      
    });
     return traps;
  }

  /**
   * Méthode qui récupére un TallGrassMV
   */

  Future<TallGrassMV> getTallGrassMV() async{
    
    PlayerServices _playerServices = PlayerServices();
    TrapService _trapService = TrapService();

    PlayerModel playerModel = await _playerServices.getPlayer;
    List<TrapModel> traps = await _trapService.getAllTrapByUid();
    List<TallGrassModel> tallGrass = await getAllTrapsTallGrass();

    TallGrassMV tallGrassMV = TallGrassMV(playerModel: playerModel, trapsPlayer: traps, tallGrassPlayer: tallGrass);

    return tallGrassMV;
  }
}
