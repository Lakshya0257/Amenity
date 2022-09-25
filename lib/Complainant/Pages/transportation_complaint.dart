

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final firestore= FirebaseFirestore.instance;
final _auth = FirebaseAuth.instance;
late User loggeruser;
int touch=0;
List<complaint_class> Complaintwidget = [];


class complaint_transport_section extends StatefulWidget {
  const complaint_transport_section({Key? key}) : super(key: key);

  @override
  State<complaint_transport_section> createState() => _complaint_transport_sectionState();
}

class _complaint_transport_sectionState extends State<complaint_transport_section> {




  @override
  void initState() {
    super.initState();
    getcurrentuser();
  }

  void getcurrentuser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggeruser = user;
      }
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    final mobileWidth=MediaQuery.of(context).size.width;
    final mobileHeight=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: mobileWidth,
        height: mobileHeight,
        decoration: const BoxDecoration(image: DecorationImage(image: NetworkImage('https://static.vecteezy.com/system/resources/previews/000/095/572/non_2x/vector-dark-wallpaper-design.jpg'),fit: BoxFit.cover)),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(flex: 1,child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 5,),
                        IconButton(icon: const Icon(Icons.arrow_back_sharp,color: Colors.white,),onPressed: (){Navigator.of(context).pop();}),
                      ],
                    ),
                    const Text('Complaint',style: TextStyle(fontSize: 27,color: Colors.white),),
                    Row(
                      children: const [
                        CircleAvatar(backgroundImage: NetworkImage('https://st2.depositphotos.com/50337402/47092/v/380/depositphotos_470923054-stock-illustration-adult-man-avatar-short-curly.jpg?forcejpeg=true'),),
                        SizedBox(width: 20,),
                      ],
                    ),
                  ],
                ),
              ),),
              Expanded(flex: 6,child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 35),
                decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.black54),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(width: double.maxFinite),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 70,),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 25,
                              child: IconButton(icon: const Icon(Icons.call),onPressed: (){},),
                            ),
                          ],
                        ),
                        const CircleAvatar(
                          backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR59-m3AT7SI3Qth0e_hD22i0P0k4YukBJvsptTMlvAat7wqJTag2RH7aFB1upp6vVUbU8&usqp=CAU'),
                          radius: 35,
                        ),
                        Row(
                          children: const [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 25,
                              child: Icon(Icons.message),
                            ),
                            SizedBox(width: 70,)
                          ],
                        ),
                      ],
                    ),
                    const Text('Name of Complainant',style: TextStyle(color: Colors.white,fontSize: 20),)
                  ],
                ),
              )),
              Expanded(flex: 10,child: Container(
                margin: const EdgeInsets.all(0),
                decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),color: Colors.white),
                child: Column(
                  children: [
                    const SizedBox(height: 15,),
                    const Text('Complaint Booking',style: TextStyle(color: Colors.black,fontSize: 25),),
                    const SizedBox(height: 15,),
                    Container(
                      height: 90,
                      width: 340,
                      decoration: const BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: FlatButton(
                        onPressed: (){

                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Newcomplaint_transport_section()));
                        },

                        child: const Center(
                            child: Text('+ Add New', style: TextStyle(fontSize: 24, color: Colors.black,letterSpacing: 1.8, fontWeight: FontWeight.w500),)),
                      ),
                    ),
                    const SizedBox(height: 25,),
                    Container(
                      width: double.maxFinite,
                      height: 269,
                      child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance.collection('transport_complaint').snapshots(),
                        builder: (context,snapshot){
                          int indee=0;
                          if(snapshot.hasData){
                            final complaint=snapshot.data!.docs;
                            for(var complaints in complaint){
                              final sender=complaints['sender'];
                              if(sender==loggeruser.email.toString()){
                                indee++;
                                final complaintname = complaints['name'];
                                final complaintnumber = complaints['number'];
                                final complaintproblem = complaints['problem'];
                                final complaintvehicle = complaints['vehicle'];
                                Complaintwidget.add(complaint_class(complaintname, complaintnumber, complaintproblem, complaintvehicle));
                              }
                            }
                          }
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: indee,
                            itemBuilder: (BuildContext context, int index) {
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
                                        color: Colors.black, width: 4),
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
                                      Text(
                                        loggeruser.email.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      ),
                                      const SizedBox(
                                        height: 9,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Problem: ',
                                            style: TextStyle(
                                                color: Colors.blueAccent,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                              width: 200,
                                              height: 20,
                                              child: Text(
                                                Complaintwidget[index].prblm,
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
                                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const complaint_transport_display()));

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
                                              onPressed: () async{
                                                await firestore.runTransaction((Transaction myTransaction) async {
                                                  myTransaction.delete(snapshot.data!.docs[index].reference);
                                                });
                                                Complaintwidget.clear();

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
                      ),
                    ),


                  ],
                ),
              ),),
            ],
          ),
        ),
      ),
    );
  }
}


class complaint_class{
  late String usrname;
  late String mobl;
  late String prblm;
  late String vhcle;

  complaint_class( String user_name, String mob_ile, String prob_lem, String veh_icle){
    usrname = user_name;
    mobl = mob_ile;
    prblm = prob_lem;
    vhcle = veh_icle;
  }
}



class complaint_transport_display extends StatelessWidget {
  const complaint_transport_display({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: const BoxDecoration(image: DecorationImage(image: NetworkImage('https://i.pinimg.com/736x/f4/c7/c7/f4c7c774933d1cf1487e59296b2351c1--a-r-iphone-wallpaper.jpg'),fit: BoxFit.cover)),
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
                            const SizedBox(width: 20,),
                            IconButton(icon: const Icon(Icons.arrow_back,size: 30,),onPressed: (){Navigator.of(context).pop();},),
                          ],
                        ),
                        Row(
                          children: const [
                            Image(image: NetworkImage('https://st2.depositphotos.com/3765753/5349/v/600/depositphotos_53491365-stock-illustration-complaint-red-rubber-stamp-vector.jpg')),
                            SizedBox(width: 20,)
                          ],
                        )
                      ],
                    ),
                  ),

                  const SizedBox(
                    width: double.maxFinite,
                    height: 40,
                    child: Center(child: Text('Transport Complaint',style: TextStyle(color: Colors.black,fontSize: 30),)),
                  ),
                  const SizedBox(
                    width: 300,
                    height: 70,
                    child: Divider(
                      thickness: 2,
                      color: Colors.black,
                    ),),
                  SizedBox(width: 370,
                    height: 40,
                    child: Row(
                      children: [
                        const Text('Username:  ',style: TextStyle(color: Colors.blueAccent,fontSize: 18),),
                        Text(
                          Complaintwidget[touch].usrname
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(width: 370,
                    height: 40,
                    child: Row(
                      children: [
                        const Text('Email/mobile:  ',style: TextStyle(color: Colors.blueAccent,fontSize: 18),),
                        Text(
                          Complaintwidget[touch].mobl
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(width: 370,
                    height: 40,
                    child: Row(
                      children: [
                        const Text('Vehicle:  ',style: TextStyle(color: Colors.blueAccent,fontSize: 18),),
                        Text(
                          Complaintwidget[touch].vhcle
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(width:370,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.black,width: 1)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Problem:  ',style: TextStyle(color: Colors.blueAccent,fontSize: 18),),
                          SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Text(
                              Complaintwidget[touch].prblm
                              ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  SizedBox(
                    width: 150,
                    height: 60,
                    child: Container(
                      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)),color: Colors.orangeAccent),
                      child: TextButton(
                        child: const Text('Back',style: TextStyle(fontSize: 20,color: Colors.black),),
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  )

                ],
              ),
            ),
          ),
        )
    );
  }
}







class Newcomplaint_transport_section extends StatefulWidget {
  const Newcomplaint_transport_section({Key? key}) : super(key: key);

  @override
  State<Newcomplaint_transport_section> createState() => _Newcomplaint_transport_sectionState();
}

class _Newcomplaint_transport_sectionState extends State<Newcomplaint_transport_section> {
  TextEditingController problem = TextEditingController();
  TextEditingController date_controller = TextEditingController();
  TextEditingController time_controller = TextEditingController();
  TextEditingController vehicle = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController number = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: const BoxDecoration(image: DecorationImage(image: NetworkImage('https://i.pinimg.com/736x/f4/c7/c7/f4c7c774933d1cf1487e59296b2351c1--a-r-iphone-wallpaper.jpg'),fit: BoxFit.cover)),
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
                            const SizedBox(width: 20,),
                            IconButton(icon: const Icon(Icons.arrow_back,size: 30,),onPressed: (){Navigator.of(context).pop();},),
                          ],
                        ),
                        Row(
                          children: const [
                            Image(image: NetworkImage('https://st2.depositphotos.com/3765753/5349/v/600/depositphotos_53491365-stock-illustration-complaint-red-rubber-stamp-vector.jpg')),
                            SizedBox(width: 20,)
                          ],
                        )
                      ],
                    ),
                  ),

                  const SizedBox(
                    width: double.maxFinite,
                    height: 40,
                    child: Center(child: Text('Fill out the form below to file a complaint.',style: TextStyle(color: Colors.black,fontSize: 20),)),
                  ),
                  const SizedBox(
                    width: 300,
                    height: 70,
                    child: Divider(
                      thickness: 2,
                      color: Colors.black,
                    ),),
                  SizedBox(width: 370,
                    height: 50,
                    child: TextFormField(
                      controller: username,
                      decoration:const InputDecoration(
                          labelText: 'Username',
                          alignLabelWithHint: true,
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
                      ) ,),
                  ),
                  const SizedBox(height: 20,),
                  SizedBox(width: 370,
                    height: 50,
                    child: TextFormField(
                      controller: number,
                      decoration:const InputDecoration(
                          labelText: 'Email/Mobile Number',
                          alignLabelWithHint: true,
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
                      ) ,),
                  ),
                  const SizedBox(height: 20,),
                  SizedBox(width: 370,
                    height: 50,
                    child: TextFormField(
                      controller: vehicle,
                      keyboardType: TextInputType.text,
                      decoration:const InputDecoration(
                          labelText: 'Vehicle Type(Bus, Cab, Bike)',
                          alignLabelWithHint: true,
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
                      ) ,),
                  ),
                  const SizedBox(height: 20,),
                  Container(width:370,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.black,width: 1)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: TextFormField(
                          controller: problem,
                          keyboardType: TextInputType.multiline,
                          maxLines: 8,
                          decoration:const InputDecoration(
                            labelText: 'Problem',
                            hintText: 'Briefly describe your problem here',
                            alignLabelWithHint: true,
                          ) ,),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  SizedBox(
                    width: 150,
                    height: 60,
                    child: Container(
                      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)),color: Colors.orangeAccent),
                      child: TextButton(
                        child: const Text('Submit',style: TextStyle(fontSize: 20,color: Colors.black),),
                        onPressed: ()async{
                          firestore.collection('transport_complaint').doc(Timestamp.now().toString()).set({
                            'name':username.text,
                            'number':number.text,
                            'problem':problem.text,
                            'vehicle':vehicle.text,
                            'sender': loggeruser.email.toString()
                          });
                          Complaintwidget.clear();
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  )

                ],
              ),
            ),
          ),
        )
    );
  }
}
