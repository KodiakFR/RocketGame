import 'package:bloc/bloc.dart';

class IconPrivatePasswordBloc extends Cubit<bool>{
  IconPrivatePasswordBloc(super.initialState);

void onChangedSecret(){
  emit(!state);
}
}