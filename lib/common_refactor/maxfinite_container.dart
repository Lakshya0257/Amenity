

import 'package:flutter/material.dart';

class infinite_container extends StatelessWidget {
  infinite_container({
    required this.child
});
  Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      child: child,
    );
  }
}
