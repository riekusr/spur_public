import 'package:flutter/material.dart';
import 'package:spur/utils/colors.dart';

convert(int weight) {
  switch (weight) {
    case 1:
      return FontWeight.w100;
    case 2:
      return FontWeight.w200;
    case 3:
      return FontWeight.w300;
    case 4:
      return FontWeight.w400;
    case 5:
      return FontWeight.w500;
    case 6:
      return FontWeight.w600;
    case 7:
      return FontWeight.w700;
    case 8:
      return FontWeight.w800;
    case 9:
      return FontWeight.w900;
  }
}

class TextNunito extends StatelessWidget {
  final string;
  final size;
  final letterspacing;
  final weight;
  final color;
  final data;
  final fontStyle;
  final height;
  final decoration;

  const TextNunito(
    String this.data, {
    Key key,
    this.string,
    this.size = 14,
    this.weight = 6,
    this.letterspacing = 0.44,
    this.color = colorGrey8,
    this.fontStyle,
    this.height,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        decoration: decoration,
        height: height,
        fontFamily: 'Nunito',
        fontSize: size,
        letterSpacing: letterspacing,
        fontWeight: convert(weight),
        color: color,
        fontStyle: fontStyle,
      ),
    );
  }
}
