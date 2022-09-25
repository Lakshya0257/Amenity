
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../../Complainant/login_and_signup/complainant_login.dart';
import '../pages/general servitor.dart';
import '../../main.dart';
import '../pages/medical_servitor.dart';
import 'package:amenityfinal/Servitor/pages/transportservitor.dart';


class servitorlogin extends StatefulWidget {
  const servitorlogin({Key? key}) : super(key: key);

  @override
  State<servitorlogin> createState() => _servitorloginState();
}

class _servitorloginState extends State<servitorlogin> {

  String username='';
  var dropdownvalue = 'Select which service you provide';
  final items = ['Select which service you provide','General( Air Conditioner, Cleaning, Wifi )','Transportation','Medical'];
  late String name;
  late String password ;
  late String a;
  final _auth=FirebaseAuth.instance;
  bool showspinner=false;

  @override
  Widget build(BuildContext context) {
    if (dropdownvalue == 'General( Air Conditioner, Cleaning, Wifi )'){
      a=username+'_general';
      name=a;
      y=0;
    }
    else if (dropdownvalue == 'Transportation'){
      a=username+'_transport';
      name=a;
      y=1;
    }
    else if(dropdownvalue=='Medical'){
      a=username+'_medical';
      name=a;
      y=2;
    }
    return Scaffold(
      backgroundColor: Colors.black,
      body: ModalProgressHUD(
        inAsyncCall: showspinner,
        child: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
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
                    padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                    child:  DropdownButton(
                      dropdownColor: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      elevation: 9,
                      underline: SizedBox(height: 0,width: 0,),
                      value: dropdownvalue,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: items.map((String items){
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items,style: TextStyle(color: Colors.grey),),);
                      }).toList(),
                      onChanged: (String? newValue){
                        setState((){
                          dropdownvalue=newValue!;
                        });
                      },
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
                SizedBox(height: 40,),
                Container(
                  width: 300,
                  height: 60,
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.blueAccent[700]),
                  child: TextButton(

                      onPressed: ()async{
                        setState((){
                          showspinner=true;
                        });
                        try{
                          final _user=await _auth.signInWithEmailAndPassword(email: name+'@servitor.com', password: password);
                          if(_user!=null){
                            Navigator.of(context).pushNamed('universaldrawer');
                          }
                        }
                        catch(e){
                          name=username;
                          print('error');
                          showAlertDialog(context);
                        }
                        setState((){
                          showspinner=false;
                        });
                      },
                      child: Center(child: Text('Sign In',style: TextStyle(color: Colors.white,fontSize: 20),))),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}











int y =3;








var list=[generalservitor(),transportservitor(),medicalservitor()];



class drawers1 extends StatefulWidget {
  const drawers1({Key? key}) : super(key: key);

  @override
  State<drawers1> createState() => _drawers1State();
}

class _drawers1State extends State<drawers1> {
  final _auth=FirebaseAuth.instance;
  late User loggeduser;
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
        print(loggeduser.email);
      }
    }
    catch(e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: menu(),
      mainScreen: list[y],
      mainScreenTapClose: true,
      androidCloseOnBackTap: true,
      borderRadius: 24.0,
      showShadow: true,
      angle: 0.0,
      drawerShadowsBackgroundColor: Colors.white,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
    );
  }
}
