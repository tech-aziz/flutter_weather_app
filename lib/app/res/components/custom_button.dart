import 'package:flutter/material.dart';

Widget customButton(
    {required String btnName,
    required Color borderColor,
    Color? textColor,
    Color? color,
    required BuildContext context,
    BoxBorder? border}) {
  return Container(
    height: 48,
    width: double.infinity,
    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10),
    decoration: BoxDecoration(
      color: color,
      border: border,
      borderRadius: BorderRadius.circular(4),
    ),
    child: Text(
      textAlign: TextAlign.center,
      btnName,
      style: TextStyle(
        color: textColor,
        fontWeight: FontWeight.bold,
        fontFamily: 'TiroBangla-Italic',
        fontSize: 16,
      ),
    ),
  );
}
