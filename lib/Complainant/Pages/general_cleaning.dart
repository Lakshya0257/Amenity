import 'package:flutter/material.dart';


int indi = 0;
List<String> room_list = [];
List<String> date_list = [];
List<String> time_list = [];
List<String> cleaning_type_list = [];

TextEditingController room_controller = new TextEditingController();
TextEditingController date_controller = new TextEditingController();
TextEditingController time_controller = new TextEditingController();
TextEditingController cleaning_type_controller = new TextEditingController();




class complaint_cleaning extends StatefulWidget {
  const complaint_cleaning({Key? key}) : super(key: key);

  @override
  State<complaint_cleaning> createState() => _complaint_cleaningState();
}

class _complaint_cleaningState extends State<complaint_cleaning> {


  @override
  Widget build(BuildContext context) {
    final mobile_width=MediaQuery.of(context).size.width;
    final mobile_height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: mobile_width,
        height: mobile_height,
        decoration: BoxDecoration(image: DecorationImage(image: NetworkImage('https://static.vecteezy.com/system/resources/previews/000/095/572/non_2x/vector-dark-wallpaper-design.jpg'),fit: BoxFit.cover)),
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
                        SizedBox(width: 5,),
                        IconButton(icon: Icon(Icons.arrow_back_sharp,color: Colors.white,),onPressed: (){Navigator.of(context).pop();}),
                      ],
                    ),
                    Text('Cleaning',style: TextStyle(fontSize: 27,color: Colors.white),),
                    Row(
                      children: [
                        CircleAvatar(backgroundImage: NetworkImage('https://st2.depositphotos.com/50337402/47092/v/380/depositphotos_470923054-stock-illustration-adult-man-avatar-short-curly.jpg?forcejpeg=true'),),
                        SizedBox(width: 20,),
                      ],
                    ),
                  ],
                ),
              ),),
              Expanded(flex: 6,child: Container(
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
              Expanded(flex: 10,child: Container(
                margin: EdgeInsets.all(0),
                decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),color: Colors.white),
                child: Column(
                  children: [
                    SizedBox(height: 15,),
                    Text('Complaint Booking',style: TextStyle(color: Colors.black,fontSize: 25),),
                    SizedBox(height: 15,),
                    Container(
                      height: 90,
                      width: 340,
                      decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: TextButton(
                        onPressed: (){

                          Navigator.of(context).pushNamed('clean');
                        },

                        child: Center(
                            child: Text('+ Add New', style: TextStyle(fontSize: 24, color: Colors.black,letterSpacing: 1.8, fontWeight: FontWeight.w500),)),
                      ),
                    ),
                    SizedBox(height: 25,),
                    Container(
                      width: double.maxFinite,
                      height: 269,
                      margin: EdgeInsets.all(0),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: indi,
                          itemBuilder: (context,index){
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                width: 300,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                  color: Colors.white,border: Border.all(color: Colors.black,width: 4),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage('https://www.crushpixel.com/big-static18/preview4/avatar-profile-pink-neon-icon-2920285.jpg'),
                                    ),
                                    SizedBox(height: 9,),
                                    Text('user_1693',style: TextStyle(color: Colors.black,fontSize: 15),),
                                    SizedBox(height: 9,),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text('Room No.: ',
                                                style: TextStyle(color: Colors.blueAccent,fontSize: 15,fontWeight: FontWeight.bold),),
                                              Text(room_list[index],style: TextStyle(color: Colors.blueAccent,fontSize: 15),)

                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text('Preferred Date: ',
                                                style: TextStyle(color: Colors.blueAccent,fontSize: 15,fontWeight: FontWeight.bold),),
                                              Text(date_list[index],style: TextStyle(color: Colors.blueAccent,fontSize: 15),)
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text('Preffered Timing: ',
                                                style: TextStyle(color: Colors.blueAccent,fontSize: 15,fontWeight: FontWeight.bold),),
                                              Text(time_list[index],style: TextStyle(color: Colors.blueAccent,fontSize: 15),)
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text('Cleaning Type: ',
                                                style: TextStyle(color: Colors.blueAccent,fontSize: 15,fontWeight: FontWeight.bold),),
                                              Text(cleaning_type_list[index],style: TextStyle(color: Colors.blueAccent,fontSize: 15),),
                                            ],
                                          ),
                                          SizedBox(width: 1,),


                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
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



class Newcomplaint_cleaning extends StatefulWidget {
  const Newcomplaint_cleaning({Key? key}) : super(key: key);

  @override
  State<Newcomplaint_cleaning> createState() => _Newcomplaint_cleaningState();
}

class _Newcomplaint_cleaningState extends State<Newcomplaint_cleaning> {
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
                  SizedBox(width: 370,
                    height: 50,
                    child: TextFormField(
                      decoration:InputDecoration(
                          labelText: 'Username',
                          alignLabelWithHint: true,
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
                      ) ,),
                  ),
                  SizedBox(height: 20,),
                  SizedBox(width: 370,
                    height: 50,
                    child: TextFormField(
                      decoration:InputDecoration(
                          labelText: 'Email/Mobile Number',
                          alignLabelWithHint: true,
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
                      ) ,),
                  ),
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
                      SizedBox(width:150,
                        height: 50,
                        child: TextFormField(
                          decoration:InputDecoration(
                              labelText: 'Block/Building Name',
                              alignLabelWithHint: true,
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
                          ) ,),
                      ),              ],
                  ),
                  SizedBox(height: 20,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width:170,
                        height: 50,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration:InputDecoration(
                              labelText: 'Floor Number',
                              alignLabelWithHint: true,
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
                          ) ,),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      SizedBox(width:170,
                        height: 50,
                        child: TextFormField(
                          controller: room_controller,
                          keyboardType: TextInputType.number,
                          decoration:InputDecoration(
                              labelText: 'Room Number',
                              alignLabelWithHint: true,
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
                          ) ,),
                      ),              ],
                  ),
                  SizedBox(height: 20,),
                  SizedBox(width: 370,
                    height: 50,
                    child: TextFormField(
                      controller: cleaning_type_controller,
                      keyboardType: TextInputType.text,
                      decoration:InputDecoration(
                          labelText: 'Cleaning Type(Sweeping, Mopping, Fan Cleaning , Dusting)',
                          alignLabelWithHint: true,
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
                      ) ,),
                  ),
                  SizedBox(height: 20,),
                  SizedBox(width: 370,
                    height: 50,
                    child: TextFormField(
                      controller: date_controller,
                      keyboardType: TextInputType.datetime,
                      decoration:InputDecoration(
                          labelText: 'Preferred Date',
                          alignLabelWithHint: true,
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
                      ) ,),
                  ),
                  SizedBox(height: 20,),
                  SizedBox(width: 370,
                    height: 50,
                    child: TextFormField(
                      controller: time_controller,
                      keyboardType: TextInputType.datetime,
                      decoration:InputDecoration(
                          labelText: 'Preferred Timing',
                          alignLabelWithHint: true,
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
                      ) ,),
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    width: 150,
                    height: 60,
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)),color: Colors.orangeAccent),
                      child: TextButton(
                        child: Text('Submit',style: TextStyle(fontSize: 20,color: Colors.black),),
                        onPressed: (){
                          Navigator.of(context).pop();
                          room_list.add(room_controller.text);
                          time_list.add(time_controller.text);
                          date_list.add(date_controller.text);
                          cleaning_type_list.add(cleaning_type_controller.text);
                          indi++;
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
