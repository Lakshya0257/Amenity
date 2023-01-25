import 'dart:math';

import 'package:amenityfinal/Servitor/login/servitor_login.dart';
import 'package:flutter/material.dart';


class Static_Profile extends StatefulWidget {
  const Static_Profile({Key? key}) : super(key: key);

  @override
  State<Static_Profile> createState() => _Static_ProfileState();
}

class _Static_ProfileState extends State<Static_Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
            ),
            Container(
                width: double.maxFinite,
                height: 100,
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
            SizedBox(
                width: double.maxFinite,
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      username, style: TextStyle(fontSize: 27, letterSpacing: 1.4,fontWeight: FontWeight.w500, color: Colors.blueAccent,fontFamily: 'bitter'),
                    ),
                    Text('Servitor',style: TextStyle(fontSize: 18,letterSpacing: 1.2, fontWeight: FontWeight.w400, color: Colors.grey),)
                  ],
                )),
            SizedBox(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height*.4,
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
                )),
          ],
        ),
      );
  }
}

List y = [creater_aditya(), creater_lakshya(), designer_jasika(), designer_shashank()];


class about_us extends StatefulWidget {
  const about_us({Key? key}) : super(key: key);

  @override
  State<about_us> createState() => _about_usState();
}

class _about_usState extends State<about_us> {
  int x=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : SafeArea(
        child: Container(
          color: Colors.orange[700],
          child: Column(
            children: [
              Expanded(
                  flex: 4,
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
                          flex: 1,
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.7,
                            height: 70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage('https://imgs.search.brave.com/sN81gDsstAdVbFbNY1hWrmLr1Bc305ger-z1aP5gCG4/rs:fit:800:800:1/g:ce/aHR0cHM6Ly90aHVt/YnMuZHJlYW1zdGlt/ZS5jb20vYi9zdHls/aXNoLXNoaW5lLXJl/ZC1kZXNpZ24tYWxw/aGFiZXQtbGV0dGVy/LWlzb2xhdGVkLWJs/YWNrLWJhY2tncm91/bmQtZC1pbGx1c3Ry/YXRpb24tc3ltYm9s/cy1sZXR0ZXItc3R5/bGlzaC1nbG93LWZl/c3RpdmUtMTUxNjcx/OTM2LmpwZw'
                                  ),
                                ),
                                Text('menity', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 1.4, color: Colors.white),),
                              ],
                            ),

                          )),
                      Expanded(
                        flex: 3,
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.9,
                          height: double.maxFinite,

                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text('Amenity app makes places more convenient for users.'
                                ' It is a complaint management app which can be used by any association to help simplify daily issues. '
                                'To get Amenity in your association, please reach out to us at contact@amenity.in',
                              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic, fontWeight: FontWeight.w300, letterSpacing: 1.4, color: Colors.white),),
                          ),
                        ),
                      ),
                    ],
                  )
              ),
              Expanded(
                  flex: 1,

                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)), color: Colors.orange[800]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: (){
                            setState((){
                              x=0;

                            });
                          },
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage('https://img.freepik.com/free-psd/young-businessman-3d-cartoon-avatar-portrait_627936-22.jpg?size=338&ext=jpg'
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: (){
                            setState((){
                              x=1;

                            });
                          },
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage('https://img.freepik.com/free-psd/3d-illustration-person-with-rainbow-sunglasses_23-2149436196.jpg?size=338&ext=jpg'
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: (){
                            setState((){
                              x=2;

                            });
                          },

                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage('https://img.freepik.com/free-psd/3d-illustration-person-with-long-hair_23-2149436197.jpg?size=338&ext=jpg'
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: (){
                            setState((){
                              x=3;

                            });
                          },
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage('https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg?size=338&ext=jpg'
                            ),
                          ),
                        ),
                      ],
                    ),


                  )
              ),
              Expanded(
                  flex: 3,
                  child: Container(
                    width: MediaQuery.of(context).size.width,

                    decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)), color: Colors.white),
                    child: y[x],


                  )
              ),

            ],
          ),
        ),
      ),
    );
  }
}


class creater_aditya extends StatelessWidget {
  const creater_aditya({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.85,
      child: Card(
        margin: EdgeInsets.all(20),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: Aditya Singh', style: TextStyle(fontSize: 19, letterSpacing: 1.3,color: Colors.black, fontWeight: FontWeight.w500),),
              Text('Reg No: 21BCE10026', style: TextStyle(fontSize: 19, letterSpacing: 1.3, color: Colors.black, fontWeight: FontWeight.w500),),
              Row(
                children: [
                  Text('Phone No: ',style: TextStyle(fontSize: 19, letterSpacing: 1.3, color: Colors.black, fontWeight: FontWeight.w500),),
                  Text('9560861171', style: TextStyle(fontSize: 19, letterSpacing: 1.3, color: Colors.black, fontWeight: FontWeight.w500),),
                ],
              ),

              Text('aditya.singh2021@vitbhopal.ac.in', style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic,letterSpacing: 1.3, color: Colors.black, fontWeight: FontWeight.w500),),
              Text('Full Stack App Developer', style: TextStyle(fontSize: 19, letterSpacing: 1.3, color: Colors.black, fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),
    );
  }
}


class creater_lakshya extends StatelessWidget {
  const creater_lakshya({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.85,
      child: Card(
        margin: EdgeInsets.all(20),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: Lakshya Bhati', style: TextStyle(fontSize: 19, letterSpacing: 1.3,color: Colors.black, fontWeight: FontWeight.w500),),
              Text('Reg No: 21BCE10042', style: TextStyle(fontSize: 19, letterSpacing: 1.3, color: Colors.black, fontWeight: FontWeight.w500),),
              Row(
                children: [
                  Text('Phone No: ',style: TextStyle(fontSize: 19, letterSpacing: 1.3, color: Colors.black, fontWeight: FontWeight.w500),),
                  Text('8955681765', style: TextStyle(fontSize: 19, letterSpacing: 1.3, color: Colors.black, fontWeight: FontWeight.w500),),
                ],
              ),

              Text('lakshya.bhati2021@vitbhopal.ac.in', style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic,letterSpacing: 1.3, color: Colors.black, fontWeight: FontWeight.w500),),
              Text('Full Stack App Developer', style: TextStyle(fontSize: 19, letterSpacing: 1.3, color: Colors.black, fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),
    );
  }
}

class designer_jasika extends StatelessWidget {
  const designer_jasika({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.85,
      child: Card(
        margin: EdgeInsets.all(20),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: Jasika Gupta', style: TextStyle(fontSize: 19, letterSpacing: 1.3,color: Colors.black, fontWeight: FontWeight.w500),),
              Text('Reg No: 21BCE10859', style: TextStyle(fontSize: 19, letterSpacing: 1.3, color: Colors.black, fontWeight: FontWeight.w500),),
              Row(
                children: [
                  Text('Phone No: ',style: TextStyle(fontSize: 19, letterSpacing: 1.3, color: Colors.black, fontWeight: FontWeight.w500),),
                  Text('8010409453', style: TextStyle(fontSize: 19, letterSpacing: 1.3, color: Colors.black, fontWeight: FontWeight.w500),),
                ],
              ),

              Text('jasika.gupta2021@vitbhopal.ac.in', style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic,letterSpacing: 1.3, color: Colors.black, fontWeight: FontWeight.w500),),
              Text('Figma Designer', style: TextStyle(fontSize: 19, letterSpacing: 1.3, color: Colors.black, fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),
    );
  }
}

class designer_shashank extends StatelessWidget {
  const designer_shashank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.85,
      child: Card(
        margin: EdgeInsets.all(20),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: Shashank Dixit', style: TextStyle(fontSize: 19, letterSpacing: 1.3,color: Colors.black, fontWeight: FontWeight.w500),),
              Text('Reg No: 21BCE10001', style: TextStyle(fontSize: 19, letterSpacing: 1.3, color: Colors.black, fontWeight: FontWeight.w500),),
              Row(
                children: [
                  Text('Phone No: ',style: TextStyle(fontSize: 19, letterSpacing: 1.3, color: Colors.black, fontWeight: FontWeight.w500),),
                  Text('9667550550', style: TextStyle(fontSize: 19, letterSpacing: 1.3, color: Colors.black, fontWeight: FontWeight.w500),),
                ],
              ),

              Text('shashank.dixit2021@vitbhopal.ac.in', style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic,letterSpacing: 1.3, color: Colors.black, fontWeight: FontWeight.w500),),
              Text('Figma Designer', style: TextStyle(fontSize: 19, letterSpacing: 1.3, color: Colors.black, fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),
    );
  }
}