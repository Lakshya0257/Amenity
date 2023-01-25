import 'package:amenityfinal/Servitor/login/servitor_login.dart';
import 'package:amenityfinal/common_refactor/common_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';




List<air_servitor_complaint> air_servitor=[];
List<clean_servitor_complaint> clean_servitor=[];
List<wifi_servitor_complaint> wifi_servitor=[];
late int touch_air_servitor;
late int touch_cleaning_servitor;
late int touch_wifi_servitor;













class generalservitor extends StatefulWidget {
  const generalservitor({Key? key}) : super(key: key);

  @override
  State<generalservitor> createState() => _generalservitorState();
}

class _generalservitorState extends State<generalservitor> {
  var _selectedTab = _SelectedTab.home;
  int x= 0;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
      x=i;
    });
  }


  var y= [home(),air(),clean(),wifi(),Static_Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: DotNavigationBar(
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        onTap: _handleIndexChanged,
        backgroundColor: Colors.white24,
        dotIndicatorColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: [
          DotNavigationBarItem(
            icon: Icon(Icons.home),
          ),
          DotNavigationBarItem(
            icon: Icon(Icons.air),
          ),
          DotNavigationBarItem(
            icon: Icon(Icons.cleaning_services_rounded),
          ),

          DotNavigationBarItem(
            icon: Icon(Icons.wifi_2_bar),
          ),
          DotNavigationBarItem(
            icon: Icon(Icons.person),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 20,),
                    IconButton(
                      onPressed: (){
                        ZoomDrawer.of(context)!.toggle();
                      },
                        icon: Icon(Icons.menu_rounded,color: Colors.white,)),
                  ],
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 22,
                      child: Image(image: NetworkImage('https://media.istockphoto.com/vectors/avatar-line-icon-on-black-background-black-flat-style-vector-vector-id1161086158?k=20&m=1161086158&s=170667a&w=0&h=1e9HO7d7nWl89qoOZoCKMFPeKZODqMQ7qjuXIAu9_vw='),),
                    ),
                    SizedBox(width: 20,)
                  ],
                )
              ],
            ),
            y[x],
          ],
        ),
      ),
    );
  }
}
enum _SelectedTab { home,air, clean, wifi,profile}




class air extends StatefulWidget {
  const air({Key? key}) : super(key: key);

  @override
  State<air> createState() => _airState();
}

class _airState extends State<air> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Air Conditioner',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w500,letterSpacing: 2),),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 300,
                height: 10,
                child: Divider(
                  color: Colors.grey,
                  thickness: 2,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.maxFinite,
                height: 600,
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('air_complaint')
                        .snapshots(),
                    builder: (context, snap) {
                      air_servitor.clear();
                      if (!snap.hasData) {
                        return CircularProgressIndicator();
                      }
                      int indee = 0;
                      List complaintss = snap.data!.docs;
                      for (var complaints in complaintss) {
                        final sender = complaints['sender'];
                          indee++;
                          final username = complaints['username'];
                          final timing = complaints['timing'];
                          final roomnumber =
                          complaints['roomnumber'];
                          final mobile = complaints['mobile'];
                          final hostel = complaints['hostel'];
                          final floor = complaints['floor'];
                          final date = complaints['date'];
                          final cleaningtype =
                          complaints['cleaningtype'];
                          final block = complaints['block'];

                          air_servitor.add(air_servitor_complaint(
                              username,
                              mobile,
                              hostel,
                              block,
                              floor,
                              roomnumber,
                              cleaningtype,
                              date,
                              timing,
                            sender
                          ));
                      }
                      return indee==0? Center(child: Image.network('https://www.levelaccess.com/wp-content/uploads/2019/02/docRemediation.png')) : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: indee,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 80, horizontal: 10),
                            child: Container(
                              width: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(30)),
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.black,
                                    width: 4),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        'https://www.crushpixel.com/big-static18/preview4/avatar-profile-pink-neon-icon-2920285.jpg'),
                                  ),
                                  SizedBox(
                                    height: 9,
                                  ),
                                  Text(
                                    air_servitor[index].sender,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 9,
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment
                                          .start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Room No.: ',
                                              style: TextStyle(
                                                  color: Colors
                                                      .blueAccent,
                                                  fontSize: 15,
                                                  fontWeight:
                                                  FontWeight
                                                      .bold),
                                            ),
                                            Text(
                                              air_servitor[index]
                                                  .room,
                                              style: TextStyle(
                                                  color: Colors
                                                      .blueAccent,
                                                  fontSize: 15),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Preferred Date: ',
                                              style: TextStyle(
                                                  color: Colors
                                                      .blueAccent,
                                                  fontSize: 15,
                                                  fontWeight:
                                                  FontWeight
                                                      .bold),
                                            ),
                                            Text(
                                              air_servitor[index]
                                                  .date,
                                              style: TextStyle(
                                                  color: Colors
                                                      .blueAccent,
                                                  fontSize: 15),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Preffered Timing: ',
                                              style: TextStyle(
                                                  color: Colors
                                                      .blueAccent,
                                                  fontSize: 15,
                                                  fontWeight:
                                                  FontWeight
                                                      .bold),
                                            ),
                                            Text(
                                              air_servitor[index]
                                                  .time,
                                              style: TextStyle(
                                                  color: Colors
                                                      .blueAccent,
                                                  fontSize: 15),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Remarks: ',
                                              style: TextStyle(
                                                  color: Colors
                                                      .blueAccent,
                                                  fontSize: 15,
                                                  fontWeight:
                                                  FontWeight
                                                      .bold),
                                            ),
                                            Text(
                                              air_servitor[index]
                                                  .cleaningtype,
                                              style: TextStyle(
                                                  color: Colors
                                                      .blueAccent,
                                                  fontSize: 15),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: 90,
                                              height: 40,
                                              decoration: const BoxDecoration(
                                                  color: Colors
                                                      .redAccent,
                                                  borderRadius: BorderRadius
                                                      .all(Radius
                                                      .circular(
                                                      10))),
                                              child: TextButton(
                                                  onPressed:
                                                      () async {
                                                    await FirebaseFirestore
                                                        .instance
                                                        .runTransaction(
                                                            (Transaction
                                                        myTransaction) async {
                                                          myTransaction.delete(snap
                                                              .data!
                                                              .docs[
                                                          index]
                                                              .reference);
                                                        });
                                                    air_servitor
                                                        .clear();
                                                  },
                                                  child:
                                                  const Text(
                                                    'Solve',
                                                    style: TextStyle(
                                                        color: Colors
                                                            .white,
                                                        fontSize:
                                                        20),
                                                  )),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                              width: 90,
                                              height: 40,
                                              decoration: const BoxDecoration(
                                                  color: Colors
                                                      .green,
                                                  borderRadius: BorderRadius
                                                      .all(Radius
                                                      .circular(
                                                      10))),
                                              child: TextButton(
                                                  onPressed: () {
                                                    touch_air_servitor =
                                                        index;
                                                    Navigator.of(
                                                        context)
                                                        .push(MaterialPageRoute(
                                                        builder: (context) =>
                                                            air_servitor_display()));
                                                  },
                                                  child:
                                                  const Text(
                                                    'Details',
                                                    style: TextStyle(
                                                        color: Colors
                                                            .white,
                                                        fontSize:
                                                        20),
                                                  )),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }),
              )



            ],
          ),
        ));
  }
}


class air_servitor_complaint {
  late String username;
  late String phone;
  late String hostel;
  late String block;
  late String floor;
  late String room;
  late String cleaningtype;
  late String date;
  late String time;
  late String sender;
  air_servitor_complaint(
      String usernames,
      String phones,
      String hostels,
      String blocks,
      String floors,
      String rooms,
      String cleaningtypes,
      String dates,
      String times,
      String send,
      ) {
    username = usernames;
    phone = phones;
    hostel = hostels;
    block = blocks;
    floor = floors;
    room = rooms;
    cleaningtype = cleaningtypes;
    date = dates;
    time = times;
    sender=send;
  }
}


class air_servitor_display extends StatelessWidget {
  const air_servitor_display({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle styles = const TextStyle(
      color: Colors.black,
      fontSize: 15,
    );
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://i.pinimg.com/736x/f4/c7/c7/f4c7c774933d1cf1487e59296b2351c1--a-r-iphone-wallpaper.jpg'),
                  fit: BoxFit.cover)),
          child: SafeArea(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                size: 30,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image(
                                image: NetworkImage(
                                    'https://st2.depositphotos.com/3765753/5349/v/600/depositphotos_53491365-stock-illustration-complaint-red-rubber-stamp-vector.jpg')),
                            SizedBox(
                              width: 20,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    height: 40,
                    child: Center(
                        child: Text(
                          'Complaint Details',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        )),
                  ),
                  SizedBox(
                    width: 300,
                    height: 70,
                    child: Divider(
                      thickness: 2,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    width: 370,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.black, width: 1)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'Username: ',
                            style: styles,
                          ),
                          Text(
                            air_servitor[touch_air_servitor].username,
                            style: styles,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 370,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.black, width: 1)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'Email/Mobile: ',
                            style: styles,
                          ),
                          Text(
                            air_servitor[touch_air_servitor].phone,
                            style: styles,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border: Border.all(color: Colors.black, width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                'Building: ',
                                style: styles,
                              ),
                              Text(
                                air_servitor[touch_air_servitor].hostel,
                                style: styles,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border: Border.all(color: Colors.black, width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                'Block: ',
                                style: styles,
                              ),
                              Text(
                                air_servitor[touch_air_servitor].block,
                                style: styles,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 170,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border: Border.all(color: Colors.black, width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                'Floor: ',
                                style: styles,
                              ),
                              Text(
                                air_servitor[touch_air_servitor].floor,
                                style: styles,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 170,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border: Border.all(color: Colors.black, width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                'Room: ',
                                style: styles,
                              ),
                              Text(
                                air_servitor[touch_air_servitor].room,
                                style: styles,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 370,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.black, width: 1)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'Preferred Date: ',
                            style: styles,
                          ),
                          Text(
                            air_servitor[touch_air_servitor].date,
                            style: styles,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 370,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.black, width: 1)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'Preferred Timing: ',
                            style: styles,
                          ),
                          Text(
                            air_servitor[touch_air_servitor].time,
                            style: styles,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 370,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.black, width: 1)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'Remarks: ',
                            style: styles,
                          ),
                          Text(
                            air_servitor[touch_air_servitor].cleaningtype,
                            style: styles,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 150,
                    height: 60,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Colors.orangeAccent),
                      child: TextButton(
                        child: Text(
                          'Back',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}





class clean extends StatefulWidget {
  const clean({Key? key}) : super(key: key);

  @override
  State<clean> createState() => _cleanState();
}

class _cleanState extends State<clean> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Cleaning',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w500,letterSpacing: 2),),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 300,
                height: 10,
                child: Divider(
                  color: Colors.grey,
                  thickness: 2,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.maxFinite,
                height: 600,
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('cleaning_complaint')
                        .snapshots(),
                    builder: (context, snap) {
                      clean_servitor.clear();
                      if (!snap.hasData) {
                        return CircularProgressIndicator();
                      }
                      int indee = 0;
                      List complaintss = snap.data!.docs;
                      for (var complaints in complaintss) {
                        final sender = complaints['sender'];
                          indee++;
                          final username = complaints['username'];
                          final timing = complaints['timing'];
                          final roomnumber = complaints['roomnumber'];
                          final mobile = complaints['mobile'];
                          final hostel = complaints['hostel'];
                          final floor = complaints['floor'];
                          final date = complaints['date'];
                          final cleaningtype =
                          complaints['cleaningtype'];
                          final block = complaints['block'];

                          clean_servitor.add(clean_servitor_complaint(
                              username,
                              mobile,
                              hostel,
                              block,
                              floor,
                              roomnumber,
                              cleaningtype,
                              date,
                              timing,
                            sender
                          ));

                      }
                      return indee==0? Center(child: Image.network('https://www.levelaccess.com/wp-content/uploads/2019/02/docRemediation.png')): ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: indee,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 80, horizontal: 10),
                            child: Container(
                              width: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(30)),
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.black, width: 4),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        'https://www.crushpixel.com/big-static18/preview4/avatar-profile-pink-neon-icon-2920285.jpg'),
                                  ),
                                  SizedBox(
                                    height: 9,
                                  ),
                                  Text(
                                    clean_servitor[index].sender,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 9,
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Room No.: ',
                                              style: TextStyle(
                                                  color: Colors
                                                      .blueAccent,
                                                  fontSize: 15,
                                                  fontWeight:
                                                  FontWeight
                                                      .bold),
                                            ),
                                            Text(
                                              clean_servitor[index]
                                                  .room,
                                              style: TextStyle(
                                                  color: Colors
                                                      .blueAccent,
                                                  fontSize: 15),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Preferred Date: ',
                                              style: TextStyle(
                                                  color: Colors
                                                      .blueAccent,
                                                  fontSize: 15,
                                                  fontWeight:
                                                  FontWeight
                                                      .bold),
                                            ),
                                            Text(
                                              clean_servitor[index]
                                                  .date,
                                              style: TextStyle(
                                                  color: Colors
                                                      .blueAccent,
                                                  fontSize: 15),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Preffered Timing: ',
                                              style: TextStyle(
                                                  color: Colors
                                                      .blueAccent,
                                                  fontSize: 15,
                                                  fontWeight:
                                                  FontWeight
                                                      .bold),
                                            ),
                                            Text(
                                              clean_servitor[index]
                                                  .time,
                                              style: TextStyle(
                                                  color: Colors
                                                      .blueAccent,
                                                  fontSize: 15),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Cleaning Type: ',
                                              style: TextStyle(
                                                  color: Colors
                                                      .blueAccent,
                                                  fontSize: 15,
                                                  fontWeight:
                                                  FontWeight
                                                      .bold),
                                            ),
                                            Text(
                                              clean_servitor[index]
                                                  .cleaningtype,
                                              style: TextStyle(
                                                  color: Colors
                                                      .blueAccent,
                                                  fontSize: 15),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: 90,
                                              height: 40,
                                              decoration: const BoxDecoration(
                                                  color: Colors.redAccent,
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(10))),
                                              child: TextButton(
                                                  onPressed: () async {
                                                    await FirebaseFirestore.instance
                                                        .runTransaction((Transaction
                                                    myTransaction) async {
                                                      myTransaction.delete(snap.data!
                                                          .docs[index].reference);
                                                    });
                                                    clean_servitor.clear();
                                                  },
                                                  child: const Text(
                                                    'Solve',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20),
                                                  )),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                              width: 90,
                                              height: 40,
                                              decoration: const BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(10))),
                                              child: TextButton(
                                                  onPressed: () {
                                                    touch_cleaning_servitor = index;
                                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>cleaning_servitor_display()));
                                                  },
                                                  child: const Text(
                                                    'Details',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20),
                                                  )),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }),
              )



            ],
          ),
        ));
  }
}


class clean_servitor_complaint {
  late String username;
  late String phone;
  late String hostel;
  late String block;
  late String floor;
  late String room;
  late String cleaningtype;
  late String date;
  late String time;
  late String sender;
  clean_servitor_complaint(
      String usernames,
      String phones,
      String hostels,
      String blocks,
      String floors,
      String rooms,
      String cleaningtypes,
      String dates,
      String times,
      String send
      ) {
    username = usernames;
    phone = phones;
    hostel = hostels;
    block = blocks;
    floor = floors;
    room = rooms;
    cleaningtype = cleaningtypes;
    date = dates;
    time = times;
    sender=send;
  }
}

class cleaning_servitor_display extends StatelessWidget {
  const cleaning_servitor_display({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle styles = const TextStyle(
      color: Colors.black,
      fontSize: 15,
    );
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://i.pinimg.com/736x/f4/c7/c7/f4c7c774933d1cf1487e59296b2351c1--a-r-iphone-wallpaper.jpg'),
                  fit: BoxFit.cover)),
          child: SafeArea(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                size: 30,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image(
                                image: NetworkImage(
                                    'https://st2.depositphotos.com/3765753/5349/v/600/depositphotos_53491365-stock-illustration-complaint-red-rubber-stamp-vector.jpg')),
                            SizedBox(
                              width: 20,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    height: 40,
                    child: Center(
                        child: Text(
                          'Complaint Details',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        )),
                  ),
                  SizedBox(
                    width: 300,
                    height: 70,
                    child: Divider(
                      thickness: 2,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    width: 370,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.black,width: 1)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Username: ',style: styles,),
                          Text(clean_servitor[touch_cleaning_servitor].username,style: styles,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 370,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.black,width: 1)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Email/Mobile: ',style: styles,),
                          Text(clean_servitor[touch_cleaning_servitor].phone,style: styles,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20)),
                            border: Border.all(color: Colors.black,width: 1)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Building: ',style: styles,),
                              Text(clean_servitor[touch_cleaning_servitor].hostel,style: styles,),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20)),
                            border: Border.all(color: Colors.black,width: 1)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Block: ',style: styles,),
                              Text(clean_servitor[touch_cleaning_servitor].block,style: styles,),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 170,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20)),
                            border: Border.all(color: Colors.black,width: 1)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Floor: ',style: styles,),
                              Text(clean_servitor[touch_cleaning_servitor].floor,style: styles,),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 170,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20)),
                            border: Border.all(color: Colors.black,width: 1)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Room: ',style: styles,),
                              Text(clean_servitor[touch_cleaning_servitor].room,style: styles,),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 370,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.black,width: 1)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Type: ',style: styles,),
                          Text(clean_servitor[touch_cleaning_servitor].cleaningtype,style: styles,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 370,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.black,width: 1)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Preferred Date: ',style: styles,),
                          Text(clean_servitor[touch_cleaning_servitor].date,style: styles,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 370,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.black,width: 1)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Preferred Timing: ',style: styles,),
                          Text(clean_servitor[touch_cleaning_servitor].time,style: styles,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 150,
                    height: 60,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Colors.orangeAccent),
                      child: TextButton(
                        child: Text(
                          'Back',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}


class wifi extends StatefulWidget {
  const wifi({Key? key}) : super(key: key);

  @override
  State<wifi> createState() => _wifiState();
}

class _wifiState extends State<wifi> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Wifi',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w500,letterSpacing: 2),),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 300,
              height: 10,
              child: Divider(
                color: Colors.grey,
                thickness: 2,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.maxFinite,
              height: 600,
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('wifi_complaint')
                      .snapshots(),
                  builder: (context, snap) {
                    wifi_servitor.clear();
                    if (!snap.hasData) {
                      return CircularProgressIndicator();
                    }
                    int indee = 0;
                    List complaintss = snap.data!.docs;
                    for (var complaints in complaintss) {
                      final sender = complaints['sender'];
                        indee++;
                        final username = complaints['username'];
                        final timing = complaints['timing'];
                        final roomnumber = complaints['roomnumber'];
                        final mobile = complaints['mobile'];
                        final hostel = complaints['hostel'];
                        final floor = complaints['floor'];
                        final date = complaints['date'];
                        final cleaningtype =
                        complaints['cleaningtype'];
                        final block = complaints['block'];

                        wifi_servitor.add(wifi_servitor_complaint(
                            username,
                            mobile,
                            hostel,
                            block,
                            floor,
                            roomnumber,
                            cleaningtype,
                            date,
                            timing,
                          sender
                        ));
                    }
                    return indee==0? Center(child: Image.network('https://www.levelaccess.com/wp-content/uploads/2019/02/docRemediation.png')) :  ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: indee,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 80, horizontal: 10),
                          child: Container(
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(30)),
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.black, width: 4),
                            ),
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://www.crushpixel.com/big-static18/preview4/avatar-profile-pink-neon-icon-2920285.jpg'),
                                ),
                                SizedBox(
                                  height: 9,
                                ),
                                Text(
                                  wifi_servitor[index].sender,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15),
                                ),
                                SizedBox(
                                  height: 9,
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Room No.: ',
                                            style: TextStyle(
                                                color: Colors
                                                    .blueAccent,
                                                fontSize: 15,
                                                fontWeight:
                                                FontWeight
                                                    .bold),
                                          ),
                                          Text(
                                              wifi_servitor[index]
                                                .room,
                                            style: TextStyle(
                                                color: Colors
                                                    .blueAccent,
                                                fontSize: 15),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Preferred Date: ',
                                            style: TextStyle(
                                                color: Colors
                                                    .blueAccent,
                                                fontSize: 15,
                                                fontWeight:
                                                FontWeight
                                                    .bold),
                                          ),
                                          Text(
                                            wifi_servitor[index]
                                                .date,
                                            style: TextStyle(
                                                color: Colors
                                                    .blueAccent,
                                                fontSize: 15),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Preffered Timing: ',
                                            style: TextStyle(
                                                color: Colors
                                                    .blueAccent,
                                                fontSize: 15,
                                                fontWeight:
                                                FontWeight
                                                    .bold),
                                          ),
                                          Text(
                                            wifi_servitor[index]
                                                .time,
                                            style: TextStyle(
                                                color: Colors
                                                    .blueAccent,
                                                fontSize: 15),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Remarks: ',
                                            style: TextStyle(
                                                color: Colors
                                                    .blueAccent,
                                                fontSize: 15,
                                                fontWeight:
                                                FontWeight
                                                    .bold),
                                          ),
                                          Text(
                                            wifi_servitor[index]
                                                .cleaningtype,
                                            style: TextStyle(
                                                color: Colors
                                                    .blueAccent,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: 90,
                                            height: 40,
                                            decoration: const BoxDecoration(
                                                color: Colors.redAccent,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            child: TextButton(
                                                onPressed: () async {
                                                  await FirebaseFirestore.instance
                                                      .runTransaction((Transaction
                                                  myTransaction) async {
                                                    myTransaction.delete(snap.data!
                                                        .docs[index].reference);
                                                  });
                                                  wifi_servitor.clear();
                                                },
                                                child: const Text(
                                                  'Solve',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                )),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            width: 90,
                                            height: 40,
                                            decoration: const BoxDecoration(
                                                color: Colors.green,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            child: TextButton(
                                                onPressed: () {
                                                  touch_wifi_servitor = index;
                                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>wifi_servitor_display()));
                                                },
                                                child: const Text(
                                                  'Details',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                )),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }),
            )



          ],
        ));
  }
}


class wifi_servitor_complaint {
  late String username;
  late String phone;
  late String hostel;
  late String block;
  late String floor;
  late String room;
  late String cleaningtype;
  late String date;
  late String time;
  late String sender;
  wifi_servitor_complaint(
      String usernames,
      String phones,
      String hostels,
      String blocks,
      String floors,
      String rooms,
      String cleaningtypes,
      String dates,
      String times,
      String send
      ) {
    username = usernames;
    phone = phones;
    hostel = hostels;
    block = blocks;
    floor = floors;
    room = rooms;
    cleaningtype = cleaningtypes;
    date = dates;
    time = times;
    sender=send;
  }
}

class wifi_servitor_display extends StatelessWidget {
  const wifi_servitor_display({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle styles = const TextStyle(
      color: Colors.black,
      fontSize: 15,
    );
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://i.pinimg.com/736x/f4/c7/c7/f4c7c774933d1cf1487e59296b2351c1--a-r-iphone-wallpaper.jpg'),
                  fit: BoxFit.cover)),
          child: SafeArea(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                size: 30,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image(
                                image: NetworkImage(
                                    'https://st2.depositphotos.com/3765753/5349/v/600/depositphotos_53491365-stock-illustration-complaint-red-rubber-stamp-vector.jpg')),
                            SizedBox(
                              width: 20,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    height: 40,
                    child: Center(
                        child: Text(
                          'Complaint Details',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        )),
                  ),
                  SizedBox(
                    width: 300,
                    height: 70,
                    child: Divider(
                      thickness: 2,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    width: 370,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.black,width: 1)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Username: ',style: styles,),
                          Text(wifi_servitor[touch_wifi_servitor].username,style: styles,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 370,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.black,width: 1)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Email/Mobile: ',style: styles,),
                          Text(wifi_servitor[touch_wifi_servitor].phone,style: styles,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20)),
                            border: Border.all(color: Colors.black,width: 1)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Building: ',style: styles,),
                              Text(wifi_servitor[touch_wifi_servitor].hostel,style: styles,),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20)),
                            border: Border.all(color: Colors.black,width: 1)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Block: ',style: styles,),
                              Text(wifi_servitor[touch_wifi_servitor].block,style: styles,),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 170,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20)),
                            border: Border.all(color: Colors.black,width: 1)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Floor: ',style: styles,),
                              Text(wifi_servitor[touch_wifi_servitor].floor,style: styles,),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 170,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20)),
                            border: Border.all(color: Colors.black,width: 1)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Room: ',style: styles,),
                              Text(wifi_servitor[touch_wifi_servitor].room,style: styles,),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 370,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.black,width: 1)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Preferred Date: ',style: styles,),
                          Text(wifi_servitor[touch_wifi_servitor].date,style: styles,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 370,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.black,width: 1)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Preferred Timing: ',style: styles,),
                          Text(wifi_servitor[touch_wifi_servitor].time,style: styles,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 370,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.black,width: 1)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Remarks: ',style: styles,),
                          Text(wifi_servitor[touch_wifi_servitor].cleaningtype,style: styles,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 150,
                    height: 60,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Colors.orangeAccent),
                      child: TextButton(
                        child: Text(
                          'Back',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}




class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 150,
        ),
        Text('Welcome',
            style: TextStyle(
                color: Colors.blueAccent, fontSize: 70, fontFamily: 'style')),
        SizedBox(
          height: 10,
        ),
        Text(username, style: TextStyle(color: Colors.white, fontSize: 40)),
        Container(
          margin: EdgeInsets.all(0),
          child: Image(
            image: NetworkImage(
                'https://www.bizzmine.com/images/rsca/500x350/images/articles/intro-images/Complaints_Management_with_BizzMine.png'),
          ),
        )
      ],
    );
  }
}



