import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:team_rocket_game/Models/PokemonModel.dart';
import 'package:team_rocket_game/Models/TrapModel.dart';
import 'package:team_rocket_game/Services/playerServices.dart';

import '../Models/PlayerModel.dart';

class PokemonServices {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final  FirebaseStorage storage = FirebaseStorage.instance;
  PlayerServices _playerServices = PlayerServices();

  Future<PokemonModel> catchPokemon(TrapModel trapModel, String city) async {

    PlayerModel playerModel = await _playerServices.getPlayer;

    String pokemonScarcity = trapModel.scarcity;
    String pokemonCity = city;

    final List<PokemonModel> pokemons = [];
    try {
      //récupération de la liste des pokémons
      QuerySnapshot snapshot =
          await _firebaseFirestore.collection('pokemons').get();
      final data = snapshot.docs
          .map((doc) => (doc.data() as Map<String, dynamic>))
          .toList();

      data.forEach((element) {
        PokemonModel pokemonModel = PokemonModel.fromJson(element);
        if (pokemonModel.scarcity == trapModel.scarcity &&
            pokemonModel.cities!.isNotEmpty &&
            pokemonModel.cities!.contains(city)) {
          pokemons.add(pokemonModel);
        }
      });
    } catch (e) {
    }
    //récuparation d'un nombre aléatoire entre 1 et la taille du tableau de pokémon.
    int random = Random().nextInt(pokemons.length);
    PokemonModel pokemonCatch = pokemons[random];
    DocumentReference documentReference = _firebaseFirestore.collection('/players/${_auth.currentUser!.uid}/pokedex/').doc(pokemonCatch.id.toString().padLeft(3,'0'));
    DocumentSnapshot snapshot = await documentReference.get();
    if(snapshot.exists){
      
    }

    return pokemonCatch;
  }

  Future<String> getUrlImage(PokemonModel pokemon) async{
    String url;
  url = await storage.ref('/IMG/Pokemon/${pokemon.id.toString().padLeft(3,'0')} - ${pokemon.name}.png').getDownloadURL();
 
    return url;
  }


}
