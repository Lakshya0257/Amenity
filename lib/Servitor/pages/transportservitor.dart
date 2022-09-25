import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

final _firestore = FirebaseFirestore.instance;
late User loggeduser;
int touch_transport = 0;
List<complaint_class_servitor> Complaintwidget_servitor = [];

class transportservitor extends StatefulWidget {
  const transportservitor({Key? key}) : super(key: key);

  @override
  State<transportservitor> createState() => _transportservitorState();
}

class _transportservitorState extends State<transportservitor> {
  var _selectedTab = _SelectedTab.home;
  int x = 0;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
      x = i;
    });
  }

  var y = [
    const home(),
    const book(),
    const chat(),
    const notice(),
    const profile()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: DotNavigationBar(
        itemPadding: const EdgeInsets.all(10),
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        onTap: _handleIndexChanged,
        backgroundColor: Colors.white24,
        dotIndicatorColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: [
          DotNavigationBarItem(
            icon: const Icon(Icons.home),
          ),
          DotNavigationBarItem(
            icon: const Icon(Icons.bus_alert),
          ),
          DotNavigationBarItem(
            icon: const Icon(Icons.book_outlined),
          ),
          DotNavigationBarItem(
            icon: const Icon(Icons.developer_board),
          ),
          DotNavigationBarItem(
            icon: const Icon(Icons.person),
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
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(
                        onPressed: () {
                          ZoomDrawer.of(context)!.toggle();
                        },
                        icon: const Icon(
                          Icons.menu_rounded,
                          color: Colors.white,
                        )),
                  ],
                ),
                Row(
                  children: const <Widget>[
                    CircleAvatar(
                      radius: 22,
                      child: Image(
                        image: NetworkImage(
                            'https://media.istockphoto.com/vectors/avatar-line-icon-on-black-background-black-flat-style-vector-vector-id1161086158?k=20&m=1161086158&s=170667a&w=0&h=1e9HO7d7nWl89qoOZoCKMFPeKZODqMQ7qjuXIAu9_vw='),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    )
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

enum _SelectedTab { home, air, clean, wifi, profile }

class book extends StatefulWidget {
  const book({Key? key}) : super(key: key);

  @override
  State<book> createState() => _bookState();
}

class _bookState extends State<book> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Bookings',
          style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w500,
              letterSpacing: 2),
        ),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          width: 300,
          height: 10,
          child: Divider(
            color: Colors.grey,
            thickness: 2,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: [
            SizedBox(
              width: double.maxFinite,
              height: 130,
              child: Container(
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: const <Widget>[
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://image.shutterstock.com/image-vector/contact-circle-neon-style-icon-260nw-1607646820.jpg'),
                            ),
                            SizedBox(
                              width: 9,
                            ),
                            Text(
                              'user_1709',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        const Text(
                          'Departure Date: 14/09',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        const Text(
                          'Departure Timing: 10:00',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Remarks: ',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        Container(
                          width: 90,
                          height: 40,
                          decoration: const BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Details',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              height: 130,
              child: Container(
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: const <Widget>[
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://us.123rf.com/450wm/alexvolot/alexvolot1912/alexvolot191200028/135452098-portrait-of-an-anonymous-man-in-a-black-hoodie-hiding-his-face-behind-a-scary-neon-mask-studio-shot-.jpg?ver=6'),
                            ),
                            SizedBox(
                              width: 9,
                            ),
                            Text(
                              'user_1899',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        const Text(
                          'Departure Date: 12/09',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        const Text(
                          'Departure Timing: 9:00',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Remarks: ',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        Container(
                          width: 90,
                          height: 40,
                          decoration: const BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Details',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}

class chat extends StatefulWidget {
  const chat({Key? key}) : super(key: key);

  @override
  State<chat> createState() => _chatState();
}

class _chatState extends State<chat> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Complaints',
          style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w500,
              letterSpacing: 2),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
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
        Container(
          width: double.maxFinite,
          height: 300,
          child: StreamBuilder <QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('transport_complaint').snapshots(),
              builder: (context,snap){
                if (snap.hasData) {
                  int indee=0;
                  final complaintss = snap.data!.docs;
                  for (var complaints in complaintss) {
                    indee++;
                    final sender = complaints['sender'];
                    final complaintname = complaints['name'];
                    final complaintnumber = complaints['number'];
                    final complaintproblem = complaints['problem'];
                    final complaintvehicle = complaints['vehicle'];
                    Complaintwidget_servitor.add(complaint_class_servitor(
                        complaintname,
                        complaintnumber,
                        complaintproblem,
                        complaintvehicle,
                        sender));
                    print(Complaintwidget_servitor[indee].prblm);

                  }
                  return ListView.builder(
                      itemCount: indee,
                      itemBuilder: (BuildContext context, int index) {
                        print(Complaintwidget_servitor[index].prblm);
                        return SizedBox(
                          width: double.maxFinite,
                          height: 130,
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'Problem:  ',
                                      style: TextStyle(color: Colors.blueAccent),
                                    ),
                                    Text(Complaintwidget_servitor[index].prblm)
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: <Widget>[
                                        const CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              'https://image.shutterstock.com/image-vector/contact-circle-neon-style-icon-260nw-1607646820.jpg'),
                                        ),
                                        const SizedBox(
                                          width: 9,
                                        ),
                                        Text(
                                          Complaintwidget_servitor[index]
                                              .sends
                                              .toString(),
                                          style: const TextStyle(
                                              color: Colors.black, fontSize: 15),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 90,
                                          height: 40,
                                          decoration: const BoxDecoration(
                                              color: Colors.blueAccent,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          child: TextButton(
                                              onPressed: () async {
                                                await FirebaseFirestore.instance
                                                    .runTransaction((Transaction
                                                myTransaction) async {
                                                  myTransaction.delete(snap
                                                      .data!
                                                      .docs[index]
                                                      .reference);
                                                });
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
                                              color: Colors.blueAccent,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          child: TextButton(
                                              onPressed: () {
                                                touch_transport = index;
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                        const display_complaints_transport()));
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
                              ],
                            ),
                          ),
                        );
                      });
                }
                else{
                  return Text('nothing');
                }
              }),
        ),
      ],
    );
  }
}

class display_complaints_transport extends StatelessWidget {
  const display_complaints_transport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: const BoxDecoration(
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
                            const SizedBox(
                              width: 20,
                            ),
                            IconButton(
                              icon: const Icon(
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
                          children: const [
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
                  const SizedBox(
                    width: double.maxFinite,
                    height: 40,
                    child: Center(
                        child: Text(
                      'Transport Complaint',
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    )),
                  ),
                  const SizedBox(
                    width: 300,
                    height: 70,
                    child: Divider(
                      thickness: 2,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 370,
                    height: 40,
                    child: Row(
                      children: [
                        const Text(
                          'Username:  ',
                          style:
                              TextStyle(color: Colors.blueAccent, fontSize: 18),
                        ),
                        Text(Complaintwidget_servitor[touch_transport].usrname),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 370,
                    height: 40,
                    child: Row(
                      children: [
                        const Text(
                          'Email/mobile:  ',
                          style:
                              TextStyle(color: Colors.blueAccent, fontSize: 18),
                        ),
                        Text(Complaintwidget_servitor[touch_transport].mobl),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 370,
                    height: 40,
                    child: Row(
                      children: [
                        const Text(
                          'Vehicle:  ',
                          style:
                              TextStyle(color: Colors.blueAccent, fontSize: 18),
                        ),
                        Text(Complaintwidget_servitor[touch_transport].vhcle),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 370,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.black, width: 1)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Problem:  ',
                            style: TextStyle(
                                color: Colors.blueAccent, fontSize: 18),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Text(
                                Complaintwidget_servitor[touch_transport]
                                    .prblm),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 150,
                    height: 60,
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Colors.orangeAccent),
                      child: TextButton(
                        child: const Text(
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

class complaint_class_servitor {
  late String usrname;
  late String mobl;
  late String prblm;
  late String vhcle;
  late String sends;

  complaint_class_servitor(String user_name, String mob_ile, String prob_lem,
      String veh_icle, String send) {
    usrname = user_name;
    mobl = mob_ile;
    prblm = prob_lem;
    vhcle = veh_icle;
    sends = send;
  }
}

class transportnotice extends StatefulWidget {
  const transportnotice({Key? key}) : super(key: key);

  @override
  State<transportnotice> createState() => _transportnoticeState();
}

class _transportnoticeState extends State<transportnotice> {
  final _auth = FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getcurrentuser();
  }

  void getcurrentuser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggeduser = user;
        print(loggeduser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://i.pngimg.me/thumb/f/720/comrawpixel6195913.jpg'),
                  fit: BoxFit.cover)),
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  width: double.maxFinite,
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                    width: 350,
                    height: 600,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.black),
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      color: Colors.transparent,
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: <Widget>[
                          const Text(
                            'NOTICE',
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              const Text(
                                'Subject',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                              SizedBox(
                                width: 250,
                                height: 50,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: TextField(
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    controller: subjectcontroller,
                                    decoration: const InputDecoration(
                                      labelText: 'Subject of Notice',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              const Text(
                                'Body :',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                              Container(
                                width: 250,
                                height: 400,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  color: Colors.white38,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: TextField(
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 18,
                                      controller: bodycontroller,
                                      decoration: const InputDecoration(
                                        labelText: 'Body of Notice',
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {
                        _firestore
                            .collection('notice')
                            .doc(Timestamp.now().toString())
                            .set({
                          'body': bodycontroller.text,
                          'subject': subjectcontroller.text,
                          'username': loggeduser.email,
                        });
                        notices.clear();
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: 100,
                        height: 50,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: Colors.blueAccent),
                        child: const Center(
                            child: Text(
                          'Post',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}

int touch = 0;
List<noticedata> notices = [];
TextEditingController subjectcontroller = TextEditingController();
TextEditingController bodycontroller = TextEditingController();

class notice extends StatefulWidget {
  const notice({Key? key}) : super(key: key);

  @override
  State<notice> createState() => _noticeState();
}

class _noticeState extends State<notice> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Notice',
          style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w500,
              letterSpacing: 2),
        ),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          width: 300,
          height: 10,
          child: Divider(
            color: Colors.grey,
            thickness: 2,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: [
            const Text(
              'Other Notices',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
                width: double.infinity,
                height: 180,
                child: StreamBuilder<QuerySnapshot>(
                  stream: _firestore.collection('notice').snapshots(),
                  builder: (context, snapshot) {
                    int indee = 0;
                    if (snapshot.hasData) {
                      final notice = snapshot.data!.docs;
                      for (var message in notice) {
                        indee++;
                        final subjects = message['subject'];
                        final body = message['body'];
                        notices.add(noticedata(subjects, body));
                      }
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: indee,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            width: 350,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                              border: Border.all(
                                  color: Colors.blueAccent, width: 4),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://www.crushpixel.com/big-static18/preview4/avatar-profile-pink-neon-icon-2920285.jpg'),
                                ),
                                const SizedBox(
                                  height: 9,
                                ),
                                const Text(
                                  'user_1693',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 9,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Subject: ',
                                      style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                        width: 200,
                                        height: 20,
                                        child: Text(
                                          notices[index].sub,
                                          maxLines: 1,
                                          overflow: TextOverflow.fade,
                                          softWrap: false,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 15),
                                        ))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          touch = index;
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const noticedisplay()));
                                        },
                                        child: Container(
                                            width: 60,
                                            height: 40,
                                            decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                color: Colors.green),
                                            child: const Center(
                                                child: Text(
                                              'Details',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )))),
                                    TextButton(
                                        onPressed: () async {
                                          await _firestore.runTransaction(
                                              (Transaction
                                                  myTransaction) async {
                                            await myTransaction.delete(snapshot
                                                .data!.docs[index].reference);
                                          });
                                          notices.removeAt(index);
                                        },
                                        child: Container(
                                            width: 60,
                                            height: 40,
                                            decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                color: Colors.redAccent),
                                            child: const Center(
                                                child: Text(
                                              'Delete',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )))),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                )),
            const SizedBox(
              height: 30,
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed('noti');
              },
              child: SizedBox(
                width: double.maxFinite,
                height: 100,
                child: Card(
                  color: Colors.blueAccent,
                  elevation: 1,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 100,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add,
                            size: 30,
                            color: Colors.black,
                          )),
                      const Text(
                        'Add New',
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}

class noticedata {
  late String sub;
  late String bod;
  noticedata(String subject, String body) {
    sub = subject;
    bod = body;
  }
}

class noticedisplay extends StatefulWidget {
  const noticedisplay({Key? key}) : super(key: key);

  @override
  State<noticedisplay> createState() => _noticedisplayState();
}

class _noticedisplayState extends State<noticedisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://i.pngimg.me/thumb/f/720/comrawpixel6195913.jpg'),
                  fit: BoxFit.cover)),
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  width: double.maxFinite,
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                    width: 350,
                    height: 600,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.black),
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      color: Colors.transparent,
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: <Widget>[
                          const Text(
                            'NOTICE',
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              const Text(
                                'Subject',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                              SizedBox(
                                  width: 250,
                                  height: 40,
                                  child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Text(
                                        notices[touch].sub,
                                        maxLines: null,
                                        style: const TextStyle(fontSize: 15),
                                      ))),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              const Text(
                                'Body :',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                              Container(
                                width: 250,
                                height: 400,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  color: Colors.white38,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Text(
                                        notices[touch].bod,
                                        style: const TextStyle(fontSize: 15),
                                      )),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: 1,
                  ),
                )
              ],
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
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Welcome!',
          style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w500,
              letterSpacing: 2),
        ),
        const SizedBox(
          height: 60,
        ),
        const Image(
            image: NetworkImage(
                'https://cdn.pixabay.com/photo/2014/04/02/16/18/bus-306857__340.png',
                scale: 3)),
        const SizedBox(
          height: 60,
        ),
        const SizedBox(
          width: 300,
          height: 20,
          child: Divider(
            color: Colors.grey,
            thickness: 2,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Recent Bookings',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          width: double.infinity,
          height: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              const SizedBox(width: 20),
              Container(
                width: 350,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  border: Border.all(color: Colors.blueAccent, width: 4),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://www.crushpixel.com/big-static18/preview4/avatar-profile-pink-neon-icon-2920285.jpg'),
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Text(
                          'user_1693',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Text(
                          'Departure Date: 16/09',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        Text(
                          'Departure Timing: 16:00',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Passengers: 1',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Remarks: ',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Container(
                width: 350,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  border: Border.all(color: Colors.blueAccent, width: 4),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://image.shutterstock.com/image-vector/contact-circle-neon-style-icon-260nw-1607646820.jpg'),
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Text(
                          'user_1709',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Text(
                          'Departure Date: 14/09',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        Text(
                          'Departure Timing: 10:00',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Passengers: 4',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Remarks: ',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),
        )
      ],
    ));
  }
}

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
