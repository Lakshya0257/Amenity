import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../Servitor/pages/transportservitor.dart';

class booking_transport_section extends StatefulWidget {
  const booking_transport_section({Key? key}) : super(key: key);

  @override
  State<booking_transport_section> createState() => _booking_transport_sectionState();
}

class _booking_transport_sectionState extends State<booking_transport_section> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
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
                    const Text('Bookings',style: TextStyle(fontSize: 30,color: Colors.white),),
                    Row(
                      children: const [
                        CircleAvatar(backgroundImage: NetworkImage('https://st2.depositphotos.com/50337402/47092/v/380/depositphotos_470923054-stock-illustration-adult-man-avatar-short-curly.jpg?forcejpeg=true'),),
                        SizedBox(width: 20,),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60,),
              SizedBox(
                height: 200,
                child: Image(image: NetworkImage('https://www.osiztechnologies.com/asset/images/inner-pages/transportation_logistics/why-osiz-for-transportation-and-logistics-service.png'),),
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*.5,
                width: double.maxFinite,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('Transport_service').snapshots(),
                  builder: (context, snapshot) {
                    driver_service.clear();
                    int indee=0;
                    if (snapshot.hasData) {
                      final notice = snapshot.data!.docs;
                      for (var message in notice) {
                        indee++;
                        final name = message['username'];
                        final mobile = message['mobile'];
                        final fare = message['fare'];
                        final vehiclenum = message['vehicle_number'];
                        final vehicle = message['vehicle'];
                        driver_service.add(driver_service_servitor(name,mobile,fare,vehicle,vehiclenum));
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
                                    Text('Nme of Driver: ',style: TextStyle(
                                        color: Colors.blueAccent, fontSize: 15,fontWeight: FontWeight.bold),),
                                    Text(
                                      driver_service[index].name,
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
                                      driver_service[index].mobile,
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
                                      'Fare charges/Km: ',
                                      style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      driver_service[index].fare,
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
                                      'Vehicle: ',
                                      style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      driver_service[index].vehicle,
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
                                      driver_service[index].vehiclenumber,
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
      ),
    );
  }
}
