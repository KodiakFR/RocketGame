import 'package:flutter/material.dart';
import 'package:team_rocket_game/Widgets/Banners/menuBar.dart';
import 'package:team_rocket_game/Widgets/Banners/titleCustom.dart';

class Sale extends StatefulWidget {
  Sale({Key? key}) : super(key: key);

  @override
  State<Sale> createState() => _SaleState();
}

class _SaleState extends State<Sale> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/IMG/Background/background_Sale.jpg'),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TitleCustom(title: 'Vente'),
              ),
              SizedBox(height: 10,),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    color: Colors.white30,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: (() {
                    
                  }), child: Text('Marché Noir')),
                  ElevatedButton(onPressed: (){

                  }, child: Text('Annonces'))
                ],
              ),
            //  MenuBar()
            ],
          ),
        ),
      ),
    );
  }
}
