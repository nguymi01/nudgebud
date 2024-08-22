import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/base/color.dart';

final ThemeData themeData = ThemeData(
  buttonTheme: buttonThemeData,
);
const ButtonThemeData buttonThemeData = ButtonThemeData(
  buttonColor: AppColor.buttonBlue,
);

InputDecoration textFieldStyle(String label,{Color color=AppColor.grayTextField}) {
  return InputDecoration(
      border:  OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColor.gray,
        ),
        borderRadius: BorderRadius.circular(8),

      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColor.darkBlue),
      ),
      floatingLabelStyle: const TextStyle(color: AppColor.darkBlue),
      labelText: label,

      fillColor: color,
      filled: true);
}
