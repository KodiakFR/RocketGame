import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:team_rocket_game/Models/PokedexModel.dart';
import 'package:team_rocket_game/Models/PokemonModel.dart';

class PokedexServices {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> addPokemon(PokemonModel pokemonModel) async {
    print(pokemonModel.toJson());
    try {
      DocumentReference documentReference = _firebaseFirestore
          .collection('players/${_auth.currentUser!.uid}/pokedex')
          .doc(pokemonModel.id.toString().padLeft(3, '0'));
      DocumentSnapshot snapshot = await documentReference.get();
      if (snapshot.exists) {
        int oldQuantity = (await documentReference.get()).get('qantity');
        int newQuantity = oldQuantity + 1;

        PokedexModel pokedexModel = PokedexModel(pokemonModel.id,pokemonModel.name, newQuantity);

        await documentReference.update(pokedexModel.toJson());
      }else{
        PokedexModel pokedexModel = PokedexModel(pokemonModel.id,pokemonModel.name, 1);

        await documentReference.set(pokedexModel.toJson());
      }
    } catch (e) {
      print(e);
    }
  }
}
