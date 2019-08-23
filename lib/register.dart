import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'main.dart';

final routes = <String, WidgetBuilder>{
  "login": (context) => Login(),
};
void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false,home: MyApp(),));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      home: new Register()
    );
  }
}

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  TextEditingController controllerEmail =
      new TextEditingController();
  TextEditingController controllerPassword =
      new TextEditingController();
        TextEditingController controllerNumber =
      new TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(10.0, 50.0, 0.0, 0.0),
                      child: Text(
                        'DO',
                        style: TextStyle(
                            fontSize: 50.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20.0, 100.0, 0.0, 0.0),
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                            fontSize: 60.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(100.0, 150.0, 0.0, 0.0),
                      child: Text(
                        'IN',
                        style: TextStyle(
                            fontSize: 48.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: controllerEmail,
                      decoration: InputDecoration(
                        labelText: 'EMAIL',
                        labelStyle: TextStyle(
                            //fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        icon: Icon(Icons.email),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      controller: controllerPassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                            //fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        icon: Icon(Icons.vpn_key),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)),
                      ),
                      obscureText: true,
                      ),
                      SizedBox(height: 10.0),
                    TextField(
                      controller: controllerNumber,
                      decoration: InputDecoration(
                        labelText: 'Number ',
                        labelStyle: TextStyle(
                            //fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        icon: Icon(Icons.phone),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)),
                      ),
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                    ),
                    SizedBox(height: 30.0),
                    Container(
                      height: 50.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.black87,
                        color: Colors.grey,
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: (){
              String email = controllerEmail.text;
              String password = controllerPassword.text;
              String number = controllerNumber.text;
              //print(email + " " + password);
              if(email.isEmpty){
                showToast("Please enter valid email");
                }else if(password.isEmpty){
                showToast("Please enter password");
              }else if(password.length < 6){
                showToast("Password must be more than 6 character");
              }else if(number.isEmpty){
                showToast("Please enter number");
              }else if(number.length < 10){
                showToast("Please enter valid number");
              }else if(number.length > 10){
                showToast("Please enter valid number");
              }
              else{
                showToast("Register");
                //Navigator.of(context).pushNamed("login");
             Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => new Login()),
          );
              }
              },
                          child: Center(
                            child: Text(
                              'SIGNUP',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                //fontFamily: 'Montserrat'
                              ),
                            ),
                          ),
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
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Center(
                            child: Text(
                              'Go Back',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                //fontFamily: 'Montserrat')
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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