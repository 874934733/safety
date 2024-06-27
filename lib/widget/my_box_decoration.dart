import 'package:flutter/material.dart';
import 'package:safety/util/hextocolor.dart';

BoxDecoration myBoxDecoration(double circular, String color, String border) {
  return BoxDecoration(
    color: HexToColor(color),
    borderRadius: BorderRadius.all(Radius.circular(circular)),
    border: Border.all(width: 1, color: HexToColor(border)),
  );
}
