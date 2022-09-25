import 'dart:developer';

import 'package:amenityfinal/Complainant/Pages/general_airconditioner.dart';
import 'package:amenityfinal/Complainant/Pages/general_cleaning.dart';
import 'package:amenityfinal/Complainant/Pages/general_wifi.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';


String userid = '';

class general extends StatefulWidget {
  const general({Key? key}) : super(key: key);

  @override
  State<general> createState() => _generalState();
}

class _generalState extends State<general> {
  final _auth = FirebaseAuth.instance;
  late User loggeduser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }
  void getCurrentUser() async{
    try{
      final user = await _auth.currentUser;
      if (user!=null){
        loggeduser=user;

        userid = loggeduser.email as String;
      }
    }
    catch(e){
    }
  }




  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: Container(
            )),
        Expanded(
            flex: 1,
            child: Container(
              child: Text('GENERAL',style: TextStyle(fontSize: 35,fontFamily: 'abcd',fontWeight: FontWeight.w500,color: Colors.black),),
            )),
        Expanded(
            flex: 4,
            child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 120,
                child: Image.network('https://i.pinimg.com/originals/8c/22/2c/8c222c3f4bc0a92105d90564f0abac4b.png', scale: 4,))),
        Expanded(
            flex: 3,
            child: Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text('General Complaints', style:
                        TextStyle(color: Colors.black, fontSize: 25, fontFamily: 'abcd'),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        SizedBox(
                          width: 200,
                          child: Divider(
                            thickness: 2,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextButton(
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>complaint_airconditioner()));
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 50,
                          ),
                          Icon(Icons.air_outlined,color: Colors.blueAccent,),
                          SizedBox(
                            width: 20,
                          ),
                          Text('Air Conditioner', style:
                          TextStyle(color: Colors.black, fontSize: 20, fontFamily: 'abcd'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 50,
                        ),
                        Icon(Icons.cleaning_services_outlined,color: Colors.blueAccent,),
                        SizedBox(
                          width: 20,
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>complaint_cleaning()));
                          },
                          child: Text('Cleaning', style:
                          TextStyle(color: Colors.black, fontSize: 20, fontFamily: 'abcd'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 50,
                        ),
                        Icon(Icons.wifi,color: Colors.blueAccent,),
                        SizedBox(
                          width: 20,
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>complaint_wifi()));
                          },
                          child: Text('Wifi', style:
                          TextStyle(color: Colors.black, fontSize: 20, fontFamily: 'abcd'),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),

            )),
      ],
    );
  }
}






