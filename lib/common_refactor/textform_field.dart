import 'package:flutter/material.dart';

class text_field extends StatelessWidget {
   text_field({
     required this.width,
     required this.height,
     required this.type,
     required this.label_text,
     required this.radius,
}) ;

  double width;
  double height;
  TextInputType type;
  String label_text;
  double radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        keyboardType: type,
        decoration:InputDecoration(
            labelText: label_text,
            alignLabelWithHint: true,
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(radius)))
        ) ,),
    );
  }
}
