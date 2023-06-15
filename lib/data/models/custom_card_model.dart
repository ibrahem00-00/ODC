import 'package:flutter/material.dart';

class CustomCardModel {
  String title;
  IconData icon;
  Widget screen;

  CustomCardModel(
      { required this.icon,
        required this.screen,
        required this.title});
}
