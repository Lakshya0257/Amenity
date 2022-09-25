import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../common_refactor/Refactor_text.dart';
import '../main.dart';
class splash extends StatelessWidget {
  const splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 90,),
            text_widget(text: 'A', size: 40, colour: Colors.blue, weight: FontWeight.normal, spacing: 0),
            const SizedBox(width: 2,),
            AnimatedTextKit(totalRepeatCount: 2,pause: Duration(milliseconds: 500),animatedTexts: [
              RotateAnimatedText('MENITY',textStyle: TextStyle(color: Colors.white,fontSize: 36)),
              RotateAnimatedText(' SYSTEM TO',textStyle: TextStyle(color: Colors.white,fontSize: 36)),
              RotateAnimatedText('SSIST OTHERS',textStyle: TextStyle(color: Colors.white,fontSize: 36)),

            ] )
          ],
        ),
        duration: 7200,
        backgroundColor: Colors.black54,
        nextScreen: initial_login());
  }
}