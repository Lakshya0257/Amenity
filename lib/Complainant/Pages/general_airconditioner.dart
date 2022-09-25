import 'package:amenityfinal/common_refactor/TextButton.dart';
import 'package:amenityfinal/common_refactor/background_image.dart';
import 'package:amenityfinal/common_refactor/textform_field.dart';
import 'package:flutter/material.dart';




class complaint_airconditioner extends StatefulWidget {
  const complaint_airconditioner({Key? key}) : super(key: key);

  @override
  State<complaint_airconditioner> createState() => _complaint_airconditionerState();
}

class _complaint_airconditionerState extends State<complaint_airconditioner> {
  @override
  Widget build(BuildContext context){
    return  Scaffold(
        body: background(link: 'https://static.vecteezy.com/system/resources/previews/000/095/572/non_2x/vector-dark-wallpaper-design.jpg', child: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(width: double.maxFinite,height: 50,child: Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 5,),
                          IconButton(icon: Icon(Icons.arrow_back_sharp,color: Colors.white,),onPressed: (){Navigator.of(context).pop();}),
                        ],
                      ),
                      Text('Air Conditioner',style: TextStyle(fontSize: 27,color: Colors.white),),
                      Row(
                        children: [
                          CircleAvatar(backgroundImage: NetworkImage('https://st2.depositphotos.com/50337402/47092/v/380/depositphotos_470923054-stock-illustration-adult-man-avatar-short-curly.jpg?forcejpeg=true'),),
                          SizedBox(width: 20,),
                        ],
                      ),
                    ],
                  ),
                ),),
                SizedBox(width: double.maxFinite,height: 260,child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 30,vertical: 35),
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.black54),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Servitor Information',style: TextStyle(color: Colors.white,fontSize: 20),),
                      SizedBox(width: double.maxFinite),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 70,),
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 25,
                                child: IconButton(icon: Icon(Icons.call),onPressed: (){},),
                              ),
                            ],
                          ),
                          CircleAvatar(
                            backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR59-m3AT7SI3Qth0e_hD22i0P0k4YukBJvsptTMlvAat7wqJTag2RH7aFB1upp6vVUbU8&usqp=CAU'),
                            radius: 35,
                          ),
                          Row(
                            children: [
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
                      Text('Name of Servitor',style: TextStyle(color: Colors.white,fontSize: 20),)
                    ],
                  ),
                )),
                SizedBox(width: double.maxFinite,height: 446,child: Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),color: Colors.white),
                  child: Column(
                    children: [
                      SizedBox(height: 15,),
                      Text('Complaint Booking',style: TextStyle(color: Colors.black,fontSize: 25),),
                      SizedBox(height: 15,),
                      button(navigator_class: Newcomplaint_airconditioner(), width: double.maxFinite, height: 120, child: Text('Add New',style: TextStyle(color: Colors.black,fontSize: 22),), border: 30, color: Colors.orange),
                      Row(children: [
                        SizedBox(
                          width: 30,
                        ),
                        CircleAvatar(backgroundImage: NetworkImage('https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/1b3bf719-8603-4211-a054-1e161ce09a89/dbew1q0-79de3f9e-ab12-410e-b165-ce293519dce6.png/v1/fill/w_1192,h_670,q_70,strp/the_avatar_and_the_firelord_minimalist_wallpaper_by_damionmauville_dbew1q0-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MzQ0MCIsInBhdGgiOiJcL2ZcLzFiM2JmNzE5LTg2MDMtNDIxMS1hMDU0LTFlMTYxY2UwOWE4OVwvZGJldzFxMC03OWRlM2Y5ZS1hYjEyLTQxMGUtYjE2NS1jZTI5MzUxOWRjZTYucG5nIiwid2lkdGgiOiI8PTYxMTYifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.91XBH23sDk8ELLrhiVKxi_feasIuvsT91YuZ_nls5PM'),radius: 25,),
                        SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: 250,
                          height: 80,
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Enter your comment',
                            ),
                          ),
                        )
                      ],)
                    ],
                  ),
                ),)
              ],
            ),
          ),
        ))
    );
  }
}





class Newcomplaint_airconditioner extends StatefulWidget {
  const Newcomplaint_airconditioner({Key? key}) : super(key: key);

  @override
  State<Newcomplaint_airconditioner> createState() => _Newcomplaint_airconditionerState();
}

class _Newcomplaint_airconditionerState extends State<Newcomplaint_airconditioner> {
  String dropdownvalue = 'Girls Hostel';
  var items=['Girls Hostel','Boys Hostel','Other'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(image: DecorationImage(image: NetworkImage('https://i.pinimg.com/736x/f4/c7/c7/f4c7c774933d1cf1487e59296b2351c1--a-r-iphone-wallpaper.jpg'),fit: BoxFit.cover)),
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
                          SizedBox(width: 20,),
                          IconButton(icon: Icon(Icons.arrow_back,size: 30,),onPressed: (){Navigator.of(context).pop();},),
                        ],
                      ),
                      Row(
                        children: [
                          Image(image: NetworkImage('https://st2.depositphotos.com/3765753/5349/v/600/depositphotos_53491365-stock-illustration-complaint-red-rubber-stamp-vector.jpg')),
                          SizedBox(width: 20,)
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 40,
                  child: Center(child: Text('Fill out the form below to file a complaint.',style: TextStyle(color: Colors.black,fontSize: 20),)),
                ),
                SizedBox(
                  width: 300,
                  height: 70,
                  child: Divider(
                    thickness: 2,
                    color: Colors.black,
                  ),),
                text_field(width: 370, height: 50, type: TextInputType.text, label_text: 'Username', radius: 20),
                SizedBox(height: 20,),
                text_field(width: 370, height: 50, type: TextInputType.emailAddress, label_text: 'Email', radius: 20),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),border: Border.all(color: Colors.black)),
                      width: 200,
                      height: 50,
                      child: Center(
                        child: DropdownButton(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          elevation: 9,
                          underline: Container(height: 0,width: 0,),
                          value: dropdownvalue,
                          icon: Icon(Icons.keyboard_arrow_down),
                          items: items.map((String items){
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),);
                          }).toList(),
                          onChanged: (String? newValue){
                            setState((){
                              dropdownvalue=newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    text_field(width: 150, height: 50, type: TextInputType.text, label_text: 'Block/Building Name', radius: 20),

                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    text_field(width: 170, height: 50, type: TextInputType.number, label_text: 'Floor Number', radius: 20),
                    SizedBox(
                      width: 20,
                    ),
                    text_field(width: 170, height: 50, type: TextInputType.number, label_text: 'Room Number', radius: 20)
                  ],
                ),
                SizedBox(height: 20,),
                text_field(width: 370, height: 50, type: TextInputType.phone, label_text: 'Mobile Number', radius: 20),
                SizedBox(height: 20,),
                text_field(width: 370, height: 50, type: TextInputType.datetime, label_text: 'Preffered Date', radius: 20),
                SizedBox(height: 20,),
                text_field(width: 370, height: 50, type: TextInputType.datetime, label_text: 'Preffered Timing', radius: 20),
                SizedBox(height: 20,),
                text_field(width: 370, height: 60, type: TextInputType.text, label_text: 'Remarks', radius: 20),
                SizedBox(height: 20,),
                SizedBox(
                  width: 150,
                  height: 60,
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)),color: Colors.orangeAccent),
                    child: TextButton(
                      child: Text('Submit',style: TextStyle(fontSize: 20,color: Colors.black),),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
      )
    );
  }
}

