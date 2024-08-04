import 'package:flutter/material.dart';
import 'package:flutterdemo/base/color.dart';

final ThemeData themeData = ThemeData(
  buttonTheme: buttonThemeData,

);
const ButtonThemeData buttonThemeData = ButtonThemeData(
  buttonColor: AppColor.buttonBlue,

);

InputDecoration textFieldStyle(String label) {
  return InputDecoration(
    border: const OutlineInputBorder(
        borderSide: BorderSide(
            color: Colors.black)),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color:
      AppColor.darkBlue),

    ),
    floatingLabelStyle: const TextStyle(color: AppColor.darkBlue),
    labelText: label,

  );
}