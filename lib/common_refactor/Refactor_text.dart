import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class text_widget extends StatelessWidget {
  text_widget({
    required this.text,
    required this.size,
    required this.colour,
    required this.weight,
    required this.spacing,
   });
  String text;
  double size;
  Color colour;
  FontWeight weight;
  double spacing;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,style: TextStyle(fontSize: size,color: colour,fontWeight: weight,letterSpacing: spacing),
    );
  }
}



