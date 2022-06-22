// ignore_for_file: non_constant_identifier_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:team_rocket_game/Models/PokemonModel.dart';

class PokemonDataBase {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> addAllPokemon() async {
    List<PokemonModel> pokemons = [];
    //Bulbizard
    PokemonModel bulbizard = PokemonModel(
        001,
        "Bulbizarre",
        "SSR",
        "Plante",
        0,
        16,
        002,
        'Plante',
        5000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F001%20-%20Bulbizar.png?alt=media&token=f32af28b-b442-487e-8fb9-0425662b4512',
        ['Bourpalette']);
    pokemons.add(bulbizard);
    //Herbizarre
    PokemonModel Herbizarre = PokemonModel(
        002,
        "Herbizarre",
        "SSR",
        "Plante",
        16,
        32,
        003,
        'Plante',
        6000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F002%20-%20Herbizar.png?alt=media&token=4eb7b964-2e23-4a92-b446-6d960921969c',
        null);
    pokemons.add(Herbizarre);
    //Florizarre
    PokemonModel Florizarre = PokemonModel(
        003,
        "Florizarre",
        "LR",
        "Plante",
        32,
        null,
        null,
        null,
        7000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F003%20-%20Florizar.png?alt=media&token=75354099-5774-4877-b361-f520a85987dc',
        null);
    pokemons.add(Florizarre);
    //Salamèche
    PokemonModel Salameche = PokemonModel(
        004,
        "Salamèche",
        "SSR",
        "Feu",
        0,
        16,
        005,
        'Feu',
        5000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F004%20-%20Salameche.png?alt=media&token=bced257e-69d6-43cb-95e2-01694ea5f401',
        ['Bourpalette']);
    pokemons.add(Salameche);
    //Reptincel
    PokemonModel Reptincel = PokemonModel(
        005,
        "Reptincel",
        "SSR",
        "Feu",
        16,
        36,
        006,
        'Feu',
        6000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F005%20-%20Reptincel.png?alt=media&token=514b50e8-e7a9-4219-af77-08746ec7e0c8',
        null);
    pokemons.add(Reptincel);
    //Dracaufeu
    PokemonModel Dracaufeu = PokemonModel(
        006,
        "Dracaufeu",
        "LR",
        "Feu",
        36,
        null,
        null,
        null,
        7000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F006%20-%20Dracaufeu.png?alt=media&token=779617aa-4428-4587-84d6-b05289358306',
        null);
    pokemons.add(Dracaufeu);
    //Carapuce
    PokemonModel Carapuce = PokemonModel(
        007,
        "Carapuce",
        "SSR",
        "Eau",
        0,
        16,
        008,
        'Eau',
        5000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F007%20-%20Carapuce.png?alt=media&token=31fdf533-d620-4f73-8359-f4ec0a98d484',
        ['Bourpalette']);
    pokemons.add(Carapuce);
    //Carabaffe
    PokemonModel Carabaffe = PokemonModel(
        008,
        "Carabaffe",
        "SSR",
        "Eau",
        16,
        36,
        009,
        'Eau',
        6000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F008%20-%20Carabaffe.png?alt=media&token=de7417a2-3157-4934-9b0f-90c39179c2b9',
        null);
    pokemons.add(Carabaffe);
    //Tortank
    PokemonModel Tortank = PokemonModel(
        009,
        "Tortank",
        "LR",
        "Eau",
        36,
        null,
        null,
        null,
        7000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F009%20-%20Tortank.png?alt=media&token=14dd0413-bcbc-4bcf-af5a-f4bac71a66e8',
        null);
    pokemons.add(Tortank);
    //Chenipan
    PokemonModel Chenipan = PokemonModel(
        010,
        "Chenipan",
        "N",
        "Insecte",
        0,
        7,
        011,
        null,
        600,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F010%20-%20Chenipan.png?alt=media&token=2b9a2ca5-2c71-4109-a794-e5440f00b395',
        ['Jadielle', 'Azuria']);
    pokemons.add(Chenipan);
    //Chrysacier
    PokemonModel Chrysacier = PokemonModel(
        011,
        "Chrysacier",
        "R",
        "Insecte",
        7,
        10,
        012,
        null,
        1000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F011%20-%20Chrysacier.png?alt=media&token=9db536c0-183c-4ddf-98fb-91a358b3c36c',
        ['Jadielle', 'Azuria']);
    pokemons.add(Chrysacier);
    //Papilusion
    PokemonModel Papilusion = PokemonModel(
        012,
        "Papilusion",
        "SR",
        "Insecte",
        10,
        null,
        null,
        null,
        1400,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F012%20-%20Papilusion.png?alt=media&token=c3a74464-aaea-4ccb-bfb9-e2bc6a7f9575',
        null);
    pokemons.add(Papilusion);
    //Aspicot
    PokemonModel Aspicot = PokemonModel(
        013,
        "Aspicot",
        "N",
        "Insecte",
        0,
        7,
        014,
        null,
        600,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F013%20-%20Aspicot.png?alt=media&token=0f59eb14-ed57-45f3-9bb3-1c95f6cc3108',
        ['Jadielle', 'Azuria']);
    pokemons.add(Aspicot);
    //Coconfort
    PokemonModel Coconfort = PokemonModel(
        014,
        "Coconfort",
        "R",
        "Insecte",
        7,
        10,
        015,
        null,
        1000,
        "https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F014%20-%20Coconfort.png?alt=media&token=20ba0c36-f8d0-47d1-a22e-e89e1471cd0e",
        ['Jadielle', 'Azuria']);
    pokemons.add(Coconfort);
    //Dardargnan
    PokemonModel Dardargnan = PokemonModel(
        015,
        "Dardargnan",
        "SR",
        "Insecte",
        10,
        null,
        null,
        null,
        1400,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F015%20%20-%20Dardargan.png?alt=media&token=bae839ee-f2b8-4d73-b545-c34f875b107b',
        null);
    pokemons.add(Dardargnan);
    //Roucool
    PokemonModel Roucool = PokemonModel(
        016,
        "Roucool",
        "N",
        "Vol",
        0,
        18,
        017,
        null,
        600,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F016%20-%20Roucool.png?alt=media&token=97dab97e-4e20-4425-8c2e-f3db3030c88e',
        [
          'Bourpalette',
          'Jadielle',
          'Argenta',
          'Azuria',
          'Carmin sur mer',
          'Lavanville',
          'Safrania',
          'Parmanie'
        ]);
    pokemons.add(Roucool);
    //Roucoups
    PokemonModel Roucoups = PokemonModel(
        017,
        "Roucoups",
        "R",
        "Vol",
        18,
        36,
        018,
        null,
        1000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F017%20-%20Roucoups.png?alt=media&token=a0b57abf-d52b-4169-a41e-d522ab73c5dd',
        ['Carmin sur mer', 'Parmanie']);
    pokemons.add(Roucoups);
    //Roucarnage
    PokemonModel Roucarnage = PokemonModel(
        018,
        "Roucarnage",
        "SR",
        "Vol",
        36,
        null,
        null,
        null,
        1400,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F018%20-%20Roucarnarge.png?alt=media&token=79e8aee0-4d05-4d7f-a3cb-96584367aaa1',
        null);
    pokemons.add(Roucarnage);
    //Rattata
    PokemonModel Rattata = PokemonModel(
        019,
        "Rattata",
        "N",
        "Normal",
        0,
        20,
        020,
        null,
        600,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F019%20-%20Rattata.png?alt=media&token=1b8d6a47-e96b-40b0-bb51-e43dcd25d4c4',
        [
          'Bourpalette',
          'Jadielle',
          'Argenta',
          'Azuria',
          'Céladopole',
          'Parmanie',
          'Cramois\'Ile',
          'Plateau Indigo'
        ]);
    pokemons.add(Rattata);
    //Rattatac
    PokemonModel Rattatac = PokemonModel(
        020,
        "Rattatac",
        "R",
        "Normal",
        20,
        null,
        null,
        null,
        1000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F020%20-%20Rattatac.png?alt=media&token=44eb4e21-78b0-4c19-a1ab-7262594cf148',
        ['Céladopole', 'Parmanie', 'Cramois\'Ile']);
    pokemons.add(Rattatac);
    //Piafabec
    PokemonModel Piafabec = PokemonModel(
        021,
        "Piafabec",
        "N",
        "Vol",
        0,
        20,
        022,
        null,
        600,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F021%20-%20Piafabec.png?alt=media&token=5378bd84-2854-470a-a3b3-ab6e3f933d00',
        [
          'Argenta',
          'Azuria',
          'Carmin sur mer',
          'Safrania',
          'Parmanie',
          'Plateau Indigo',
          'Centrale'
        ]);
    pokemons.add(Piafabec);
    //Rapasdepic
    PokemonModel Rapasdepic = PokemonModel(
        022,
        "Rapasdepic",
        "R",
        "Vol",
        20,
        null,
        null,
        null,
        1000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F022%20-%20Rapasdepic.png?alt=media&token=7f5d41af-5e73-4acb-87ed-9e575f6dc0ae',
        ['Céladopole', 'Parmanie', 'Iles Ecume']);
    pokemons.add(Rapasdepic);
    //Abo
    PokemonModel Abo = PokemonModel(
        023,
        "Abo",
        "R",
        "Poison",
        0,
        22,
        024,
        null,
        1000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F023%20-%20Abbo.png?alt=media&token=fa8f70db-ae28-4568-b7e2-1f12125c67cd',
        [
          'Argenta',
          'Azuria',
          'Carmin sur mer',
          'Safrania',
          'Plateau Indigo',
          'Centrale'
        ]);
    pokemons.add(Abo);
    //Arbok
    PokemonModel Arbok = PokemonModel(
        024,
        "Arbok",
        "SR",
        "Poison",
        22,
        null,
        null,
        null,
        1400,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F024%20-%20Arbok.png?alt=media&token=3c4c10b7-4f29-433b-b594-8325d2a4e355',
        ['Plateau Indigo']);
    pokemons.add(Arbok);
    //Pikachu
    PokemonModel Pikachu = PokemonModel(
        025,
        "Pikachu",
        "SR",
        "Electique",
        0,
        null,
        026,
        'Electique',
        1400,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F025%20-%20pikachu.png?alt=media&token=f734c5ae-3728-4e14-9cac-c4cdc8223668',
        ['Jadielle', 'Centrale']);
    pokemons.add(Pikachu);
    //Raichu
    PokemonModel Raichu = PokemonModel(
        026,
        "Raichu",
        "SSR",
        "Electique",
        0,
        null,
        null,
        null,
        2000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F026%20-%20raichu.png?alt=media&token=1afc1ba1-f4d0-4b69-bb61-4b7290b22e2d',
        ['Jadielle', 'Centrale']);
    pokemons.add(Raichu);
    //Sabelette
    PokemonModel Sabelette = PokemonModel(
        027,
        "Sabelette",
        "R",
        "Sol",
        0,
        22,
        028,
        null,
        1000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F027%20-%20Sabelette.png?alt=media&token=256127f9-777d-4e66-956e-e7727e5ee606',
        [
          'Argenta',
          'Azuria',
          'Carmin sur mer',
          'Safrania',
          'Plateau Indigo',
          'Centrale'
        ]);
    pokemons.add(Sabelette);
    //Sablaireau
    PokemonModel Sablaireau = PokemonModel(
        028,
        "Sablaireau",
        "SR",
        "Sol",
        22,
        null,
        null,
        null,
        1400,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F028%20-%20Sablaireau.png?alt=media&token=57cf19c9-014d-440f-aec1-c5cc581492e6',
        ['Plateau Indigo']);
    pokemons.add(Sablaireau);
    //Nidoran femelle
    PokemonModel NidoranFemelle = PokemonModel(
        029,
        "Nidoran femelle",
        "R",
        "Poison",
        0,
        16,
        030,
        'Lune',
        1000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F029%20-%20Nidoran.png?alt=media&token=0d5a026c-9b2b-427d-8c53-c2e000ff75b2',
        ['Argenta', 'Parc Safari']);
    pokemons.add(NidoranFemelle);
    //Nidorina
    PokemonModel Nidorina = PokemonModel(
        030,
        "Nidorina",
        "SR",
        "Poison",
        16,
        null,
        031,
        'Lune',
        1400,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F030%20-%20Nidorina.png?alt=media&token=025653ee-1e9d-4195-81ba-0b18fc09ac22',
        ['Parc Safari']);
    pokemons.add(Nidorina);
    //Nidoqueen
    PokemonModel Nidoqueen = PokemonModel(
        031,
        "Nidoqueen",
        "SSR",
        "Poison",
        16,
        null,
        null,
        null,
        2000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F031%20-%20Nidoqueen.png?alt=media&token=4cd4736a-57d9-4d85-97fd-19e550a5044d',
        null);
    pokemons.add(Nidoqueen);
    //Nidoran mâle
    PokemonModel NidoranMale = PokemonModel(
        032,
        "Nidoran mâle",
        "R",
        "Poison",
        0,
        16,
        033,
        'Lune',
        1000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F032%20-%20Nidoran.png?alt=media&token=3ce5a898-234d-4357-a0b4-a74c5405c7e7',
        ['Argenta', 'Parc Safari']);
    pokemons.add(NidoranMale);
    //Nidorino
    PokemonModel Nidorino = PokemonModel(
        033,
        "Nidorino",
        "SR",
        "Poison",
        16,
        null,
        034,
        'Lune',
        1400,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F033%20-%20Nidorino.png?alt=media&token=d2fd8678-9409-4505-80d9-09a0878e55c4',
        ['Parc Safari']);
    pokemons.add(Nidorino);
    //Nidoking
    PokemonModel Nidoking = PokemonModel(
        034,
        "Nidoking",
        "SSR",
        "Poison",
        16,
        null,
        null,
        null,
        2000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F034%20-%20Nidoking.png?alt=media&token=8b2840a0-d870-4ea6-ab89-1bdf26d2e760',
        null);
    pokemons.add(Nidoking);
    //Melofée
    PokemonModel Melofee = PokemonModel(
        035,
        "Melofée",
        "SR",
        "Fée",
        0,
        null,
        036,
        'Lune',
        1400,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F035%20-%20Melofee.png?alt=media&token=f52d1b5a-f03b-4db8-a020-e9b1cb0a8686',
        ['Céladopole']);
    pokemons.add(Melofee);
    //Melodelfe
    PokemonModel Melodelfe = PokemonModel(
        036,
        "Melodelfe",
        "SSR",
        "Fée",
        0,
        null,
        null,
        null,
        2000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F036%20-%20M%C3%A9lodelfe.png?alt=media&token=c8edcc47-ce29-439c-b301-b167637b22e4',
        null);
    pokemons.add(Melodelfe);
    //Goupix
    PokemonModel Goupix = PokemonModel(
        037,
        "Goupix",
        "SR",
        "Feu",
        0,
        null,
        038,
        'Feu',
        1400,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F037%20-%20Goupix.png?alt=media&token=e140125c-9a43-42f9-8ddd-a78d29d86c0a',
        ['Safrania', 'Cramois\'Ile']);
    pokemons.add(Goupix);
    //Feunard
    PokemonModel Feunard = PokemonModel(
        038,
        "Feunard",
        "SSR",
        "Feu",
        0,
        null,
        null,
        null,
        2000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F038%20-%20Feunard.png?alt=media&token=8827ff30-7888-4d9c-9183-0706831b5eba',
        null);
    pokemons.add(Feunard);
    //Rondoudou
    PokemonModel Rondoudou = PokemonModel(
        039,
        "Rondoudou",
        "SR",
        "Fée",
        0,
        null,
        040,
        'Lune',
        1400,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F039%20-%20Rondoudou.png?alt=media&token=54472338-3e76-4e9b-a2bf-db11db5f895e',
        ['Argenta']);
    pokemons.add(Rondoudou);
    //Grodoudou
    PokemonModel Grodoudou = PokemonModel(
        040,
        "Grodoudou",
        "SSR",
        "Fée",
        0,
        null,
        null,
        null,
        2000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F040%20-%20Grodoudou.png?alt=media&token=9bf378e7-d346-45aa-8560-c68dae59c843',
        null);
    pokemons.add(Grodoudou);
    // Nosferalti
    PokemonModel Nosferalti = PokemonModel(
        041,
        "Nosferalti",
        "N",
        "Poison",
        0,
        22,
        042,
        null,
        600,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F041%20-%20Nosferapti.png?alt=media&token=2775b420-6eea-4fa0-8a3d-cf9f605d5e5a',
        ['Argenta', 'Azuria', 'Plateau Indigo', 'Iles Ecume']);
    pokemons.add(Nosferalti);
    // Nosferalto
    PokemonModel Nosferalto = PokemonModel(
        042,
        "Nosferalto",
        "R",
        "Poison",
        22,
        null,
        null,
        null,
        1000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F042%20-%20Nosferalo.png?alt=media&token=9f2f99fb-52cc-4ec9-9186-f7b07291eae7',
        ['Azuria', 'Plateau Indigo', 'Iles Ecume']);
    pokemons.add(Nosferalto);
    // Mystherbe
    PokemonModel Mystherbe = PokemonModel(
        043,
        "Mystherbe",
        "N",
        "Plante",
        0,
        21,
        044,
        'Plante',
        600,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F043%20-%20Mystherbe.png?alt=media&token=2ad04ae6-c76f-4e0a-9f82-e7a64faff143',
        ['Azuria', 'Carmin sur mer', 'Lavanville', 'Safrania', 'Parmanie']);
    pokemons.add(Mystherbe);
    // Ortide
    PokemonModel Ortide = PokemonModel(
        044,
        "Ortide",
        "R",
        "Plante",
        21,
        null,
        045,
        'Plante',
        1000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F044%20-%20Orthide.png?alt=media&token=836fd0f2-6911-4458-8646-80093aec2cc9',
        ['Carmin sur mer', 'Lavanville', 'Parc Safari']);
    pokemons.add(Ortide);
    // Rafflesia
    PokemonModel Rafflesia = PokemonModel(
        045,
        "Rafflesia",
        "SSR",
        "Plante",
        21,
        null,
        null,
        null,
        2000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F045%20-%20Raflesia.png?alt=media&token=23774a4e-95f0-41eb-8503-bd14bada6265',
        null);
    pokemons.add(Rafflesia);
    // Paras
    PokemonModel Paras = PokemonModel(
        046,
        "Paras",
        "R",
        "Insecte",
        0,
        24,
        047,
        null,
        1000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F046%20-%20paras.png?alt=media&token=9d346ff7-c2de-4b4b-9564-1b94a4c5a764',
        ['Argenta', 'Parc Safari']);
    pokemons.add(Paras);
    // Parasect
    PokemonModel Parasect = PokemonModel(
        047,
        "Parasect",
        "SR",
        "Insecte",
        24,
        null,
        null,
        null,
        1400,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F047%20-%20parasect.png?alt=media&token=ee812970-407a-4a04-8c9a-543892737254',
        ['Azuria', 'Parc Safari']);
    pokemons.add(Parasect);
    // Mimitoss
    PokemonModel Mimitoss = PokemonModel(
        048,
        "Mimitoss",
        "R",
        "Insecte",
        0,
        31,
        049,
        null,
        1000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F048%20-%20Mimitoss.png?alt=media&token=997e3ec5-1f8d-462c-bebd-65aef26b9907',
        ['Carmin sur mer', 'Lavanville', 'Parmanie', 'Parc Safari']);
    pokemons.add(Mimitoss);
    //Aéromite
    PokemonModel Aeromite = PokemonModel(
        049,
        "Aéromite",
        "SSR",
        "Insecte",
        31,
        null,
        null,
        null,
        2000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F049%20-%20A%C3%A9romite.png?alt=media&token=0b140745-36f2-4444-9048-e4fe371534d1',
        ['Parc Safari']);
    pokemons.add(Aeromite);
    //Taupiqueur
    PokemonModel Taupiqueur = PokemonModel(
        050,
        "Taupiqueur",
        "N",
        "Sol",
        0,
        26,
        051,
        null,
        600,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F050%20-%20Taupiqueur.png?alt=media&token=c663f081-8ecb-4631-a4cf-17be5c6c203d',
        ['Argenta', 'Carmin sur mer']);
    pokemons.add(Taupiqueur);
    //Triopikeur
    PokemonModel Triopikeur = PokemonModel(
        051,
        "Triopikeur",
        "R",
        "Sol",
        26,
        null,
        null,
        null,
        1000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F051%20-%20Triopiqueur.png?alt=media&token=bc1aff8c-0c57-406f-b8a8-763ba30a6cea',
        ['Argenta', 'Carmin sur mer']);
    pokemons.add(Triopikeur);
    //Miaouss
    PokemonModel Miaouss = PokemonModel(
        052,
        "Miaouss",
        "N",
        "Normal",
        0,
        28,
        053,
        null,
        600,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F052%20-%20Miaouss.png?alt=media&token=e081b252-c8ef-4aaa-a682-0e7d4f9ed563',
        ['Safrania']);
    pokemons.add(Miaouss);
    //Persian
    PokemonModel Persian = PokemonModel(
        053,
        "Persian",
        "R",
        "Normal",
        28,
        null,
        null,
        null,
        1000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F053%20-%20persian.png?alt=media&token=85e4e0a1-55ab-4e8a-bbed-847fbe0a57e6',
        ['Safrania']);
    pokemons.add(Persian);
    //Psykokwak
    PokemonModel Psykokwak = PokemonModel(
        054,
        "Psykokwak",
        "N",
        "Eau",
        0,
        33,
        055,
        null,
        600,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F054%20-%20Psykokwak.png?alt=media&token=438377ae-46a8-42ab-986c-eafc7657acca',
        [
          'Bourgpalette',
          'Jadielle',
          'Argenta',
          'Azuria',
          'Carmin sur mer',
          'Lavanville',
          'Céladopole',
          'Safrania',
          'Parmanie',
          'Cramois\'Ile',
          'Plateau Indigo',
          'Iles Ecume',
          'Centrale',
          'Parc Safari'
        ]);
    pokemons.add(Psykokwak);
    //Akwakwak
    PokemonModel Akwakwak = PokemonModel(
        055,
        "Akwakwak",
        "SR",
        "Eau",
        33,
        null,
        null,
        null,
        1400,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F055%20-%20Akwakwak.png?alt=media&token=f5c3ab71-0ca1-4d3d-8423-917970b187f4',
        [
          'Azuria',
          'Iles Ecume',
        ]);
    pokemons.add(Akwakwak);
    //Férosinge
    PokemonModel Ferosinge = PokemonModel(
        056,
        "Férosinge",
        "R",
        "Combat",
        0,
        28,
        057,
        null,
        1000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F056%20-%20Ferossinge.png?alt=media&token=a3bac45e-8cb2-4094-bb10-728a14b7e1b4',
        ['Argenta', 'Azuria', 'Plateau Indigo']);
    pokemons.add(Ferosinge);
    //Colossinge
    PokemonModel Colossinge = PokemonModel(
        057,
        "Colossinge",
        "SR",
        "Combat",
        28,
        null,
        null,
        null,
        1400,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F057%20-%20Colossinge.png?alt=media&token=096742ee-4c15-42c9-b2ad-942cda32c4a6',
        ['Azuria', 'Plateau Indigo']);
    pokemons.add(Colossinge);
    //Caninos
    PokemonModel Caninos = PokemonModel(
        058,
        "Caninos",
        "SR",
        "Feu",
        0,
        null,
        059,
        'Feu',
        1400,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F058%20-%20Caninos.png?alt=media&token=23d59f10-bff5-415b-a173-c7d38bc9ae13',
        ['Safrania', 'Cramois\'Ile']);
    pokemons.add(Caninos);
    //Arcanin
    PokemonModel Arcanin = PokemonModel(
        059,
        "Arcanin",
        "SSR",
        "Feu",
        0,
        null,
        null,
        null,
        2000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F059%20-%20Arcanin.png?alt=media&token=6244b4d9-0595-4c12-bfb5-4de616337baf',
        null);
    pokemons.add(Arcanin);
    //Ptitard
    PokemonModel Ptitard = PokemonModel(
        060,
        "Ptitard",
        "N",
        "Eau",
        0,
        25,
        061,
        'Eau',
        600,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F060%20-%20Ptitard.png?alt=media&token=780f8d16-a9a9-427d-8b26-1e9bdb848799',
        [
          'Jadielle',
          'Azuria',
          'Safrania',
          'Parmanie',
          'Plateau Indigo',
          'Parc Safari'
        ]);
    pokemons.add(Ptitard);
    //Têtarte
    PokemonModel Tetarte = PokemonModel(
        061,
        "Têtarte",
        "R",
        "Eau",
        25,
        null,
        062,
        'Eau',
        1000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F061%20-%20T%C3%AAtarte.png?alt=media&token=91b814e9-9fb8-44d7-bc92-d0bce021a35a',
        ['Jadielle', 'Azuria', 'Safrania', 'Plateau Indigo']);
    pokemons.add(Tetarte);
    //Tartard
    PokemonModel Tartard = PokemonModel(
        062,
        "Tartard",
        "SSR",
        "Eau",
        25,
        null,
        null,
        null,
        2000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F062%20-%20Tartard.png?alt=media&token=841e0e69-120f-482c-9333-30da69eaa803',
        null);
    pokemons.add(Tartard);
    //Abra
    PokemonModel Abra = PokemonModel(
        063,
        "Abra",
        "SR",
        "Psy",
        0,
        16,
        064,
        null,
        1400,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F063%20-%20abra.png?alt=media&token=63486fa7-ea5c-4a1c-acf7-1428fd7c73cc',
        ['Azuria']);
    pokemons.add(Abra);
    //Kadabra
    PokemonModel Kadabra = PokemonModel(
        064,
        "Kadabra",
        "SSR",
        "Psy",
        16,
        null,
        065,
        null,
        2000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F064%20-%20kadabra.png?alt=media&token=3bbbd453-0749-4cd2-b6b3-0d50246e033a',
        ['Azuria']);
    pokemons.add(Kadabra);
    //Alakazam
    PokemonModel Alakazam = PokemonModel(
        065,
        "Alakazam",
        "LR",
        "Psy",
        16,
        null,
        null,
        null,
        4000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F065%20-%20alakazam.png?alt=media&token=77aa280a-07db-46ce-8ba9-6ec63b538e07',
        null);
    pokemons.add(Alakazam);
    //Machoc
    PokemonModel Machoc = PokemonModel(
        066,
        "Machoc",
        "SR",
        "Combat",
        0,
        28,
        067,
        null,
        1400,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F066%20-%20Machoc.png?alt=media&token=5bbd3c8e-1498-40c4-b790-b8b7107c973e',
        ['Azuria', 'Plateau Indigo']);
    pokemons.add(Machoc);
    //Machopeur
    PokemonModel Machopeur = PokemonModel(
        067,
        "Machopeur",
        "SSR",
        "Combat",
        28,
        null,
        068,
        null,
        2000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F067%20-%20Machopeur.png?alt=media&token=d6354175-8983-40ee-93f7-7492dd0d8f0d',
        ['Azuria', 'Plateau Indigo']);
    pokemons.add(Machopeur);
    //Mackogneur
    PokemonModel Mackogneur = PokemonModel(
        068,
        "Mackogneur",
        "LR",
        "Combat",
        28,
        null,
        null,
        null,
        4000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F068%20-%20Mackogneur.png?alt=media&token=9a63f41b-38e0-4ae3-8f02-3f344018d686',
        null);
    pokemons.add(Mackogneur);
    //Chétiflor
    PokemonModel Chetiflor = PokemonModel(
        069,
        "Chétiflor",
        "R",
        "Plante",
        0,
        21,
        070,
        'Plante',
        1000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F069%20-%20Ch%C3%A9tiflor.png?alt=media&token=35456fd7-71af-4692-b86b-0022fff0b036',
        ['Azuria', 'Carmin sur mer', 'Lavanville', 'Safrania', 'Parmanie']);
    pokemons.add(Chetiflor);
    //Boustiflor
    PokemonModel Boustiflor = PokemonModel(
        070,
        "Boustiflor",
        "SR",
        "Plante",
        21,
        null,
        071,
        'Plante',
        1400,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F070%20-%20Boustiflor.png?alt=media&token=6310cb83-00a1-4eba-a40e-a9bf1b2d3cc8',
        ['Carmin sur mer', 'Lavanville', 'Parmanie']);
    pokemons.add(Boustiflor);
    //Empiflor
    PokemonModel Empiflor = PokemonModel(
        071,
        "Empiflor",
        "SSR",
        "Plante",
        21,
        null,
        null,
        null,
        2000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F071%20-%20Empliflor.png?alt=media&token=a29229e2-b745-4d39-b716-17557a3f48c3',
        null);
    pokemons.add(Empiflor);
    //Tentacool
    PokemonModel Tentacool = PokemonModel(
        072,
        "Tentacool",
        "N",
        "Eau",
        0,
        30,
        073,
        null,
        600,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F072%20-%20Tentacool.png?alt=media&token=d9eeaa59-7cfa-473b-991f-04af8ad2203c',
        [
          'Bourgpalette',
          'Argenta',
          'Azuria',
          'Carmin sur mer',
          'Lavanville',
          'Parmanie',
          'Cramois\'Ile',
          'Iles Ecume',
          'Centrale'
        ]);
    pokemons.add(Tentacool);
    //Tentacruel
    PokemonModel Tentacruel = PokemonModel(
        073,
        "Tentacruel",
        "SR",
        "Eau",
        30,
        null,
        null,
        null,
        1400,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F073%20-%20Tentacruel.png?alt=media&token=18b56ff9-5d88-4301-9e0f-64b5900d1a49',
        null);
    pokemons.add(Tentacruel);
    //Racaillou
    PokemonModel Racaillou = PokemonModel(
        074,
        "Racaillou",
        "N",
        "Roche",
        0,
        25,
        075,
        null,
        600,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F074%20-%20Racaillou.png?alt=media&token=4db8cfb7-0ce5-4d81-b58f-57460d18d5a5',
        ['Argenta', 'Azuria', 'Plateau Indigo']);
    pokemons.add(Racaillou);
    // Gravalanch
    PokemonModel Gravalanch = PokemonModel(
        075,
        "Gravalanch",
        "SR",
        "Roche",
        25,
        null,
        076,
        null,
        1400,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F075%20-%20Gravalanche.png?alt=media&token=153811d4-986c-4dc8-9f1c-2975a64145fc',
        ['Azuria']);
    pokemons.add(Gravalanch);
    // Grolem
    PokemonModel Grolem = PokemonModel(
        076,
        "Grolem",
        "LR",
        "Roche",
        25,
        null,
        null,
        null,
        4000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F076%20-%20Golem.png?alt=media&token=886f03e5-1c18-418a-8265-37e09dd44be5',
        null);
    pokemons.add(Grolem);
    // Ponyta
    PokemonModel Ponyta = PokemonModel(
        077,
        "Ponyta",
        "SR",
        "Feu",
        0,
        40,
        078,
        null,
        1400,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F077%20-%20ponyta.png?alt=media&token=2a6b68ab-d5d9-480a-87f0-70f54a10747f',
        ["Cramois'Ile"]);
    pokemons.add(Ponyta);
    // Galopa
    PokemonModel Galopa = PokemonModel(
        078,
        "Galopa",
        "SSR",
        "Feu",
        40,
        null,
        null,
        null,
        2000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F078%20-%20Galopa.png?alt=media&token=3aae3bd9-1a4b-4387-99b8-59fddade7b51',
        null);
    pokemons.add(Galopa);
    // Ramoloss
    PokemonModel Ramoloss = PokemonModel(
        079,
        "Ramoloss",
        "N",
        "Eau",
        0,
        37,
        080,
        null,
        600,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F079%20-%20Ramoloss.png?alt=media&token=9a951d66-6e81-4798-8eeb-d6411123bfb3',
        [
          'Bourgpalette',
          'Jadielle',
          'Argenta',
          'Azuria',
          'Carmin sur mer',
          'Lavanville',
          'Céladopole',
          'Safrania',
          'Parmanie',
          'Cramois\'Ile',
          'Plateau Indigo',
          'Iles Ecume',
          'Centrale',
          'Parc Safari'
        ]);
    pokemons.add(Ramoloss);
    // Flagadoss
    PokemonModel Flagadoss = PokemonModel(
        080,
        "Flagadoss",
        "SR",
        "Eau",
        37,
        null,
        null,
        null,
        1400,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F080%20-%20Flagadoss.png?alt=media&token=c3de693b-4d04-417c-9ed1-3bdd73a7a31e',
        ['Azuria', 'Iles Ecume']);
    pokemons.add(Flagadoss);
    // Magnéti
    PokemonModel Magneti = PokemonModel(
        081,
        "Magnéti",
        "R",
        "Electique",
        0,
        30,
        082,
        null,
        1000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F081%20-%20Magneti.png?alt=media&token=79d0f64c-0291-4afd-a16f-cb0eb1a999bd',
        ['Centrale']);
    pokemons.add(Magneti);
    //Magnéton
    PokemonModel Magneton = PokemonModel(
        082,
        "Magnéton",
        "SR",
        "Electique",
        30,
        null,
        null,
        null,
        1400,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F082%20-%20Magneton.png?alt=media&token=aa7603d9-eab2-496a-8e2c-e874befdaa02',
        ['Azuria', 'Centrale']);
    pokemons.add(Magneton);
    //Canarticho
    PokemonModel Canarticho = PokemonModel(
        083,
        "Canarticho",
        "LR",
        "Vol",
        0,
        null,
        null,
        null,
        4000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F083%20-%20Canarticho.png?alt=media&token=207a1a05-8a89-4758-856f-554e0448a507',
        ['Carmin sur mer']);
    pokemons.add(Canarticho);
    //Doduo
    PokemonModel Doduo = PokemonModel(
        084,
        "Doduo",
        "R",
        "Vol",
        0,
        31,
        084,
        null,
        1000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F084%20-%20doduo.png?alt=media&token=ee6edef4-8efa-40fb-b8c3-349d72064623',
        ['Céladopole', 'Parmanie', 'Parc Safari']);
    pokemons.add(Doduo);
    //Dodrio
    PokemonModel Dodrio = PokemonModel(
        085,
        "Dodrio",
        "SR",
        "Vol",
        31,
        null,
        null,
        null,
        1400,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F085%20-%20dodrio.png?alt=media&token=830b01e7-30d1-4bea-afe1-e71ce18b76e2',
        ['Parc Safari']);
    pokemons.add(Dodrio);
    //Otaria
    PokemonModel Otaria = PokemonModel(
        086,
        "Otaria",
        "R",
        "Eau",
        0,
        34,
        087,
        null,
        1000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F086%20-%20Otaria.png?alt=media&token=bd1b3bc8-bb4c-4f09-9a45-10bf4182b400',
        ['Iles Ecume']);
    pokemons.add(Otaria);
    //Lamantine
    PokemonModel Lamantine = PokemonModel(
        087,
        "Lamantine",
        "SR",
        "Eau",
        34,
        null,
        null,
        null,
        1400,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F087%20-%20Lamantine.png?alt=media&token=3217647b-10d7-4461-8ab9-0b7536f92706',
        ['Iles Ecume']);
    pokemons.add(Lamantine);
    //Tadmorv
    PokemonModel Tadmorv = PokemonModel(
        088,
        "Tadmorv",
        "R",
        "Poison",
        0,
        38,
        088,
        null,
        1000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F088%20-%20Tadmorv.png?alt=media&token=5bf3decb-f973-4c21-ab62-fc5c0617b828',
        ['Céladopole', 'Cramois\'Ile']);
    pokemons.add(Tadmorv);
    //Grotadmorv
    PokemonModel Grotadmorv = PokemonModel(
        089,
        "Grotadmorv",
        "SR",
        "Poison",
        38,
        null,
        null,
        null,
        1400,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F089%20-%20Grostadmorv.png?alt=media&token=9e470d69-c53b-4742-a559-428765eaa21c',
        ['Cramois\'Ile']);
    pokemons.add(Grotadmorv);
    //Kokiyas
    PokemonModel Kokiyas = PokemonModel(
        090,
        "Kokiyas",
        "SR",
        "Eau",
        0,
        null,
        091,
        'Eau',
        1400,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F090%20-%20Kokiyas.png?alt=media&token=1181ef92-b78a-4c6e-96b8-74fbb8e9780e',
        ['Bourgpalette', 'Cramois\'Ile']);
    pokemons.add(Kokiyas);
    //Crustabri
    PokemonModel Crustabri = PokemonModel(
        091,
        "Crustabri",
        "SSR",
        "Eau",
        0,
        null,
        null,
        null,
        2000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F091%20-%20Crustabri.png?alt=media&token=2c7cb8a8-c1a0-489d-92fe-7ec41c05ea1f',
        null);
    pokemons.add(Crustabri);
    //Fantominus
    PokemonModel Fantominus = PokemonModel(
        092,
        "Fantominus",
        "R",
        "Spectre",
        0,
        25,
        093,
        null,
        1000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F092%20-%20Fantominus.png?alt=media&token=cb470cd8-b80c-4b77-9dd4-cbd1f1b11d6b',
        ['Lavanville']);
    pokemons.add(Fantominus);
    //Spectrum
    PokemonModel Spectrum = PokemonModel(
        093,
        "Spectrum",
        "SR",
        "Spectre",
        25,
        null,
        094,
        null,
        1400,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F93%20-%20Spectrum.png?alt=media&token=ad14d4ea-22aa-4551-b6b8-bbb8edfe9d2d',
        ['Lavanville']);
    pokemons.add(Spectrum);
    //Ectoplasma
    PokemonModel Ectoplasma = PokemonModel(
        094,
        "Ectoplasma",
        "LR",
        "Spectre",
        25,
        null,
        null,
        null,
        4000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F094%20-%20Ectoplasma.png?alt=media&token=54b59b82-6971-4625-933b-3eb580bf7356',
        null);
    pokemons.add(Ectoplasma);
    //Onix
    PokemonModel Onix = PokemonModel(
        095,
        "Onix",
        "R",
        "Roche",
        0,
        null,
        null,
        null,
        1000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F095%20-%20onix.png?alt=media&token=77fd238e-796a-4185-9a35-b6ccac8ecda3',
        ['Azuria', 'Plateau Indigo']);
    pokemons.add(Onix);
    //Soporifik
    PokemonModel Soporifik = PokemonModel(
        096,
        "Soporifik",
        "R",
        "Psy",
        0,
        26,
        097,
        null,
        1000,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F096%20-%20Soporifique.png?alt=media&token=2026dd72-dfe3-4e2b-8814-cb2e017ecf27',
        ['Carmin sur mer']);
    pokemons.add(Soporifik);
    //Hypnomade
    PokemonModel Hypnomade = PokemonModel(
        097,
        "Hypnomade",
        "SR",
        "Psy",
        26,
        null,
        null,
        null,
        1400,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F097%20-%20hypnomade.png?alt=media&token=be23158d-b7b0-4b86-bb8e-dc8f8d2a3194',
        null);
    pokemons.add(Hypnomade);
    //Krabby
    PokemonModel Krabby = PokemonModel(
        098,
        "Krabby",
        "N",
        "Eau",
        0,
        28,
        099,
        null,
        600,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F098%20-%20krabby.png?alt=media&token=64f738d2-4bfc-47c0-930a-dc57158d7c6e',
        [
          'Bourgpalette',
          'Argenta',
          'Azuria',
          'Carmin sur mer',
          'Lavanville',
          'Parmanie',
          'Cramois\'Ile',
          'Iles Ecume',
          'Centrale'
        ]);
    pokemons.add(Krabby);
    //Krabboss
    PokemonModel Krabboss = PokemonModel(
        099,
        "Krabboss",
        "SR",
        "Eau",
        28,
        null,
        null,
        null,
        1400,
        'https://firebasestorage.googleapis.com/v0/b/roket-game-47bd2.appspot.com/o/IMG%2FPokemon%2F099%20-%20Krabboss.png?alt=media&token=7a1e9c91-8a70-45e9-91cd-7b6956f34f82',
        ['Bourgpalette', 'Parmanie', 'Cramois\'Ile', 'Iles Ecume']);
    pokemons.add(Krabboss);

    pokemons.forEach((pokemon) async {
      DocumentReference documentReference = _firebaseFirestore
          .collection('pokemons')
          .doc(pokemon.id.toString().padLeft(3, '0'));
      DocumentSnapshot snapshot = await documentReference.get();
      if (snapshot.exists) {
      } else {
        await documentReference.set(pokemon.toJson());
      }
    });
  }
}
