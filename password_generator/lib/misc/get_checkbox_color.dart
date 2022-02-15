import 'package:flutter/material.dart';
import 'package:password_generator/styles.dart';

Color getColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
    MaterialState.selected,
  };
  if (states.any(interactiveStates.contains)) {
    return Styles.kPrimary;
  }
  return Colors.grey.shade300;
}
