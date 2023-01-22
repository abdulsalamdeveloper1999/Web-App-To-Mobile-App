import 'package:flutter/material.dart';
import 'package:web_app/lists/list_holders.dart';

class MyText extends Text {
  MyText(
    String text, {
    double size = 16,
    var textAlign,
    var textDeco,
    FontWeight weight = FontWeight.w400,
    Color color = kdarkblue,
  }) : super(
          text,
          textAlign: textAlign,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: size,
            color: color,
            fontWeight: weight,
            decoration: textDeco,
          ),
        );
}
