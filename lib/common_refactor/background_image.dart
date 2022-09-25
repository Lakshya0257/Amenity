import 'package:flutter/material.dart';

class background extends StatelessWidget {
  background({
    required this.link,
    required this.child,
});
  Widget child;
  String link;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(link),
              fit: BoxFit.cover
          )
      ),
      child: child,
    );
  }
}


