
import 'package:amenityfinal/common_refactor/TextButton.dart';
import 'package:amenityfinal/common_refactor/background_image.dart';
import 'package:amenityfinal/common_refactor/textform_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

List<air_complaint> air_complaints = [];
late int touch_air;
late User logged_air;

class complaint_airconditioner extends StatefulWidget {
  const complaint_airconditioner({Key? key}) : super(key: key);

  @override
  State<complaint_airconditioner> createState() =>
      _complaint_airconditionerState();
}

class _complaint_airconditionerState extends State<complaint_airconditioner> {
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    getcurrentuser();
  }

  void getcurrentuser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        logged_air = user;
      }
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: background(
            link:
                'https://static.vecteezy.com/system/resources/previews/000/095/572/non_2x/vector-dark-wallpaper-design.jpg',
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                      height: 50,
                      child: Container(
                        width: double.maxFinite,
                        height: double.maxFinite,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                IconButton(
                                    icon: Icon(
                                      Icons.arrow_back_sharp,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    }),
                              ],
                            ),
                            Text(
                              'Air Conditioner',
                              style: TextStyle(fontSize: 27, color: Colors.white),
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://st2.depositphotos.com/50337402/47092/v/380/depositphotos_470923054-stock-illustration-adult-man-avatar-short-curly.jpg?forcejpeg=true'),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                        width: double.maxFinite,
                        height: 260,
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 30, vertical: 35),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: Colors.black54),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Servitor Information',
                                style:
                                    TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              SizedBox(width: double.maxFinite),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 70,
                                        ),
                                        CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 25,
                                          child: IconButton(
                                            icon: Icon(Icons.call),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ],
                                    ),
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR59-m3AT7SI3Qth0e_hD22i0P0k4YukBJvsptTMlvAat7wqJTag2RH7aFB1upp6vVUbU8&usqp=CAU'),
                                      radius: 35,
                                    ),
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 25,
                                          child: Icon(Icons.message),
                                        ),
                                        SizedBox(
                                          width: 70,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                'Name of Servitor',
                                style:
                                    TextStyle(color: Colors.white, fontSize: 20),
                              )
                            ],
                          ),
                        )),
                    SizedBox(
                      width: double.maxFinite,
                      height: 600,
                      child: Container(
                        width: double.maxFinite,
                        height: double.maxFinite,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)),
                            color: Colors.white),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Complaint Booking',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            button(
                                navigator_class: Newcomplaint_airconditioner(),
                                width: double.maxFinite,
                                height: 120,
                                child: Text(
                                  'Add New',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 22),
                                ),
                                border: 30,
                                color: Colors.orange),
                            SizedBox(
                              width: double.maxFinite,
                              height: 400,
                              child: StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection('air_complaint')
                                      .snapshots(),
                                  builder: (context, snap) {
                                    air_complaints.clear();
                                    if (!snap.hasData) {
                                      return CircularProgressIndicator();
                                    }
                                    int indee = 0;
                                    List complaintss = snap.data!.docs;
                                    for (var complaints in complaintss) {
                                      final sender = complaints['sender'];
                                      if (sender ==
                                          logged_air.email.toString()) {
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

                                        air_complaints.add(air_complaint(
                                            username,
                                            mobile,
                                            hostel,
                                            block,
                                            floor,
                                            roomnumber,
                                            cleaningtype,
                                            date,
                                            timing));
                                      }
                                    }
                                    return ListView.builder(
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
                                                  logged_air.email.toString(),
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
                                                            air_complaints[
                                                                    index]
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
                                                            air_complaints[
                                                                    index]
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
                                                            air_complaints[
                                                                    index]
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
                                                            air_complaints[
                                                                    index]
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
                                                                  air_complaints
                                                                      .clear();
                                                                },
                                                                child:
                                                                    const Text(
                                                                  'Delete',
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
                                                                  touch_air =
                                                                      index;
                                                                  Navigator.of(
                                                                          context)
                                                                      .push(MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              complaint_air_display()));
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
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}

class Newcomplaint_airconditioner extends StatefulWidget {
  const Newcomplaint_airconditioner({Key? key}) : super(key: key);

  @override
  State<Newcomplaint_airconditioner> createState() =>
      _Newcomplaint_airconditionerState();
}

class _Newcomplaint_airconditionerState
    extends State<Newcomplaint_airconditioner> {
  String dropdownvalue = 'Girls Hostel';
  var items = ['Girls Hostel', 'Boys Hostel', 'Other'];
  TextEditingController username = TextEditingController();
  TextEditingController sender = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController block = TextEditingController();
  TextEditingController floornumber = TextEditingController();
  TextEditingController roomnumber = TextEditingController();
  TextEditingController cleaningtype = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController timing = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                      'Fill out the form below to file a complaint.',
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
                  SizedBox(
                    width: 370,
                    height: 50,
                    child: TextFormField(
                      controller: username,
                      decoration: InputDecoration(
                          labelText: 'Username',
                          alignLabelWithHint: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 370,
                    height: 50,
                    child: TextFormField(
                      controller: mobile,
                      decoration: InputDecoration(
                          labelText: 'Email/Mobile Number',
                          alignLabelWithHint: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border: Border.all(color: Colors.black)),
                        width: 200,
                        height: 50,
                        child: Center(
                          child: DropdownButton(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            elevation: 9,
                            underline: Container(
                              height: 0,
                              width: 0,
                            ),
                            value: dropdownvalue,
                            icon: Icon(Icons.keyboard_arrow_down),
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 150,
                        height: 50,
                        child: TextFormField(
                          controller: block,
                          decoration: InputDecoration(
                              labelText: 'Block/Building Name',
                              alignLabelWithHint: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
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
                      SizedBox(
                        width: 170,
                        height: 50,
                        child: TextFormField(
                          controller: floornumber,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: 'Floor Number',
                              alignLabelWithHint: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 170,
                        height: 50,
                        child: TextFormField(
                          controller: roomnumber,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: 'Room Number',
                              alignLabelWithHint: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 370,
                    height: 50,
                    child: TextFormField(
                      controller: date,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                          labelText: 'Preferred Date',
                          alignLabelWithHint: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 370,
                    height: 50,
                    child: TextFormField(
                      controller: timing,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                          labelText: 'Preferred Timing',
                          alignLabelWithHint: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 370,
                    height: 50,
                    child: TextFormField(
                      controller: cleaningtype,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: 'Remarks',
                          alignLabelWithHint: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
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
                          'Submit',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection('air_complaint')
                              .doc(Timestamp.now().toString())
                              .set({
                            'username': username.text,
                            'sender': logged_air.email.toString(),
                            'mobile': mobile.text,
                            'hostel': dropdownvalue,
                            'block': block.text,
                            'floor': floornumber.text,
                            'roomnumber': roomnumber.text,
                            'cleaningtype': cleaningtype.text,
                            'date': date.text,
                            'timing': timing.text
                          });
                          air_complaints.clear();
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

class air_complaint {
  late String username;
  late String phone;
  late String hostel;
  late String block;
  late String floor;
  late String room;
  late String cleaningtype;
  late String date;
  late String time;
  air_complaint(
      String usernames,
      String phones,
      String hostels,
      String blocks,
      String floors,
      String rooms,
      String cleaningtypes,
      String dates,
      String times) {
    username = usernames;
    phone = phones;
    hostel = hostels;
    block = blocks;
    floor = floors;
    room = rooms;
    cleaningtype = cleaningtypes;
    date = dates;
    time = times;
  }
}

class complaint_air_display extends StatelessWidget {
  const complaint_air_display({Key? key}) : super(key: key);

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
                            air_complaints[touch_air].username,
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
                            air_complaints[touch_air].phone,
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
                                air_complaints[touch_air].hostel,
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
                                air_complaints[touch_air].block,
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
                                air_complaints[touch_air].floor,
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
                                air_complaints[touch_air].room,
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
                            air_complaints[touch_air].date,
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
                            air_complaints[touch_air].time,
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
                            air_complaints[touch_air].cleaningtype,
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
