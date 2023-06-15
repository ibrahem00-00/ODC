import 'package:flutter/material.dart';
class CustomSettingsItem extends StatelessWidget {
   CustomSettingsItem({Key? key,required this.txt,required this.screen}) : super(key: key);
String txt;
Widget screen;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(txt,style: TextStyle(fontSize: 16),),
            IconButton(onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) =>screen,)),icon: Icon(Icons.arrow_forward_ios))
          ],),
      );
  }
}
