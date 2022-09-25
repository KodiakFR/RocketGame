import 'package:bloc/bloc.dart';
import 'TimerEvent.dart';
import 'TimerState.dart';


class TimerBloc extends Bloc<TimerEvent, TimerState> {
  static const int _duration = 60;
  TimerBloc(): super(TimerInitial(_duration)) {
    // TODO: implement event handlers
  }
}
