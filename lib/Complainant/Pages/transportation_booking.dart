import 'package:flutter/material.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Bookings',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w500,letterSpacing: 2),),
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
                    height: 150,
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(color: Colors.white70,
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
                                    backgroundImage: NetworkImage('https://image.shutterstock.com/image-vector/contact-circle-neon-style-icon-260nw-1607646820.jpg'),
                                  ),
                                  SizedBox(width: 9,),
                                  Text('driver_1709',style: TextStyle(color: Colors.black,fontSize: 15),),
                                ],
                              ),
                              const SizedBox(height: 9,),
                              const Text('Vehicle Number: HR23 4567',style: TextStyle(color: Colors.black,fontSize: 15),),
                              const Text('Vehicle Type: Charted Bus',style: TextStyle(color: Colors.black,fontSize: 15),),
                              const Text('Fair Charges: 5 Rs per Km',style: TextStyle(color: Colors.black,fontSize: 15),),

                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text('Remarks: ',style: TextStyle(color: Colors.black,fontSize: 15),),
                              Container(
                                width: 90,
                                height: 50,
                                decoration: const BoxDecoration(color: Colors.blueAccent,borderRadius: BorderRadius.all(Radius.circular(10))),
                                child: TextButton(onPressed: (){},
                                    child: const Text('Details',style: TextStyle(color: Colors.white,fontSize: 20),)
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    height: 150,
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(color: Colors.white70,
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
                                    backgroundImage: NetworkImage('https://image.shutterstock.com/image-vector/contact-circle-neon-style-icon-260nw-1607646820.jpg'),
                                  ),
                                  SizedBox(width: 9,),
                                  Text('driver_1709',style: TextStyle(color: Colors.black,fontSize: 15),),
                                ],
                              ),
                              const SizedBox(height: 9,),
                              const Text('Vehicle Number: HR23 4567',style: TextStyle(color: Colors.black,fontSize: 15),),
                              const Text('Vehicle Type: Charted Bus',style: TextStyle(color: Colors.black,fontSize: 15),),
                              const Text('Fair Charges: 5 Rs per Km',style: TextStyle(color: Colors.black,fontSize: 15),),

                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text('Remarks: ',style: TextStyle(color: Colors.black,fontSize: 15),),
                              Container(
                                width: 90,
                                height: 50,
                                decoration: const BoxDecoration(color: Colors.blueAccent,borderRadius: BorderRadius.all(Radius.circular(10))),
                                child: TextButton(onPressed: (){},
                                    child: const Text('Details',style: TextStyle(color: Colors.white,fontSize: 20),)
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    height: 150,
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(color: Colors.white70,
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
                                    backgroundImage: NetworkImage('https://image.shutterstock.com/image-vector/contact-circle-neon-style-icon-260nw-1607646820.jpg'),
                                  ),
                                  SizedBox(width: 9,),
                                  Text('driver_1709',style: TextStyle(color: Colors.black,fontSize: 15),),
                                ],
                              ),
                              const SizedBox(height: 9,),
                              const Text('Vehicle Number: HR23 4567',style: TextStyle(color: Colors.black,fontSize: 15),),
                              const Text('Vehicle Type: Charted Bus',style: TextStyle(color: Colors.black,fontSize: 15),),
                              const Text('Fair Charges: 5 Rs per Km',style: TextStyle(color: Colors.black,fontSize: 15),),

                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text('Remarks: ',style: TextStyle(color: Colors.black,fontSize: 15),),
                              Container(
                                width: 90,
                                height: 50,
                                decoration: const BoxDecoration(color: Colors.blueAccent,borderRadius: BorderRadius.all(Radius.circular(10))),
                                child: TextButton(onPressed: (){},
                                    child: const Text('Details',style: TextStyle(color: Colors.white,fontSize: 20),)
                                ),
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
          )),
    );
  }
}
