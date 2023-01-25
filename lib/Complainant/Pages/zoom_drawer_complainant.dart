
import 'package:amenityfinal/common_refactor/circularprofile.dart';
import 'package:amenityfinal/common_refactor/common_profile.dart';
import 'package:amenityfinal/common_refactor/profile_complaint.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
import '../login_and_signup/complainant_login.dart';
import 'general.dart';
import 'medicals.dart';
import 'transportation.dart';

class drawers extends StatefulWidget {
  const drawers({Key? key}) : super(key: key);

  @override
  State<drawers> createState() => _drawersState();
}

class _drawersState extends State<drawers> {
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: Menu(),
      mainScreen: test(),
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

//menu of zoomdrawer
class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            circular_profile(
                width: double.infinity,
                height: 150,
                Padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                link:
                    'https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto,q_auto,f_auto/gigs/177985490/original/7fae26891a298569d94bb883bb9a963e58b37d2e/make-a-minimalistic-avatar-based-on-your-photo.jpg',
                radius: 1),
            Container(
              width: double.infinity,
              height: 70,
              padding: EdgeInsets.fromLTRB(40, 0, 10, 15),
              child: Text(
                user,
                style: TextStyle(
                    color: Colors.white, fontSize: 25, letterSpacing: 2),
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.white,
            ),
            TextButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>about_us()));
              },
              child: SizedBox(
                width: double.infinity,
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Icon(Icons.account_box_outlined,color: Colors.blueAccent,),
                    SizedBox(
                      width: 20,
                    ),
                    Text('Creators',style: TextStyle(color: Colors.white,fontSize: 20),)
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: (){},
              child: SizedBox(
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
            ),
            TextButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Static_Profile_complaint()));
              },
              child: SizedBox(
                width: double.infinity,
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Icon(Icons.people_alt_rounded,color: Colors.blueAccent,),
                    SizedBox(
                      width: 20,
                    ),
                    Text('Profile',style: TextStyle(color: Colors.white,fontSize: 20),)
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: SizedBox(
                width: double.infinity,
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Icon(Icons.logout,color: Colors.blueAccent,),
                    SizedBox(
                      width: 20,
                    ),
                    Text('Log Out',style: TextStyle(color: Colors.white,fontSize: 20),)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return SnappingSheet(
      child: backgrounds(),
      lockOverflowDrag: true,
      snappingPositions: [
        SnappingPosition.factor(
          grabbingContentOffset: GrabbingContentOffset.top,
          snappingCurve: Curves.easeInExpo,
          snappingDuration: Duration(seconds: 1),
          positionFactor: MediaQuery.of(context).size.height*.75/MediaQuery.of(context).size.height,
        ),
        SnappingPosition.factor(
          positionFactor: 0.07,
          snappingCurve: Curves.easeOutExpo,
          snappingDuration: Duration(seconds: 1),
          grabbingContentOffset: GrabbingContentOffset.bottom,
        ),
      ],
      grabbing: GrabbingWidget(),
      grabbingHeight: MediaQuery.of(context).size.height*.084,
      sheetAbove: SnappingSheetContent(child: chatting()),
    );
  }
}

final _firestore = FirebaseFirestore.instance;

TextEditingController chat_controller = TextEditingController();

class chatting extends StatefulWidget {
  const chatting({Key? key}) : super(key: key);

  @override
  State<chatting> createState() => _chattingState();
}

class _chattingState extends State<chatting> {
  late String time;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage('https://image.winudf.com/v2/image1/Y29tLmhhbmRldnN0ZC5kYXJrLmJsYWNrd2FsbHBhcGVyc19zY3JlZW5fMF8xNjI5MDMxMjkwXzA4Nw/screen-0.jpg?fakeurl=1&type=.jpg'),fit: BoxFit.cover)
          ),
          child: Column(
            children: [
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Container(
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.height * 0.11,
                    color: Colors.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Text('Amenity',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'dosis',
                                    letterSpacing: 1,
                                    color: Colors.white)),
                          ],
                        ),
                        Container(
                          height: 80,
                          width: 90,
                          child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(60),
                                    topLeft: Radius.circular(60))),
                            child: Center(
                              child: IconButton(
                                onPressed: () {
                                  ZoomDrawer.of(context)!.toggle();
                                },
                                icon: Icon(
                                  Icons.menu_outlined,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.loose,
                child: Container(
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: Colors.white, width: 1)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: double.maxFinite,
                          height: double.maxFinite,
                          padding: EdgeInsets.all(5),
                          child: TextField(
                            controller: chat_controller,
                            keyboardType: TextInputType.multiline,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Message',
                                labelStyle: TextStyle(color: Colors.grey)),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                          onPressed: () {
                            DateTime now=DateTime.now();
                            String time=now.hour.toString()+':'+now.minute.toString();
                            _firestore.collection('chatting').doc(Timestamp.now().toString()).set({
                              'Chat': chat_controller.text,
                              'username': userid,
                              'time': time,
                            });
                            chat_controller.clear(

                            );
                          },
                          child: Container(
                            margin: EdgeInsets.all(8),
                            child: Text(
                              'Send',
                              style: TextStyle(
                                  color: Colors.blueAccent, fontSize: 20),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 7,
                fit: FlexFit.loose,
                child: Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  color: Colors.transparent,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: _firestore.collection('chatting').snapshots(),
                    builder: (context, snapshot){
                      List<chatting_container> Messagewidget = [];
                      if (snapshot.hasData){
                        int indee=0;
                        final message = snapshot.data!.docs;
                        for (var messages in message){
                          indee++;
                          final messageText = messages['Chat'];
                          final docid=messages.id.toString();
                          final String messageusername = messages['username'];
                          final timing=messages['time'];
                          String result=messageusername.substring(0,messageusername.indexOf('@'));

                          bool me;
                          if(messageusername==userid){
                            me=true;
                          }
                          else{
                            me=false;
                          }
                          if(indee>100){
                            _firestore.runTransaction((Transaction myTrans)async{
                              await myTrans.delete(snapshot.data!.docs[0].reference);
                              Messagewidget.removeAt(0);
                              Messagewidget.add(chatting_container(text: messageText.toString(),isMe: me,usern: result,idofdocument: docid,time: timing,));
                            });
                          }
                          else{
                            Messagewidget.add(chatting_container(text: messageText.toString(),isMe: me,usern: result,idofdocument: docid,time: timing,));
                          }

                        }
                      }
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(5, 35, 5, 0),
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: Messagewidget,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class chatting_container extends StatelessWidget {
  chatting_container({
    required this.text,
    required this.isMe,
    required this.usern,
    required this.idofdocument,
    required this.time
}) ;
  String text;
  final bool isMe;
  String usern;
  String idofdocument;
  String time;
  @override
  Widget build(BuildContext context) {
         return Column(
           crossAxisAlignment: isMe? CrossAxisAlignment.end: CrossAxisAlignment.start,
           children: [
             FocusedMenuHolder(
               menuItems: [
                 isMe? FocusedMenuItem(
                   title: Text('Delete'),
                     trailingIcon: Icon(Icons.delete),
                   onPressed: (){
                    final docuser= _firestore.collection('chatting').doc(idofdocument);
                    print(idofdocument);
                    docuser.delete();
                   }
                 ): FocusedMenuItem(
                     title: Text('Back'),
                     trailingIcon: Icon(Icons.arrow_back_ios),
                     onPressed: (){}
                 ),
               ],
               menuWidth: MediaQuery.of(context).size.width*0.50,
               blurSize: 5.0,
               menuItemExtent: 45,
               menuBoxDecoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.all(Radius.circular(50.0))),
               duration: Duration(milliseconds: 100),
               animateMenuItems: true,
               blurBackgroundColor: Colors.black54,
               bottomOffsetHeight: 100,
               openWithTap: false,
               onPressed: (){},

               child: Container(
                 constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width*0.60),
                 margin: EdgeInsets.all(5),
                 decoration: BoxDecoration(
                   color: isMe? Colors.white: Colors.greenAccent,
                   borderRadius: isMe? BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)): BorderRadius.only(topRight: Radius.circular(20),bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                 ),
                 child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                   child: Column(
                     crossAxisAlignment: isMe? CrossAxisAlignment.end: CrossAxisAlignment.start,
                     children: [
                       Text(usern,style: TextStyle(color: Colors.deepOrangeAccent,fontWeight: FontWeight.w500),),
                       SizedBox(height: 2,),
                       Text(text),
                       SizedBox(height: 2,),
                       Text(time,style: TextStyle(color: Colors.grey,fontSize: 12),),

                     ],
                   ),
                 ),
    ),
             ),
           ],
         );


}
}



class GrabbingWidget extends StatelessWidget {
  const GrabbingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(60)),
            boxShadow: [BoxShadow(blurRadius: 20, color: Colors.black)]),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(150, 50, 150, 20),
          child: Divider(
            thickness: 3,
            color: Colors.white,
          ),
        ));
  }
}

class backgrounds extends StatefulWidget {
  const backgrounds({Key? key}) : super(key: key);

  @override
  State<backgrounds> createState() => _backgroundsState();
}

class _backgroundsState extends State<backgrounds> {
  var inde = 0;
  var pages = [general(), transport(), medical()];

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.white,
      ),
      SafeArea(
        child: Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            animationDuration: Duration(milliseconds: 300),
            height: 50,
            backgroundColor: Colors.white,
            color: Colors.black,
            index: 0,
            items: [
              Icon(
                Icons.cleaning_services_rounded,
                size: 30,
                color: Colors.white,
              ),
              Icon(
                Icons.emoji_transportation,
                size: 30,
                color: Colors.white,
              ),
              Icon(
                Icons.medication,
                size: 30,
                color: Colors.white,
              )
            ],
            onTap: (index) {
              setState(() {
                inde = index;
              });
            },
          ),
          backgroundColor: Colors.transparent,
          body: pages[inde],
        ),
      ),
    ]);
  }
}
