import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'general_state.dart';

class GeneralCubit extends Cubit<GeneralState> {
  GeneralCubit() : super(GeneralInitial());

  String dropDownValue = 'عدد التولات';

  void dropDown(String v) {
    dropDownValue = v;
    emit(DropDownMenu());
  }
}
