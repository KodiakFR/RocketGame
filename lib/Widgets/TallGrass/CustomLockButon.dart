import 'package:flutter/material.dart';

class CustomLockButon extends StatelessWidget {
  const CustomLockButon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: true
                  ? null
                  : (() {
                      print('poser le piège');
                    }),
              child: const Icon(
                Icons.lock,
                color: Colors.grey,
                size: 50,
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.red.withOpacity(0), elevation: 0)),
          const Text(
            'Non disponnible',
            style: TextStyle(),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
