import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

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
                      Text('Emergency', style:
                      TextStyle(color: Colors.black, fontSize: 20, fontFamily: 'abcd'),
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
                  Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Icon(Icons.medical_information,color: Colors.blueAccent,),
                      SizedBox(
                        width: 20,
                      ),
                      Text('Medicine Section', style:
                      TextStyle(color: Colors.black, fontSize: 20, fontFamily: 'abcd'),
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









class queries extends StatefulWidget {
  const queries({Key? key}) : super(key: key);

  @override
  State<queries> createState() => _queriesState();
}

class _queriesState extends State<queries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body : SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://imgs.search.brave.com/fiZSCPx8nxa-iojJ5FaVBNywNlK-JWYJgiN3EvTxASM/rs:fit:744:1200:1/g:ce/aHR0cHM6Ly93d3cu/aXRsLmNhdC9wbmdm/aWxlL2JpZy85MC05/MDg5NjBfYmxhY2st/YW5kLXdoaXRlLXdo/YXRzYXBwLXRoZW1l/LXN1bW1pdC5qcGc'
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(border: Border(
                  left: BorderSide(width: 1, color: Colors.white60),
                  right: BorderSide(width: 1, color: Colors.white60),
                  top: BorderSide(width: 1, color: Colors.white60),
                ),color: Colors.transparent),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    TextButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_outlined, size: 32, color: Colors.white,)
                    ),


                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(0)),
                  border: Border.all(width: 1, color: Colors.white60,),color: Colors.transparent,),

                child: TextButton(
                  onPressed: (){
                    //Navigator.of(context).pushNamed('route name')
                  },
                  child: Center(child: Text('Public Chat Section', style: TextStyle(fontSize: 21,letterSpacing: 1.5, color: Colors.white,),)),
                ),


              ),
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(width: 1, color: Colors.white60),
                    right: BorderSide(width: 1, color: Colors.white60),
                    bottom: BorderSide(width: 1, color: Colors.white60),
                  ), color: Colors.transparent,
                ),

                child: Center(
                  child: Text('Find A Doctor!',style: TextStyle(fontSize: 21, letterSpacing: 1.5, color: Colors.white,),
                  ),
                ),
              ),

              Container(
                width: double.infinity,
                height: 535,
                decoration: BoxDecoration(border: Border(
                  left: BorderSide(width: 1, color: Colors.white60),
                  right: BorderSide(width: 1, color: Colors.white60),

                )),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 78,
                        decoration: BoxDecoration(color: Colors.transparent,),

                        child: TextButton(
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyProfilePage1()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage('https://imgs.search.brave.com/CPlOYC7JMvn10b7ofHRp2EJuxxmiS70NNV2-QCatPpY/rs:fit:474:225:1/g:ce/aHR0cHM6Ly90c2Uy/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5I/cE9pcGRzV2JRdUVf/MzFYY3hPSV9BSGFI/YSZwaWQ9QXBp'),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text('Profile 1',
                                    style: TextStyle(fontSize: 21, color: Colors.white,),),
                                ],
                              ),
                              Icon(Icons.double_arrow, color: Colors.white,),

                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 78,
                        decoration: BoxDecoration(color: Colors.transparent,),

                        child: TextButton(
                          onPressed: (){
                            //Navigator.of(context).pushNamed('route name')
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage('https://imgs.search.brave.com/CPlOYC7JMvn10b7ofHRp2EJuxxmiS70NNV2-QCatPpY/rs:fit:474:225:1/g:ce/aHR0cHM6Ly90c2Uy/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5I/cE9pcGRzV2JRdUVf/MzFYY3hPSV9BSGFI/YSZwaWQ9QXBp'),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text('Profile 2',
                                    style: TextStyle(fontSize: 21, color: Colors.white,),),
                                ],
                              ),
                              Icon(Icons.double_arrow, color: Colors.white,),

                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 78,
                        decoration: BoxDecoration(color: Colors.transparent,),

                        child: TextButton(
                          onPressed: (){
                            //Navigator.of(context).pushNamed('route name')
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage('https://imgs.search.brave.com/CPlOYC7JMvn10b7ofHRp2EJuxxmiS70NNV2-QCatPpY/rs:fit:474:225:1/g:ce/aHR0cHM6Ly90c2Uy/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5I/cE9pcGRzV2JRdUVf/MzFYY3hPSV9BSGFI/YSZwaWQ9QXBp'),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text('Profile 3',
                                    style: TextStyle(fontSize: 21, color: Colors.white,),),
                                ],
                              ),
                              Icon(Icons.double_arrow, color: Colors.white,),

                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 78,
                        decoration: BoxDecoration(color: Colors.transparent,),

                        child: TextButton(
                          onPressed: (){
                            //Navigator.of(context).pushNamed('route name')
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage('https://imgs.search.brave.com/CPlOYC7JMvn10b7ofHRp2EJuxxmiS70NNV2-QCatPpY/rs:fit:474:225:1/g:ce/aHR0cHM6Ly90c2Uy/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5I/cE9pcGRzV2JRdUVf/MzFYY3hPSV9BSGFI/YSZwaWQ9QXBp'),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text('Profile 4',
                                    style: TextStyle(fontSize: 21, color: Colors.white,),),
                                ],
                              ),
                              Icon(Icons.double_arrow, color: Colors.white,),

                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 78,
                        decoration: BoxDecoration(color: Colors.transparent,),

                        child: TextButton(
                          onPressed: (){
                            //Navigator.of(context).pushNamed('route name')
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage('https://imgs.search.brave.com/CPlOYC7JMvn10b7ofHRp2EJuxxmiS70NNV2-QCatPpY/rs:fit:474:225:1/g:ce/aHR0cHM6Ly90c2Uy/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5I/cE9pcGRzV2JRdUVf/MzFYY3hPSV9BSGFI/YSZwaWQ9QXBp'),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text('Profile 5',
                                    style: TextStyle(fontSize: 21, color: Colors.white,),),
                                ],
                              ),
                              Icon(Icons.double_arrow, color: Colors.white,),

                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 78,
                        decoration: BoxDecoration(color: Colors.transparent,),

                        child: TextButton(
                          onPressed: (){
                            //Navigator.of(context).pushNamed('route name')
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage('https://imgs.search.brave.com/CPlOYC7JMvn10b7ofHRp2EJuxxmiS70NNV2-QCatPpY/rs:fit:474:225:1/g:ce/aHR0cHM6Ly90c2Uy/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5I/cE9pcGRzV2JRdUVf/MzFYY3hPSV9BSGFI/YSZwaWQ9QXBp'),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text('Profile 7',
                                    style: TextStyle(fontSize: 21, color: Colors.white,),),
                                ],
                              ),
                              Icon(Icons.double_arrow, color: Colors.white,),

                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 78,
                        decoration: BoxDecoration(color: Colors.transparent,),

                        child: TextButton(
                          onPressed: (){
                            //Navigator.of(context).pushNamed('route name')
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage('https://imgs.search.brave.com/CPlOYC7JMvn10b7ofHRp2EJuxxmiS70NNV2-QCatPpY/rs:fit:474:225:1/g:ce/aHR0cHM6Ly90c2Uy/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5I/cE9pcGRzV2JRdUVf/MzFYY3hPSV9BSGFI/YSZwaWQ9QXBp'),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text('Profile 8',
                                    style: TextStyle(fontSize: 21, color: Colors.white,),),
                                ],
                              ),
                              Icon(Icons.double_arrow, color: Colors.white,),

                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 78,
                        decoration: BoxDecoration(color: Colors.transparent,),

                        child: TextButton(
                          onPressed: (){
                            //Navigator.of(context).pushNamed('route name')
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage('https://imgs.search.brave.com/CPlOYC7JMvn10b7ofHRp2EJuxxmiS70NNV2-QCatPpY/rs:fit:474:225:1/g:ce/aHR0cHM6Ly90c2Uy/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5I/cE9pcGRzV2JRdUVf/MzFYY3hPSV9BSGFI/YSZwaWQ9QXBp'),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text('Profile 9',
                                    style: TextStyle(fontSize: 21, color: Colors.white,),),
                                ],
                              ),
                              Icon(Icons.double_arrow, color: Colors.white,),

                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 78,
                        decoration: BoxDecoration(color: Colors.transparent,),

                        child: TextButton(
                          onPressed: (){
                            //Navigator.of(context).pushNamed('route name')
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage('https://imgs.search.brave.com/CPlOYC7JMvn10b7ofHRp2EJuxxmiS70NNV2-QCatPpY/rs:fit:474:225:1/g:ce/aHR0cHM6Ly90c2Uy/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5I/cE9pcGRzV2JRdUVf/MzFYY3hPSV9BSGFI/YSZwaWQ9QXBp'),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text('Profile 10',
                                    style: TextStyle(fontSize: 21, color: Colors.white,),),
                                ],
                              ),
                              Icon(Icons.double_arrow, color: Colors.white,),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),




            ],

          ),
        ) ,
      ),
    );
  }
}

class MyProfilePage1 extends StatefulWidget {
  const MyProfilePage1({Key? key}) : super(key: key);

  @override
  State<MyProfilePage1> createState() => _MyProfilePage1State();
}

class _MyProfilePage1State extends State<MyProfilePage1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://imgs.search.brave.com/fiZSCPx8nxa-iojJ5FaVBNywNlK-JWYJgiN3EvTxASM/rs:fit:744:1200:1/g:ce/aHR0cHM6Ly93d3cu/aXRsLmNhdC9wbmdm/aWxlL2JpZy85MC05/MDg5NjBfYmxhY2st/YW5kLXdoaXRlLXdo/YXRzYXBwLXRoZW1l/LXN1bW1pdC5qcGc'
              ),
              fit: BoxFit.cover,),
          ),
          child: Column(
              children: [

                Expanded (
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      TextButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back_outlined, size: 35, color: Colors.white,)),

                    ],
                  ),
                ),
                Expanded (
                  flex: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[

                      Expanded(
                        flex: 1,
                        child: Card(
                            margin: EdgeInsets.fromLTRB(15, 15, 0, 10),
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                            child: Image.network('https://imgs.search.brave.com/p5VuWncditi-nK9J5IhSp88bcgqGOxnWEDYknLOhq04/rs:fit:1000:1080:1/g:ce/aHR0cHM6Ly9jZG4z/LnZlY3RvcnN0b2Nr/LmNvbS9pLzEwMDB4/MTAwMC83OS85Mi9w/ZXJzb24td29ya2lu/Zy1vbi1hLWNvbXB1/dGVyLW9yLWxhcHRv/cC12ZWN0b3ItMjM3/Nzc5OTIuanBn', fit: BoxFit.cover,)),
                      ),
                      SizedBox(width: 15,),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            width: 184,
                            height: double.infinity,
                            decoration: BoxDecoration(color: Colors.transparent,
                                border: Border.all(color: Colors.white, width: 1), borderRadius: BorderRadius.all(Radius.circular(20))),

                            child: Column(
                              children: [
                                SizedBox(
                                  height: 7,
                                ),
                                Text('Clinic Status', style: TextStyle(fontSize: 14,color: Colors.white, fontWeight: FontWeight.bold),),
                                SizedBox(
                                  height: 13,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.location_city_rounded,color: Colors.white,),
                                    SizedBox(
                                      width: 52,
                                    ),
                                    Text('Noida, India', style: TextStyle(fontSize: 14, color: Colors.white,fontWeight: FontWeight.bold),)
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 86,
                                    ),
                                    Text('ENT Specialist' , style: TextStyle(fontSize: 12, color: Colors.white,fontWeight: FontWeight.bold ),),
                                  ],
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 80,
                                    ),
                                    Text('Contact Signing', style: TextStyle(fontSize: 12,color: Colors.white, fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 15,
                                      height: 5,
                                    ),
                                    SizedBox(
                                      width: 130,
                                      child: Divider(
                                        height: 5,
                                        thickness: 1.5,
                                        color: Colors.white,
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
                                      width: 25,
                                    ),
                                    Column(
                                      children: [
                                        Text('234', style: TextStyle(fontSize: 12, color: Colors.white,fontWeight: FontWeight.bold),),
                                        Text('contacts', style: TextStyle(fontSize: 12,color: Colors.white, fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 34,
                                    ),
                                    Column(
                                      children: [
                                        Text('714', style: TextStyle(fontSize: 12, color: Colors.white,fontWeight: FontWeight.bold),),
                                        Text('meetings', style: TextStyle(fontSize: 12,color: Colors.white, fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded (
                  flex: 2,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 35,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Dr. Arjun Singh',  style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),),
                          SizedBox(
                            height: 10,
                          ),
                          Text('B2B Senior Surgeon',  style: TextStyle(fontSize: 16, color: Colors.white,),),
                        ],
                      ),
                      SizedBox(
                        width: 140,
                      ),
                      TextButton(
                          onPressed: (){
                            //navigate
                          },
                          child: Icon(Icons.more_horiz_outlined, size: 35,color: Colors.white,)),
                    ],
                  ),
                ),
                Divider  (
                  thickness: 1,
                  height: 30,
                  color: Colors.white,
                ),
                Expanded (
                  flex: 3,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 65,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text('September 2022',style: TextStyle(fontSize: 17,color: Colors.white,)),
                              Icon(Icons.expand_more_outlined, size: 25,color: Colors.white,),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text('28',style: TextStyle(fontSize: 15, color: Colors.white,fontWeight: FontWeight.bold)),
                              SizedBox(
                                width: 25,
                              ),
                              Text('Contacts',style: TextStyle(fontSize: 15,color: Colors.white,)),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text('110',style: TextStyle(fontSize: 15,color: Colors.white,)),
                              SizedBox(
                                width: 18,
                              ),
                              Text('Meetings',style: TextStyle(fontSize: 15,color: Colors.white,)),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 80,
                            width: 145,
                            child: Row(
                              children: [
                                Container(
                                  width: 72,
                                  child: Card(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(7))),
                                    elevation: 5,
                                    margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                    color: Colors.blueGrey.shade400,
                                    child: Center(child: Text('+ 7%', style: TextStyle(fontSize: 14, color: Colors.white,fontWeight: FontWeight.bold),)),

                                  ),
                                ),
                                Container(
                                  width: 73,
                                  child: Card(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(7))),
                                    elevation: 5,
                                    margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                    color: Colors.blueGrey.shade400,
                                    child: Center(child: Text('More', style: TextStyle(fontSize: 14,color: Colors.white,),)),

                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),

                        ],
                      )
                    ],
                  ),
                ),
                Expanded (
                  flex: 4,
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 65,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade500,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: CircleAvatar(
                              radius: 70,
                              backgroundColor: Colors.blueGrey.shade400,
                              child: Text('25.4 %', style: TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Column(
                          children: [
                            Text('Notes:', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),),
                            SizedBox(
                              height: 20,
                            ),
                            Text('Ready for promotion', style: TextStyle(fontSize: 15, color: Colors.white,),)

                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded (
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    height: 40,
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }
}
