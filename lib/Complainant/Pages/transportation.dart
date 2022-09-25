import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:amenityfinal/Complainant/Pages/transportation_complaint.dart';
import 'package:amenityfinal/Complainant/Pages/transportation_booking.dart';
import 'package:amenityfinal/Complainant/Pages/transportation_notice.dart';

class transport extends StatefulWidget {
  const transport({Key? key}) : super(key: key);

  @override
  State<transport> createState() => _transportState();
}

class _transportState extends State<transport> {
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
              child: Text('TRANSPORTATION',style: TextStyle(fontSize: 35,fontFamily: 'abcd',fontWeight: FontWeight.w500,color: Colors.black),),
            )),
        Expanded(
            flex: 4,
            child: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 120,
              child: Image.network('https://imgs.search.brave.com/Ku_CAhN2_41XfZsQEjBLc5DNyc8ZRi6PxVf2m4N0OkQ/rs:fit:760:283:1/g:ce/aHR0cDovL3d3dy5w/bmdtYXJ0LmNvbS9m/aWxlcy8xMS9Mb2dp/c3RpY3MtVHJhbnNw/b3J0LVBORy1UcmFu/c3BhcmVudC1QaWN0/dXJlLnBuZw',
                scale: 4,),
            )),
        Expanded(
            flex: 3,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text('Transportation Section', style:
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
                          thickness: 2.5,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>booking_transport_section()));
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          width: 50,
                        ),
                        Icon(Icons.bus_alert_outlined,color: Colors.blueAccent,),
                        SizedBox(
                          width: 20,
                        ),
                        Text('Booking', style:
                        TextStyle(color: Colors.black, fontSize: 20, fontFamily: 'abcd'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Icon(Icons.book_outlined,color: Colors.blueAccent,),
                      SizedBox(
                        width: 20,
                      ),
                      TextButton(
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>complaint_transport_section()));
                        },
                        child: Text('Complaint', style:
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
                      Icon(Icons.book,color: Colors.blueAccent,),
                      SizedBox(
                        width: 20,
                      ),
                      TextButton(
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>notice_transport_section()));
                        },
                        child: Text('Notice', style:
                        TextStyle(color: Colors.black, fontSize: 20, fontFamily: 'abcd'),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            )),
      ],
    );
  }
}
