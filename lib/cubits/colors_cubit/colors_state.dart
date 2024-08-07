import 'package:flutter/material.dart';

abstract class ColorsState {}

class ColorInitialState extends ColorsState {}

class ColorsUpdateState extends ColorsState {
  final Color color;
  final String colorName;
  ColorsUpdateState(this.color, this.colorName);
}
