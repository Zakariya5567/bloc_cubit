import 'package:bloc/bloc.dart';
import 'package:bloc_cubit/cubits/colors_cubit/colors_state.dart';
import 'package:flutter/material.dart';

class ColorsCubit extends Cubit<ColorsState> {
  ColorsCubit() : super(ColorInitialState());

  colorUpdate(Color newColor, String name) {
    emit(ColorsUpdateState(newColor, name));
  }
}
