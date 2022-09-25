
import 'package:flutter/material.dart';

class circular_profile extends StatelessWidget {
  circular_profile({
    required this.width,
    required this.height,
    required this.Padding,
    required this.link,
    required this.radius,

});

  double width;
  double height;
  EdgeInsetsGeometry Padding;
  String link;
  double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: Padding,
      child: CircleAvatar(
        backgroundImage: NetworkImage(link),
        radius: radius,
      ),
    );
  }
}
