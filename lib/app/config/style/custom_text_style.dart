

import 'package:flutter/cupertino.dart';

TextStyle textStyle(
    {double? fontSize,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
    Color? textColor,
    String? fontFamily}) {
  return TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize,
    color: textColor,
    fontWeight: fontWeight,
    decoration: textDecoration,
  );
}

