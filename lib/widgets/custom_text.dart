import 'package:flutter/material.dart';
class CustomText extends StatelessWidget {
  const CustomText(this.txt,{Key? key,this.txtColor, this.txtSize }) : super(key: key);
  final String txt;
  final Color? txtColor;
  final double? txtSize;
  @override
  Widget build(BuildContext context) {
    return Text(txt,style: TextStyle(color: txtColor,fontSize: txtSize),);
  }
}