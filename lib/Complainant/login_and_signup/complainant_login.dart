import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:amenityfinal/Servitor/pages/general%20servitor.dart';
import 'package:amenityfinal/Servitor/pages/transportservitor.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:amenityfinal/Servitor/login/servitor_login.dart';

import '../../main.dart';
import '../../Servitor/pages/medical_servitor.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {

late String username;
late String password ;
final _auth=FirebaseAuth.instance;

  bool showspinner=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ModalProgressHUD(
        inAsyncCall: showspinner,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: double.maxFinite,
                  height: 30,
                  child: Center(child: Text('Welcome Back!',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,letterSpacing: 2,color: Colors.white),))),
              SizedBox(
                  width: double.maxFinite,
                  height: 70,
                  child: Center(child: Text('Please sign in to your account',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300,letterSpacing: .9,color: Colors.grey),))),
              SizedBox(height: 70,),
              Container(
                width: 340,
                height: 60,
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.white24),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: TextFormField(
                    onChanged: (value){
                      username=value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Enter your username',
                      labelStyle: TextStyle(color: Colors.grey,letterSpacing: .9)
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 340,
                height: 60,
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.white24),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: TextFormField(
                    onChanged: (value){
                      password=value;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'Enter your Password',
                        labelStyle: TextStyle(color: Colors.grey,letterSpacing: .9)
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.maxFinite,
                height: 40,
              ),
              Hero(
                tag: 'log',
                child: Container(
                  width: 300,
                  height: 60,
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.blueAccent[700]),
                  child: TextButton(
                    onPressed: ()async{
                      setState((){
                        showspinner=true;
                      });
                      try{
                        final _user=await _auth.signInWithEmailAndPassword(email: username+'@complainant.com', password: password);
                        if(_user!=null){
                          Navigator.of(context).pushNamed('complainant');
                        }
                      }
                      catch(e){
                        print(e);
                        showAlertDialog(context);
                      }
                      setState((){
                        showspinner=false;
                      });
                    },
                      child: Center(child: Text('Sign In',style: TextStyle(color: Colors.white,fontSize: 20),))),
                ),
              ),

              SizedBox(
                width: double.maxFinite,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Dont have an account?',style: TextStyle(color: Colors.grey,fontSize: 12),),
                    TextButton(
                      onPressed: (){
                        Navigator.of(context).pushNamed('sign');
                      },
                        child: Text('Sign Up',style: TextStyle(color: Colors.blue,fontSize: 12),)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}







late int phone;





class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);


  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  late int phone;
  late String username;
  String back='@complainant.com';
  late String password;
  bool showspinner=false;

  final _auth=FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ModalProgressHUD(
        inAsyncCall: showspinner,
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                      width: double.maxFinite,
                      height: 30,
                      child: Center(child: Text('Create new account',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,letterSpacing: 2,color: Colors.white),))),
                  SizedBox(
                      width: double.maxFinite,
                      height: 70,
                      child: Center(child: Text('Please fill in the form to continue',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300,letterSpacing: .9,color: Colors.grey),))),
                  SizedBox(height: 70,),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 340,
                    height: 60,
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.white24),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: TextFormField(
                        onChanged: (value){
                          username=value;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'Create your new Username',
                            labelStyle: TextStyle(color: Colors.grey,letterSpacing: .9)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 340,
                    height: 60,
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.white24),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: TextFormField(
                        onChanged: (value){
                          phone=value as int;
                        },
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            labelText: 'Phone number',
                            labelStyle: TextStyle(color: Colors.grey,letterSpacing: .9)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 340,
                    height: 60,
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.white24),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: TextFormField(
                        onChanged: (value){
                          password=value;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.grey,letterSpacing: .9)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Hero(
                    tag: 'log',
                    child: Container(
                      width: 300,
                      height: 60,
                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.blueAccent[700]),
                      child: TextButton(
                          onPressed: ()async{
                            setState((){
                              showspinner=true;
                            });
                            try{
                              final newuser=await _auth.createUserWithEmailAndPassword(email: username+back, password: password);
                              if(newuser!=null){
                                Navigator.of(context).pushNamed('complainant');
                              }
                            }
                            catch(e){
                              print(e);
                            }
                            setState((){
                              showspinner=false;
                            });

                          },
                          child: Center(child: Text('Sign Up',style: TextStyle(color: Colors.white,fontSize: 20),))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account?',style: TextStyle(color: Colors.grey,fontSize: 12),),
                        TextButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            child: Text('Sign In',style: TextStyle(color: Colors.blue,fontSize: 12),)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}












class menu extends StatefulWidget {
  const menu({Key? key}) : super(key: key);

  @override
  State<menu> createState() => _menuState();
}

class _menuState extends State<menu> {
  final _auth=FirebaseAuth.instance;
  late User loggeduser;
  late String username;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getcurrentuser();
  }
  void getcurrentuser() async{
    try{
      final user= await _auth.currentUser;
      if(user!=null){
        loggeduser=user;
        final mail=loggeduser.email;
        username=mail!;
        print(loggeduser.email);
      }
    }
    catch(e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
              child: CircleAvatar(
                backgroundImage: NetworkImage('https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto,q_auto,f_auto/gigs/177985490/original/7fae26891a298569d94bb883bb9a963e58b37d2e/make-a-minimalistic-avatar-based-on-your-photo.jpg'),
                radius: 1,
              ),
            ),
            Container(
              width: double.infinity,
              height: 70,
              padding: EdgeInsets.fromLTRB(40, 0, 10, 15),
              child: Text(username,style: TextStyle(color: Colors.white,fontSize: 17,letterSpacing: 2),),
            ),
            Divider(
              thickness: 1,
              color: Colors.white,
            ),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 8,
                  ),
                  Icon(Icons.notifications,color: Colors.blueAccent,),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Notifications',style: TextStyle(color: Colors.white,fontSize: 20),)
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 8,
                  ),
                  Icon(Icons.wallet,color: Colors.blueAccent,),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Payment',style: TextStyle(color: Colors.white,fontSize: 20),)
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 8,
                  ),
                  Icon(Icons.question_mark_rounded,color: Colors.blueAccent,),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Help',style: TextStyle(color: Colors.white,fontSize: 20),)
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 8,
                  ),
                  Icon(Icons.info_outline_rounded,color: Colors.blueAccent,),
                  SizedBox(
                    width: 20,
                  ),
                  Text('About Us',style: TextStyle(color: Colors.white,fontSize: 20),)
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 8,
                  ),
                  Icon(Icons.settings,color: Colors.blueAccent,),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Settings',style: TextStyle(color: Colors.white,fontSize: 20),)
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 8,
                  ),
                  Icon(Icons.star_border,color: Colors.blueAccent,),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Rate Us',style: TextStyle(color: Colors.white,fontSize: 20),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


