import 'package:calculator/ui_helper/colors.dart';
import 'package:flutter/material.dart';

TextStyle inputTextStyle() {
  return const TextStyle(
    fontSize: 39,
    fontWeight: FontWeight.w600,
    color: ColorPallete.inputColorLight,
  );
}

TextStyle operationTextStyle() {
  return const TextStyle(
    fontSize: 39,
    fontWeight: FontWeight.w600,
    color: ColorPallete.operationColorLight,
  );
}

TextStyle resultTextStyle() {
  return const TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w800,
    color: ColorPallete.inputColorLight,
  );
}
