import 'package:flutter/material.dart';

class AppSizes {
  static double padding(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.05;

  static double radius(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.04;

  static double icon(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.07;
}