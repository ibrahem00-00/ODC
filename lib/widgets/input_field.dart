import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class InputField extends StatefulWidget {

  String label;
  IconData? icon;
  bool isSecure;
  TextInputType keyboard;
  TextEditingController controller;
  Function validation;
  int maxLines;
  Color labelColor;
  Color borderColor;
  Color iconColor;
  bool alignLabel;
  //Function? onChanged;

  InputField({super.key, this.borderColor=Colors.deepOrange,this.iconColor=Colors.deepOrange,this.alignLabel=false,this.labelColor=Colors.deepOrange,required this.label, this.icon, this.isSecure = false, this.keyboard=TextInputType.text, required this.controller, required this.validation,this.maxLines=1});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {

  var hidePassword = true;
  var eyeIcon = Icons.remove_red_eye;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      maxLines: widget.maxLines,

      inputFormatters: <TextInputFormatter>[
        if(widget.keyboard ==TextInputType.phone )
          FilteringTextInputFormatter.digitsOnly
      ],
      validator:(value)=> widget.validation(value),
      controller: widget.controller,
      keyboardType:widget.keyboard,
      obscureText: widget.isSecure && hidePassword,
      decoration: InputDecoration(
          focusedBorder:  OutlineInputBorder(
              borderSide: BorderSide(color: widget.borderColor)
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:  BorderSide(color: widget.borderColor,width: 2)
          ),
          labelText:widget.label,alignLabelWithHint: widget.alignLabel,
          labelStyle: TextStyle(fontSize: 16,color: widget.labelColor),
          //hintStyle:  TextStyle(fontSize: 16,color: widget.hintColor),
          prefixIcon:Icon(widget.icon,color: widget.iconColor,),
          suffixIcon:widget.isSecure? IconButton(icon: Icon(eyeIcon,color: Colors.deepOrange),onPressed: togglePassword,):null
      ),
    );
  }
  togglePassword(){
    hidePassword = !hidePassword;
    eyeIcon = hidePassword?  Icons.remove_red_eye: Icons.visibility_off;
    setState((){});
  }
}
