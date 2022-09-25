import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:amenityfinal/Complainant/login_and_signup/complainant_login.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';



















class generalservitor extends StatefulWidget {
  const generalservitor({Key? key}) : super(key: key);

  @override
  State<generalservitor> createState() => _generalservitorState();
}

class _generalservitorState extends State<generalservitor> {
  var _selectedTab = _SelectedTab.home;
  int x= 0;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
      x=i;
    });
  }


  var y= [home(),air(),clean(),wifi(),profile()];
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
            icon: Icon(Icons.air),
          ),
          DotNavigationBarItem(
            icon: Icon(Icons.cleaning_services_rounded),
          ),

          DotNavigationBarItem(
            icon: Icon(Icons.wifi_2_bar),
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
                    SizedBox(width: 20,),
                    IconButton(
                      onPressed: (){
                        ZoomDrawer.of(context)!.toggle();
                      },
                        icon: Icon(Icons.menu_rounded,color: Colors.white,)),
                  ],
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 22,
                      child: Image(image: NetworkImage('https://media.istockphoto.com/vectors/avatar-line-icon-on-black-background-black-flat-style-vector-vector-id1161086158?k=20&m=1161086158&s=170667a&w=0&h=1e9HO7d7nWl89qoOZoCKMFPeKZODqMQ7qjuXIAu9_vw='),),
                    ),
                    SizedBox(width: 20,)
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
enum _SelectedTab { home,air, clean, wifi,profile}




class air extends StatefulWidget {
  const air({Key? key}) : super(key: key);

  @override
  State<air> createState() => _airState();
}

class _airState extends State<air> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Air Conditioner',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w500,letterSpacing: 2),),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 300,
              height: 10,
              child: Divider(
                color: Colors.grey,
                thickness: 2,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                SizedBox(
                width: double.maxFinite,
                height: 130,
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.white70,
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
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage('https://image.shutterstock.com/image-vector/contact-circle-neon-style-icon-260nw-1607646820.jpg'),
                              ),
                              SizedBox(width: 9,),
                              Text('user_1709',style: TextStyle(color: Colors.black,fontSize: 15),),
                            ],
                          ),
                          SizedBox(height: 9,),
                          Text('Due Date: 14/09',style: TextStyle(color: Colors.black,fontSize: 15),),
                          Text('Due Timing: 10:00',style: TextStyle(color: Colors.black,fontSize: 15),),

                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Remarks: ',style: TextStyle(color: Colors.black,fontSize: 15),),
                          Container(
                            width: 90,
                            height: 40,
                            decoration: BoxDecoration(color: Colors.blueAccent,borderRadius: BorderRadius.all(Radius.circular(10))),
                            child: TextButton(onPressed: (){},
                                child: Text('Solve',style: TextStyle(color: Colors.white,fontSize: 20),)
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
                  height: 130,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Colors.white70,
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
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage('https://us.123rf.com/450wm/alexvolot/alexvolot1912/alexvolot191200028/135452098-portrait-of-an-anonymous-man-in-a-black-hoodie-hiding-his-face-behind-a-scary-neon-mask-studio-shot-.jpg?ver=6'),
                                ),
                                SizedBox(width: 9,),
                                Text('user_1899',style: TextStyle(color: Colors.black,fontSize: 15),),
                              ],
                            ),
                            SizedBox(height: 9,),
                            Text('Due Date: 12/09',style: TextStyle(color: Colors.black,fontSize: 15),),
                            Text('Due Timing: 9:00',style: TextStyle(color: Colors.black,fontSize: 15),),

                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Remarks: ',style: TextStyle(color: Colors.black,fontSize: 15),),
                            Container(
                              width: 90,
                              height: 40,
                              decoration: BoxDecoration(color: Colors.blueAccent,borderRadius: BorderRadius.all(Radius.circular(10))),
                              child: TextButton(onPressed: (){},
                                  child: Text('Solve',style: TextStyle(color: Colors.white,fontSize: 20),)
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
        ));
  }
}







class clean extends StatefulWidget {
  const clean({Key? key}) : super(key: key);

  @override
  State<clean> createState() => _cleanState();
}

class _cleanState extends State<clean> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Cleaning',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w500,letterSpacing: 2),),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 300,
              height: 10,
              child: Divider(
                color: Colors.grey,
                thickness: 2,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                SizedBox(
                  width: double.maxFinite,
                  height: 130,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Colors.white70,
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
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage('https://image.shutterstock.com/image-vector/contact-circle-neon-style-icon-260nw-1607646820.jpg'),
                                ),
                                SizedBox(width: 9,),
                                Text('user_1709',style: TextStyle(color: Colors.black,fontSize: 15),),
                              ],
                            ),
                            SizedBox(height: 9,),
                            Text('Due Date: 14/09',style: TextStyle(color: Colors.black,fontSize: 15),),
                            Text('Due Timing: 10:00',style: TextStyle(color: Colors.black,fontSize: 15),),

                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Remarks: ',style: TextStyle(color: Colors.black,fontSize: 15),),
                            Container(
                              width: 90,
                              height: 40,
                              decoration: BoxDecoration(color: Colors.blueAccent,borderRadius: BorderRadius.all(Radius.circular(10))),
                              child: TextButton(onPressed: (){},
                                  child: Text('Solve',style: TextStyle(color: Colors.white,fontSize: 20),)
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
        ));
  }
}




class wifi extends StatefulWidget {
  const wifi({Key? key}) : super(key: key);

  @override
  State<wifi> createState() => _wifiState();
}

class _wifiState extends State<wifi> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Wifi',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w500,letterSpacing: 2),),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 300,
              height: 10,
              child: Divider(
                color: Colors.grey,
                thickness: 2,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                SizedBox(
                  width: double.maxFinite,
                  height: 130,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Colors.white70,
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
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage('https://image.shutterstock.com/image-vector/contact-circle-neon-style-icon-260nw-1607646820.jpg'),
                                ),
                                SizedBox(width: 9,),
                                Text('user_1709',style: TextStyle(color: Colors.black,fontSize: 15),),
                              ],
                            ),
                            SizedBox(height: 9,),
                            Text('Due Date: 14/09',style: TextStyle(color: Colors.black,fontSize: 15),),
                            Text('Due Timing: 10:00',style: TextStyle(color: Colors.black,fontSize: 15),),

                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Remarks: ',style: TextStyle(color: Colors.black,fontSize: 15),),
                            Container(
                              width: 90,
                              height: 40,
                              decoration: BoxDecoration(color: Colors.blueAccent,borderRadius: BorderRadius.all(Radius.circular(10))),
                              child: TextButton(onPressed: (){},
                                  child: Text('Solve',style: TextStyle(color: Colors.white,fontSize: 20),)
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
                  height: 130,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Colors.white70,
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
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage('https://us.123rf.com/450wm/alexvolot/alexvolot1912/alexvolot191200028/135452098-portrait-of-an-anonymous-man-in-a-black-hoodie-hiding-his-face-behind-a-scary-neon-mask-studio-shot-.jpg?ver=6'),
                                ),
                                SizedBox(width: 9,),
                                Text('user_1899',style: TextStyle(color: Colors.black,fontSize: 15),),
                              ],
                            ),
                            SizedBox(height: 9,),
                            Text('Due Date: 12/09',style: TextStyle(color: Colors.black,fontSize: 15),),
                            Text('Due Timing: 9:00',style: TextStyle(color: Colors.black,fontSize: 15),),

                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Remarks: ',style: TextStyle(color: Colors.black,fontSize: 15),),
                            Container(
                              width: 90,
                              height: 40,
                              decoration: BoxDecoration(color: Colors.blueAccent,borderRadius: BorderRadius.all(Radius.circular(10))),
                              child: TextButton(onPressed: (){},
                                  child: Text('Solve',style: TextStyle(color: Colors.white,fontSize: 20),)
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
        ));
  }
}






class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Welcome!',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w500,letterSpacing: 2),),
            Image(image: NetworkImage('https://www.bizzmine.com/images/rsca/500x350/images/articles/intro-images/Complaints_Management_with_BizzMine.png')),
            Container(
              width: 300,
              height: 20,
              child: Divider(
                color: Colors.grey,
                thickness: 2,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text('Recent Complaints',style: TextStyle(color: Colors.white,fontSize: 30),),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 20),
                  Container(
                    width: 350,
                    height: double.infinity,
                    decoration: BoxDecoration(color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        border: Border.all(color: Colors.blueAccent,width: 4),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage('https://www.crushpixel.com/big-static18/preview4/avatar-profile-pink-neon-icon-2920285.jpg'),
                            ),
                            SizedBox(height: 9,),
                            Text('user_1693',style: TextStyle(color: Colors.black,fontSize: 15),),
                            SizedBox(height: 9,),
                            Text('Due Date: 16/09',style: TextStyle(color: Colors.black,fontSize: 15),),
                            Text('Due Timing: 16:00',style: TextStyle(color: Colors.black,fontSize: 15),),

                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Type: Air Conditioner',style: TextStyle(fontSize: 15,color: Colors.blueAccent,fontWeight: FontWeight.bold),),
                            Text('Remarks: ',style: TextStyle(color: Colors.black,fontSize: 15),),
                            ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    width: 350,
                    height: double.infinity,
                    decoration: BoxDecoration(color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      border: Border.all(color: Colors.blueAccent,width: 4),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage('https://image.shutterstock.com/image-vector/contact-circle-neon-style-icon-260nw-1607646820.jpg'),
                            ),
                            SizedBox(height: 9,),
                            Text('user_1709',style: TextStyle(color: Colors.black,fontSize: 15),),
                            SizedBox(height: 9,),
                            Text('Due Date: 14/09',style: TextStyle(color: Colors.black,fontSize: 15),),
                            Text('Due Timing: 10:00',style: TextStyle(color: Colors.black,fontSize: 15),),

                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Type: Cleaning',style: TextStyle(fontSize: 15,color: Colors.blueAccent,fontWeight: FontWeight.bold),),
                            Text('Remarks: ',style: TextStyle(color: Colors.black,fontSize: 15),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                ],
              ),
            )

          ],
        ));
  }
}






class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


