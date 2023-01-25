import 'package:flutter/material.dart';

class button extends StatelessWidget {
  button({
    required this.navigator_class,
    required this.width,
    required this.height,
    required this.child,
    required this.border,
    required this.color,

});

  Widget navigator_class;
  double width;
  double height;
  Widget child;
  Color color;
  double border;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>navigator_class));
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(border)),color: color,border: Border.all(color: Colors.black,width: 3)),
        child: Center(child: child),
      ),
    );
  }
}
