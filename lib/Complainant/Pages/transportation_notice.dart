import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


final _firestore = FirebaseFirestore.instance;


int touch = 0;
List<noticedata> notices = [];

class noticedata{
  late String sub;
  late String bod;
  noticedata(String subject,String body){
    sub=subject;
    bod=body;
  }
}


class notice_transport_section extends StatefulWidget {
  const notice_transport_section({Key? key}) : super(key: key);

  @override
  State<notice_transport_section> createState() => _notice_transport_sectionState();
}

class _notice_transport_sectionState extends State<notice_transport_section> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: NetworkImage('https://w0.peakpx.com/wallpaper/108/670/HD-wallpaper-black.jpg'),fit: BoxFit.cover)),
        child: SafeArea(
          child: Column(
            children: [

              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 5,),
                        IconButton(icon: Icon(Icons.arrow_back_sharp,size : 30,color: Colors.white,),onPressed: (){Navigator.of(context).pop();}),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 13, 0, 0),
                      child: Text('Notices',style: TextStyle(fontSize: 28,color: Colors.white),),
                    ),
                    Row(
                      children: [
                        CircleAvatar(backgroundImage: NetworkImage('https://st2.depositphotos.com/50337402/47092/v/380/depositphotos_470923054-stock-illustration-adult-man-avatar-short-curly.jpg?forcejpeg=true'),),
                        SizedBox(width: 20,),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: Center(
                        child: Divider(
                          thickness: 1,
                          color: Colors.white38,

                        ),
                      ),
                    ),
                  )),

              Expanded(
                  flex: 2,
                  child: SizedBox(
                    width: double.maxFinite,
                  )),
              Expanded(
                  flex: 5,
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaFEjfKCUHWoH8xoV7fihgXaGxn955DgUBqA&usqp=CAU'),),
                  )),
              Expanded(
                flex: 4,
                child: SizedBox(
                  width: double.maxFinite,
                  height: 180,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: _firestore.collection('notice').snapshots(),
                    builder: (context, snapshot) {
                      notices.clear();
                      int indee=0;
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
                                              ))))
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),

                ),
              ),
              Expanded(
                  flex: 2,
                  child: SizedBox()),
            ],
          ),
        ),
      ),
    );
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