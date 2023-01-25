import 'package:amenityfinal/Servitor/login/servitor_login.dart';
import 'package:amenityfinal/common_refactor/TextButton.dart';
import 'package:amenityfinal/common_refactor/common_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

List<emergency_medical_servitor> emergency_medical=[];
List<queries_medical_servitor> queries_medical=[];





class medicalservitor extends StatefulWidget {
  const medicalservitor({Key? key}) : super(key: key);

  @override
  State<medicalservitor> createState() => _medicalservitorState();
}

class _medicalservitorState extends State<medicalservitor> {
  var _selectedTab = _SelectedTab.home;
  int x = 0;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
      x = i;
    });
  }

  var y = [home(), emergency(), Queries(), Static_Profile()];
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
            icon: Icon(Icons.add),
          ),
          DotNavigationBarItem(
            icon: Icon(Icons.question_mark_rounded),
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
                    SizedBox(
                      width: 20,
                    ),
                    IconButton(
                        onPressed: () {
                          ZoomDrawer.of(context)!.toggle();
                        },
                        icon: Icon(
                          Icons.menu_rounded,
                          color: Colors.white,
                        )),
                  ],
                ),
                Row(
                  children: [
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

enum _SelectedTab { home, air, clean, profile }

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
                'https://www.freepnglogos.com/uploads/medical-logo-png-5.png'),
          ),
        )
      ],
    );
  }
}

class emergency extends StatefulWidget {
  const emergency({Key? key}) : super(key: key);

  @override
  State<emergency> createState() => _emergencyState();
}

class _emergencyState extends State<emergency> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text(
            'Emergency',
            style: TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 20,
          ),
          button(
            navigator_class: Ambulance(),
            width: MediaQuery.of(context).size.width * .90,
            height: 100,
            border: 30,
            color: Colors.blueAccent,
            child: Center(child: Text('Add New',style: TextStyle(color: Colors.white,fontSize: 25,letterSpacing: 2,fontWeight: FontWeight.w500),)),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*.5,
            width: double.maxFinite,
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('emergency').snapshots(),
              builder: (context, snapshot) {
                emergency_medical.clear();
                int indee=0;
                if (snapshot.hasData) {
                  final notice = snapshot.data!.docs;
                  for (var message in notice) {
                    indee++;
                    final name = message['username'];
                    final mobile = message['mobile'];
                    final service = message['service'];
                    final hospital = message['hospital'];
                    final vehicle = message['vehicle'];
                    emergency_medical.add(emergency_medical_servitor(name,mobile,service,hospital,vehicle));
                  }
                }
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: indee,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                      child: Container(
                        width: double.maxFinite,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          const BorderRadius.all(Radius.circular(30)),
                          border: Border.all(
                              color: Colors.blueAccent, width: 4),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://www.crushpixel.com/big-static18/preview4/avatar-profile-pink-neon-icon-2920285.jpg'),
                            ),
                            const SizedBox(
                              height: 9,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Amb. Driver: ',style: TextStyle(
                                    color: Colors.blueAccent, fontSize: 15,fontWeight: FontWeight.bold),),
                                Text(
                                  emergency_medical[index].username,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 9,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Email/Phone number: ',
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  emergency_medical[index].mobile,
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Service type: ',
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  emergency_medical[index].type,
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Hospital: ',
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  emergency_medical[index].hospital,
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Vehicle number: ',
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  emergency_medical[index].vehicle,
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15),
                                )
                              ],
                            ),
                            TextButton(
                                onPressed: () async {
                                  await FirebaseFirestore.instance.runTransaction(
                                          (Transaction
                                      myTransaction) async {
                                        await myTransaction.delete(snapshot
                                            .data!.docs[index].reference);
                                      });
                                  emergency_medical.removeAt(index);
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
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}



class emergency_medical_servitor{
  late String username;
  late String mobile;
  late String type;
  late String hospital;
  late String vehicle;
  emergency_medical_servitor(String name, String phone, String service, String hospi, String vehicl){
    username=name;
    mobile=phone;
    type=service;
    hospital=hospi;
    vehicle=vehicl;
  }
}

class Ambulance extends StatefulWidget {
  const Ambulance({Key? key}) : super(key: key);

  @override
  State<Ambulance> createState() => _AmbulanceState();
}

class _AmbulanceState extends State<Ambulance> {
  TextEditingController username=TextEditingController();
  TextEditingController mobile=TextEditingController();
  TextEditingController service=TextEditingController();
  TextEditingController hospital=TextEditingController();
  TextEditingController Vehiclenumber=TextEditingController();
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
                      'https://w0.peakpx.com/wallpaper/242/720/HD-wallpaper-black-orange-abstract-black-modern-new-shadow-shape-waves-white-thumbnail.jpg'),
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.blueAccent,
                                size: 30,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 110,
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    height: 40,
                    child: Center(
                        child: Text(
                          'Add new emergency service.',
                          style: TextStyle(color: Colors.black, fontSize: 25),
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
                          labelText: 'Name of Driver',
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
                  SizedBox(
                    width: 370,
                    height: 50,
                    child: TextFormField(
                      controller: service,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: 'Service Type',
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
                      controller: hospital,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: 'Hospital',
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
                      controller: Vehiclenumber,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: 'Vehicle number',
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
                              .collection('emergency')
                              .doc(Timestamp.now().toString())
                              .set({
                            'username': username.text,
                            'mobile': mobile.text,
                            'service': service.text,
                            'hospital': hospital.text,
                            'vehicle': Vehiclenumber.text,
                          });
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

class queries_medical_servitor{
  late String username;
  late String mobile;
  late String email;
  late String hospital;
  late String speciality;
  queries_medical_servitor(String name, String phone, String service, String hospi, String vehicl){
    username=name;
    mobile=phone;
    email=service;
    hospital=hospi;
    speciality=vehicl;
  }
}

class Queries extends StatefulWidget {
  const Queries({Key? key}) : super(key: key);

  @override
  State<Queries> createState() => _QueriesState();
}

class _QueriesState extends State<Queries> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text(
            'Queries',
            style: TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 20,
          ),
          button(
            navigator_class: doctor_name(),
            width: MediaQuery.of(context).size.width * .90,
            height: 100,
            border: 30,
            color: Colors.blueAccent,
            child: Center(child: Text('Add New',style: TextStyle(color: Colors.white,fontSize: 25,letterSpacing: 2,fontWeight: FontWeight.w500),)),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*.5,
            width: double.maxFinite,
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('doctor').snapshots(),
              builder: (context, snapshot) {
                queries_medical.clear();
                int indee=0;
                if (snapshot.hasData) {
                  final notice = snapshot.data!.docs;
                  for (var message in notice) {
                    indee++;
                    final name = message['username'];
                    final mobile = message['mobile'];
                    final service = message['email'];
                    final hospital = message['hospital'];
                    final vehicle = message['special'];
                    queries_medical.add(queries_medical_servitor(name,mobile,service,hospital,vehicle));
                  }
                }
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: indee,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                      child: Container(
                        width: double.maxFinite,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          const BorderRadius.all(Radius.circular(30)),
                          border: Border.all(
                              color: Colors.blueAccent, width: 4),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://www.crushpixel.com/big-static18/preview4/avatar-profile-pink-neon-icon-2920285.jpg'),
                            ),
                            const SizedBox(
                              height: 9,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Name of Doctor: ',style: TextStyle(
                                    color: Colors.blueAccent, fontSize: 15,fontWeight: FontWeight.bold),),
                                Text(
                                  queries_medical[index].username,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 9,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Email Address: ',
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  queries_medical[index].email,
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Speciality: ',
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  queries_medical[index].speciality,
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Hospital: ',
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  queries_medical[index].hospital,
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Phone number: ',
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  queries_medical[index].mobile,
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15),
                                )
                              ],
                            ),
                            TextButton(
                                onPressed: () async {
                                  await FirebaseFirestore.instance.runTransaction(
                                          (Transaction
                                      myTransaction) async {
                                        await myTransaction.delete(snapshot
                                            .data!.docs[index].reference);
                                      });
                                  queries_medical.removeAt(index);
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
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}



class doctor_name extends StatefulWidget {
  const doctor_name({Key? key}) : super(key: key);

  @override
  State<doctor_name> createState() => _doctor_nameState();
}

class _doctor_nameState extends State<doctor_name> {
  TextEditingController username=TextEditingController();
  TextEditingController mobile=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController hospital=TextEditingController();
  TextEditingController special=TextEditingController();
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
                      'https://w0.peakpx.com/wallpaper/242/720/HD-wallpaper-black-orange-abstract-black-modern-new-shadow-shape-waves-white-thumbnail.jpg'),
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.blueAccent,
                                size: 30,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 110,
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    height: 40,
                    child: Center(
                        child: Text(
                          'New Doctor Details.',
                          style: TextStyle(color: Colors.black, fontSize: 25),
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
                          labelText: 'Name of Doctor',
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
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: 'Email Address',
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
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          labelText: 'Phone number',
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
                      controller: hospital,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: 'Hospital',
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
                      controller: special,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: 'Speciality',
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
                              .collection('doctor')
                              .doc(Timestamp.now().toString())
                              .set({
                            'username': username.text,
                            'mobile': mobile.text,
                            'email': email.text,
                            'hospital': hospital.text,
                            'special': special.text,
                          });
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


