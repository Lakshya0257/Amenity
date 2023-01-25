import 'package:amenityfinal/Administrative/administrative_login.dart';
import 'package:amenityfinal/Servitor/login/servitor_login.dart';
import 'package:amenityfinal/Complainant/Pages/general_airconditioner.dart';
import 'package:amenityfinal/Complainant/login_and_signup/complainant_login.dart';
import 'package:amenityfinal/Servitor/pages/general%20servitor.dart';
import 'package:amenityfinal/Servitor/pages/transportservitor.dart';
import 'package:amenityfinal/common_refactor/TextButton.dart';
import 'package:amenityfinal/common_refactor/background_image.dart';
import 'package:amenityfinal/common_refactor/maxfinite_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Complainant/Pages/general_cleaning.dart';
import 'Complainant/Pages/zoom_drawer_complainant.dart';
import 'Splashscreen/Splash_screen.dart';

//@dart=2.9
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,]);


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {'comp':(context)=>Newcomplaint_airconditioner(),
        'clean':(context)=>Newcomplaint_cleaning(),
        'login':(context)=>Login(),
        'sign':(context)=>signup(),
        'complainant':(context)=>drawers(),
        'universaldrawer':(context)=> drawers1(),
        'generalservitor':(context)=>generalservitor(),
        'noti':(context)=>transportnotice(),
      },
      home: splash(),
    );
  }
}

















class initial_login extends StatefulWidget {
  const initial_login({Key? key}) : super(key: key);

  @override
  State<initial_login> createState() => _initial_loginState();
}

class _initial_loginState extends State<initial_login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: background(
        link: 'https://w0.peakpx.com/wallpaper/525/714/HD-wallpaper-super-amoled-3-abstract-black-dark-thumbnail.jpg',
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 150,horizontal: 40),
            child: Column(
              children: [
                Flexible(
                  flex: 2,
                  fit: FlexFit.loose,
                  child: Container(
                      width: double.maxFinite
                  ),
                ),
                Flexible(
                    flex: 2,
                    fit: FlexFit.loose,
                    child: infinite_container(
                      child: Center(
                        child: DefaultTextStyle(
                          style: const TextStyle(
                            fontSize: 60.0,
                            fontFamily: 'bitter',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,letterSpacing: 2,
                          ),
                          child: AnimatedTextKit(
                            totalRepeatCount: 1,
                            animatedTexts: [
                              TypewriterAnimatedText('Welcome',speed: Duration(milliseconds: 500)),
                            ],
                            onTap: (){},
                          ),
                        ),
                      ),
                    )),
                Flexible(
                    flex: 9,
                    fit: FlexFit.loose,
                    child: infinite_container(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            button(
                                navigator_class: servitorlogin(), width: MediaQuery.of(context).size.width*.70, height: 100, border: 20, color: Colors.blueAccent,
                              child: Center(child: Text('Log In As Servitor',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500,letterSpacing: 1),),
                            )),
                            SizedBox(
                              height: 10,
                            ),
                            button(
                              navigator_class: Login(), width: MediaQuery.of(context).size.width*.70, height: 100, border: 20, color: Colors.blueAccent,
                            child: Center(child: Text('Log In As Complainant',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500,letterSpacing: 1),),),),
                            SizedBox(
                              height: 10,
                            ),
                            button(
                              navigator_class: administrative(), width: MediaQuery.of(context).size.width*.70, height: 100, border: 20, color: Colors.blueAccent,
                              child: Center(child: Text('Log In As Administrative',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500,letterSpacing: 1),)),
                            )
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      )
    );
  }
}







showAlertDialog(BuildContext context) {

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          elevation: 10,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),

          title: Center(child: Text('Invalid!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, ),)),
          content: Container(
            width: double.maxFinite,
            height: 80,
            child: Column(
              children: [
                Text('Inputs are invalid', style: TextStyle(fontSize: 17 ,color: Colors.grey),),
                Text('Please enter valid data', style: TextStyle(fontSize: 17,color: Colors.grey ),),
                Text('Note:  Please remove any white space from username',style: TextStyle(fontSize: 15,color: Colors.blueAccent),)
              ],
            ),
          ),
          actions:[TextButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )]
      );
    },
  );
}
