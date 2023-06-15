import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:workshopodc/widgets/input_field.dart';

// ignore: must_be_immutable
class SupportScreen extends StatelessWidget {
   SupportScreen({Key? key}) : super(key: key);
  var txtControl =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black,),
        title: Text("Support",style: TextStyle(fontSize: 20.sp,color: Colors.black),),),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InputField(
                controller: txtControl,
                validation: (){},
                icon: Icons.person,
                label: 'Name',
                iconColor: Colors.grey,
                //borderColor:Colors.grey,
                labelColor: Colors.grey,
              ),
              const SizedBox(height: 15,),
              InputField(
                controller: txtControl,
                validation: (){},
                icon: Icons.email,
                label: 'E-mail',
                iconColor: Colors.grey,
                //borderColor:Colors.grey,
                labelColor: Colors.grey,
              ),
              const SizedBox(height: 15,),
              InputField(
                controller: txtControl,
                validation: (){},
                label: "What's making you unhappy?",
                alignLabel: true,
                maxLines: 5,
                iconColor: Colors.grey,
               // borderColor:Colors.grey,
                labelColor: Colors.grey,
              ),
              const SizedBox(height: 15,),
              ElevatedButton(
                  onPressed: (){}, child: const Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
