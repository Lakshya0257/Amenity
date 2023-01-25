import 'dart:math';
import 'package:amenityfinal/Complainant/login_and_signup/complainant_login.dart';
import 'package:flutter/material.dart';


class Static_Profile_complaint extends StatefulWidget {
  const Static_Profile_complaint({Key? key}) : super(key: key);

  @override
  State<Static_Profile_complaint> createState() => _Static_Profile_complaintState();
}

class _Static_Profile_complaintState extends State<Static_Profile_complaint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Transform.rotate(
          angle: pi,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(image: DecorationImage(image: NetworkImage('https://w0.peakpx.com/wallpaper/512/154/HD-wallpaper-abstract-golden-black-backgrounds-gradient-luxury-modern-waves-white.jpg')
                , fit: BoxFit.cover)),
            child: Transform.rotate(
              angle: pi,
              child: Column(
                children: [
                  Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 20,),
                              TextButton(
                                  onPressed: (){
                                     Navigator.of(context).pop();
                                  },
                                  child: Icon(Icons.arrow_back_outlined, color: Colors.white, size: 35,))
                            ],
                          ),
                        ],
                      )),
                  Expanded(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CircleAvatar(

                            backgroundImage: NetworkImage('https://img.freepik.com/free-vector/mysterious-mafia-man-smoking-cigarette_52683-34828.jpg?w=740&t=st=1664299640~exp=1664300240~hmac=062fa854007633e8348dcd18caf3b7f7caed53b915ae8b64a91a60226011dd25'),
                            radius: 60,

                          )
                        ],
                      )),
                  Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            user, style: TextStyle(fontSize: 27, letterSpacing: 1.4,fontWeight: FontWeight.w500, color: Colors.black,),
                          ),
                          Text('Complainant',style: TextStyle(fontSize: 18,letterSpacing: 1.2, fontWeight: FontWeight.w400, color: Colors.grey),)
                        ],
                      )),
                  Expanded(
                      flex: 5,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*0.8,
                                  height: 90,
                                  child: Card(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                                      elevation: 4,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(Icons.calendar_today_outlined, size: 40, color: Colors.black,),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text('Joined Date', style: TextStyle(fontSize: 19, letterSpacing: 1.4,fontWeight: FontWeight.w500, color: Colors.black,),),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text('1 January 2022', style: TextStyle(fontSize: 16,letterSpacing: 1.2, fontWeight: FontWeight.w400, color: Colors.grey),)
                                            ],
                                          ),

                                        ],
                                      )
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*0.8,
                                  height: 90,
                                  child: Card(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                                      elevation: 4,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(Icons.calendar_today_outlined, size: 40, color: Colors.black,),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text('Joined Date', style: TextStyle(fontSize: 19, letterSpacing: 1.4,fontWeight: FontWeight.w500, color: Colors.black,),),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text('1 January 2022', style: TextStyle(fontSize: 16,letterSpacing: 1.2, fontWeight: FontWeight.w400, color: Colors.grey),)
                                            ],
                                          ),

                                        ],
                                      )
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*0.8,
                                  height: 90,
                                  child: Card(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                                      elevation: 4,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(Icons.calendar_today_outlined, size: 40, color: Colors.black,),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text('Joined Date', style: TextStyle(fontSize: 19, letterSpacing: 1.4,fontWeight: FontWeight.w500, color: Colors.black,),),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text('1 January 2022', style: TextStyle(fontSize: 16,letterSpacing: 1.2, fontWeight: FontWeight.w400, color: Colors.grey),)
                                            ],
                                          ),

                                        ],
                                      )
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),

                              ],
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),

          ),
        ),
      ),
    );
  }
}