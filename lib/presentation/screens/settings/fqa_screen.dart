import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FqaScreen extends StatefulWidget {
  const FqaScreen({super.key});

  @override
  State<FqaScreen> createState() => _FqaScreenState();
}

class _FqaScreenState extends State<FqaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black,),
        title: Text("FQA",style: TextStyle(fontSize: 20.sp,color: Colors.black),),),
      body:  Container(padding: const EdgeInsets.all(16),
        child: const Card(
          child:ExpansionTile(
            textColor: Colors.black,
                title: Text('Q1 : How many countries Orange Digital Center is in ?'),
                children: <Widget>[
                  ListTile(title: Text('16 Countries')),
                ],
              ),
          ),
      ),
      );
  }
}