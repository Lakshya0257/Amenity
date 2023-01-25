import 'package:amenityfinal/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';


class administrative extends StatefulWidget {
  const administrative({Key? key}) : super(key: key);

  @override
  State<administrative> createState() => _administrativeState();
}

class _administrativeState extends State<administrative> {
  late String username;
  late String password ;
  bool showspinner=false;
  final _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ModalProgressHUD(
        inAsyncCall: showspinner,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: double.maxFinite,
                  height: 70,
                  child: Center(child: Text('Welcome Back!',style: TextStyle(fontSize: 40,fontFamily: 'style',fontWeight: FontWeight.w500,letterSpacing: 2,color: Colors.white),))),
              SizedBox(
                  width: double.maxFinite,
                  height: 70,
                  child: Center(child: Text('Please sign in to your account',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300,letterSpacing: .9,color: Colors.grey),))),
              SizedBox(height: 70,),
              Container(
                width: 340,
                height: 60,
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.white24),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: TextFormField(
                    onChanged: (value){
                      username=value;
                    },
                    decoration: InputDecoration(
                        labelText: 'Enter your username',
                        labelStyle: TextStyle(color: Colors.grey,letterSpacing: .9)
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 340,
                height: 60,
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.white24),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: TextFormField(
                    onChanged: (value){
                      password=value;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'Enter your Password',
                        labelStyle: TextStyle(color: Colors.grey,letterSpacing: .9)
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                height: 60,
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.blueAccent[700]),
                child: TextButton(
                    onPressed: ()async{
                      setState((){
                        showspinner=true;
                      });
                      try{
                        final _user=await _auth.signInWithEmailAndPassword(email: username+'@administrative.com', password: password);
                        if(_user!=null){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>adminis()));
                        }
                      }
                      catch(e){
                        print(e);
                        showAlertDialog(context);
                      }
                      setState((){
                        showspinner=false;
                      });
                    },
                    child: Center(child: Text('Sign In',style: TextStyle(color: Colors.white,fontSize: 20),))),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}







class adminis extends StatefulWidget {
  const adminis({Key? key}) : super(key: key);

  @override
  State<adminis> createState() => _adminisState();
}

class _adminisState extends State<adminis> {
  String dropdownvalue='Select which service you provide';
  final items = ['Select which service you provide','General( Air Conditioner, Cleaning, Wifi )','Transportation','Medical'];
  late int phone;
  String username='';
  late String password;
  bool showspinner=false;
   String a='';
  late String name;

  final _auth=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (dropdownvalue == 'General( Air Conditioner, Cleaning, Wifi )'){
      a=username+'_general';
      name=a;
    }
    else if (dropdownvalue == 'Transportation'){
      a=username+'_transport';
      name=a;
    }
    else if(dropdownvalue=='Medical'){
      a=username+'_medical';
      name=a;
    }
    else{
      username=' ';
      name=a;
    }
    return Scaffold(
      backgroundColor: Colors.black,
      body: ModalProgressHUD(
        inAsyncCall: showspinner,
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                      width: double.maxFinite,
                      height: 70,
                      child: Center(child: Text('Create a new servitor',style: TextStyle(fontSize: 40,fontFamily: 'style',fontWeight: FontWeight.w500,letterSpacing: 2,color: Colors.white),))),
                  SizedBox(
                      width: double.maxFinite,
                      height: 70,
                      child: Center(child: Text('Please fill in the form to continue',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300,letterSpacing: .9,color: Colors.grey),))),
                  SizedBox(height: 70,),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 340,
                    height: 60,
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.white24),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: TextFormField(
                        onChanged: (value){
                          username=value;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'Create new Servitor username',
                            labelStyle: TextStyle(color: Colors.grey,letterSpacing: .9)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 340,
                    height: 60,
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.white24),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                      child:  DropdownButton(
                        dropdownColor: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        elevation: 9,
                        underline: SizedBox(height: 0,width: 0,),
                        value: dropdownvalue,
                        icon: Icon(Icons.keyboard_arrow_down),
                        items: items.map((String items){
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items,style: TextStyle(color: Colors.grey),),);
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
                    height: 10,
                  ),
                  Container(
                    width: 340,
                    height: 60,
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.white24),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: TextFormField(
                        onChanged: (value){
                          password=value;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.grey,letterSpacing: .9)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: 300,
                    height: 60,
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.blueAccent[700]),
                    child: TextButton(
                        onPressed: ()async{
                          if(dropdownvalue=='Select which service you provide'){
                            showAlertDialog(context);
                            name=username;
                          }
                          else{
                            setState((){
                              showspinner=true;
                            });
                            try{
                              final newuser=await _auth.createUserWithEmailAndPassword(email: name+'@servitor.com', password: password);
                              if(newuser!=null){
                                print('Created successfully');
                                SnackBar(
                                  backgroundColor: Colors.white,
                                    content: Text('Account Created Successfully')
                                );
                              }
                            }
                            catch(e){
                              print(e);
                              showAlertDialog(context);
                              name=username;
                            }
                            setState((){
                              showspinner=false;
                            });
                          }

                        },
                        child: Center(child: Text('Create Account',style: TextStyle(color: Colors.white,fontSize: 20),))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



final snack=SnackBar(
    content: Text('Account Created Successfully')
);
