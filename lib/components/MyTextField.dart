
import 'package:flutter/material.dart';

class Mytextfield extends StatelessWidget {
  TextEditingController txtbox = TextEditingController();
  final String hintText ;
  final bool obsecureText;
  final Color color;
  final double? padding;
  final IconData icon;
   Mytextfield({
    super.key,
    required this.txtbox,
    required this.hintText,
    required this.obsecureText,
    required this.color,
    this.padding,
    required this.icon,
  });
  Widget build(BuildContext context) {
    return Padding(
      padding:   EdgeInsets.symmetric(horizontal: padding ?? 20.0),
      child: TextField(

        controller: txtbox,
        obscureText: obsecureText,
        decoration: InputDecoration(
            prefixIcon: Icon(icon),
            enabledBorder: OutlineInputBorder(
              borderSide:  BorderSide(color:color,width: 2),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: color)
            ),
            hintText:hintText,
            hintStyle: TextStyle(color:color),

        ),
        style: TextStyle(color: color,fontWeight: FontWeight.w900),
      ),
    );
  }
}
