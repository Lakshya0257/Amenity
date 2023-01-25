import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


List queries_complaint=[];
List<emergency_medical_complaint> emergency_complaint=[];

class medical extends StatefulWidget {
  const medical({Key? key}) : super(key: key);

  @override
  State<medical> createState() => _medicalState();
}

class _medicalState extends State<medical> {
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
              child: Text('MEDICAL',style: TextStyle(fontSize: 35,fontFamily: 'abcd',fontWeight: FontWeight.w500,color: Colors.black),),
            )),
        Expanded(
            flex: 4,
            child: Container(
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 120,
                child: Image.network('https://imgs.search.brave.com/BaclFr7DecG8XeD-ct5XT24A4-Y3Ttgrz4cZIIl8B7Q/rs:fit:1200:1200:1/g:ce/aHR0cHM6Ly93ZWJz/dG9ja3Jldmlldy5u/ZXQvaW1hZ2VzL2Ns/aXBhcnQtZG9jdG9y/LXBvY2tldC04LnBu/Zw', scale: 7,),),

            )),
        Expanded(
            flex: 3,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text('Medical Section', style:
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
                  Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Icon(Icons.emergency_outlined,color: Colors.blueAccent,),
                      SizedBox(
                        width: 20,
                      ),
                      TextButton(
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>emergency()));
                        },
                        child: Text('Emergency', style:
                        TextStyle(color: Colors.black, fontSize: 20, fontFamily: 'abcd'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Icon(Icons.question_answer_outlined,color: Colors.blueAccent,),
                      SizedBox(
                        width: 20,
                      ),
                      TextButton(
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>queries()));
                        },
                        child: Text('Queries', style:
                        TextStyle(color: Colors.black, fontSize: 20, fontFamily: 'abcd'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),

                ],
              ),

            )),
      ],
    );
  }
}









class queries extends StatefulWidget {
  const queries({Key? key}) : super(key: key);

  @override
  State<queries> createState() => _queriesState();
}

class _queriesState extends State<queries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: 50,
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
                  const Text('Queries',style: TextStyle(fontSize: 30,color: Colors.white),),
                  Row(
                    children: const [
                      CircleAvatar(backgroundImage: NetworkImage('https://st2.depositphotos.com/50337402/47092/v/380/depositphotos_470923054-stock-illustration-adult-man-avatar-short-curly.jpg?forcejpeg=true'),),
                      SizedBox(width: 20,),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*.6,
              width: double.maxFinite,
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('doctor').snapshots(),
                builder: (context, snapshot) {
                  queries_complaint.clear();
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
                      queries_complaint.add(queries_medical_complaint(name,mobile,service,hospital,vehicle));
                    }
                  }
                  return indee==0?Center(child: Image(image: NetworkImage('https://cdn.pixabay.com/photo/2020/08/03/09/43/medical-5459654__340.png'))) :ListView.builder(
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
                                    queries_complaint[index].username,
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
                                    queries_complaint[index].email,
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
                                    queries_complaint[index].speciality,
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
                                    queries_complaint[index].hospital,
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
                                    queries_complaint[index].mobile,
                                    maxLines: 1,
                                    overflow: TextOverflow.fade,
                                    softWrap: false,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15),
                                  )
                                ],
                              ),
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
      ),
    );
  }
}

class queries_medical_complaint{
  late String username;
  late String mobile;
  late String email;
  late String hospital;
  late String speciality;
  queries_medical_complaint(String name, String phone, String service, String hospi, String vehicl){
    username=name;
    mobile=phone;
    email=service;
    hospital=hospi;
    speciality=vehicl;
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
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: 50,
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
                  const Text('Emergency',style: TextStyle(fontSize: 30,color: Colors.white),),
                  Row(
                    children: const [
                      CircleAvatar(backgroundImage: NetworkImage('https://st2.depositphotos.com/50337402/47092/v/380/depositphotos_470923054-stock-illustration-adult-man-avatar-short-curly.jpg?forcejpeg=true'),),
                      SizedBox(width: 20,),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*.6,
              width: double.maxFinite,
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('emergency').snapshots(),
                builder: (context, snapshot) {
                  emergency_complaint.clear();
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
                      emergency_complaint.add(emergency_medical_complaint(name,mobile,service,hospital,vehicle));
                    }
                  }
                  return indee==0?Center(child: Image(image: NetworkImage('https://www.freepnglogos.com/uploads/doctor-png/doctor-icon-33.png'))) :ListView.builder(
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
                                    emergency_complaint[index].username,
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
                                    emergency_complaint[index].mobile,
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
                                    emergency_complaint[index].type,
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
                                    emergency_complaint[index].hospital,
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
                                    emergency_complaint[index].vehicle,
                                    maxLines: 1,
                                    overflow: TextOverflow.fade,
                                    softWrap: false,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15),
                                  )
                                ],
                              ),
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
      ),
    );
  }
}

class emergency_medical_complaint{
  late String username;
  late String mobile;
  late String type;
  late String hospital;
  late String vehicle;
  emergency_medical_complaint(String name, String phone, String service, String hospi, String vehicl){
    username=name;
    mobile=phone;
    type=service;
    hospital=hospi;
    vehicle=vehicl;
  }
}
