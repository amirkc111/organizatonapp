import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart'; 
import 'register.dart';
import 'home.dart';

final routes = <String, WidgetBuilder>{
  "home": (context) => Home(),
  "register": (context) => Register(),
};

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false,home: MyApp(),));

class  MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      routes: routes,
      home: new Login()
      );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  TextEditingController controllerEmail =
      new TextEditingController();
  TextEditingController controllerPassword =
      new TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text("MRR"), ),
      body: Container(
        child: SingleChildScrollView(         
         child: Column(
          children: <Widget>[
           Image.asset("images/1.jpg",width:330,height:300),
           TextField(
             controller: controllerEmail,
             decoration: InputDecoration(
               contentPadding: EdgeInsets.all(12.0),
               labelText: "Enter Your email",
               hintText: "hello@hello.com",
               icon: Icon(Icons.email)
             ),
           ) ,
           TextField(
             controller: controllerPassword,
             decoration: InputDecoration(
               contentPadding: EdgeInsets.all(12.0),
               labelText: "Enter Your Password",
               hintText: "", 
               icon: Icon(Icons.vpn_key),
             ),
             //keyboardType: TextInputType.number,
             obscureText: true,
           ) ,
           SizedBox(height: 5.0),
           Container(
             alignment: Alignment(1.0,0.0),
             padding: EdgeInsets.only(top:15.0,left:20.0),
             child: Text("Forget Password !!",
             style: TextStyle(
               color: Colors.black87,
               decoration: TextDecoration.underline
             ),
             ),
           ),
           SizedBox(height: 15.0),
                    Container(
                      height: 50.0,
                      color: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 1.0),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20.0)),
                         child: InkWell(
                        //   onTap: () {
                        //     Navigator.of(context).pushNamed("home");
                        //   },
                        onTap: (){
              String email = controllerEmail.text;
              String password = controllerPassword.text;
              print(email + " " + password);
              if(email.isEmpty){
                showToast("Please enter valid email");
              }else if(password.isEmpty){
                showToast("Please enter password");
              }
              else if(password.length < 6){
                showToast("Password must be more than 6 character");
              }else{
                showToast("Logged in");
                Navigator.of(context).pushNamed("home");
              }
                        },
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                //fontFamily: 'Montserrat')
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
          SizedBox(height: 10.0),
           Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Not a member ?',
                    ),
                    SizedBox(width: 5.0),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pushNamed("register");
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.black87,
                            //fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                )
          ]
        ),
        )
        )
      );
  }     
      showToast(String s){
    Fluttertoast.showToast(
        msg: s,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 3,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0
    ); 
  }
}