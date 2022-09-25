
import 'package:bloc/bloc.dart';

class DropDownValueBloc extends Cubit<String> {
  DropDownValueBloc(super.initialState);

  void onChangedValue(String value) {
    emit(value);
  }
}
