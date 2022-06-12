import 'package:flutter/material.dart';

class TimerProvider with ChangeNotifier {
  Text _timer;

  TimerProvider(this._timer);

  Text get timer => _timer;

  set timer(Text value){
    _timer = value;
    notifyListeners();
  }

}