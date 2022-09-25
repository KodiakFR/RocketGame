import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:team_rocket_game/Models/PokedexModel.dart';
import 'package:team_rocket_game/Models/PokemonModel.dart';

class PokedexServices {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> addPokemon(PokemonModel pokemonModel) async {
    try {
      DocumentReference documentReference = _firebaseFirestore
          .collection('players/${_auth.currentUser!.uid}/pokedex')
          .doc(pokemonModel.id.toString().padLeft(3, '0'));
      DocumentSnapshot snapshot = await documentReference.get();
      if (snapshot.exists) {
        int oldQuantity = (await documentReference.get()).get('qantity');
        int newQuantity = oldQuantity + 1;

        PokedexModel pokedexModel = PokedexModel(
          pokemonModel.id,
          pokemonModel.name,
          pokemonModel.scarcity,
          pokemonModel.type,
          pokemonModel.level,
          pokemonModel.levelEvo,
          pokemonModel.idEvo,
          pokemonModel.steelEvo,
          pokemonModel.price,
          pokemonModel.url,
          pokemonModel.cities,
          newQuantity,
        );

        await documentReference.update(pokedexModel.toJson());
      } else {
        PokedexModel pokedexModel =
            PokedexModel(pokemonModel.id,
          pokemonModel.name,
          pokemonModel.scarcity,
          pokemonModel.type,
          pokemonModel.level,
          pokemonModel.levelEvo,
          pokemonModel.idEvo,
          pokemonModel.steelEvo,
          pokemonModel.price,
          pokemonModel.url,
          pokemonModel.cities, 1);

        await documentReference.set(pokedexModel.toJson());
      }
    } catch (e) {
      print(e);
    }
  }

  Future<List<PokedexModel>> getPokedexByUid() async {
    List<PokedexModel> pokedex = [];
    try {
      QuerySnapshot snapshot = await _firebaseFirestore
          .collection('players/${_auth.currentUser!.uid}/pokedex')
          .get();

      final data = snapshot.docs
          .map((doc) => (doc.data() as Map<String, dynamic>))
          .toList();

      data.forEach((element) {
        PokedexModel pokedexModel = PokedexModel.fromJson(element);
        pokedex.add(pokedexModel);
      });
      print(pokedex.length);
    } catch (e) {
      print(e);
    }

    return pokedex;
  }
}
