import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView( 
      padding: EdgeInsets.only(top: 28.0),
      child: Column(
        children: <Widget>[
          Container(
           margin: EdgeInsets.only(right: 10),
              child: ClipOval(
               child: Image.asset(
                    'images/av.png',
                    fit: BoxFit.contain,
                  matchTextDirection: true,
                 height: 120,
              )
             )
         ),
          ListTile(
            leading: const Icon(Icons.person, /*color: Colors.white,*/),
            title: const Text("Mr. hululu", /*style: TextStyle(color: Colors.white),*/),
            //subtitle: const Text("hauda", style: TextStyle(color: Colors.white),)          
          ),
          ListTile(
            leading: const Icon(Icons.email,),
            title: const Text("hululu@hululu.com",),
            //subtitle: const Text("hauda", style: TextStyle(color: Colors.white),)          
          ),
          ListTile(
            leading: const Icon(Icons.phone, ),
            title: const Text("9876543210", ),
            //subtitle: const Text("hauda", style: TextStyle(color: Colors.white),)          
          ),
          ListTile(
            leading: const Icon(Icons.location_on,),
            title: const Text("Kathmadu Nepal",),
            subtitle: const Text("Baneshwor",)          
          ),
        ],
      ),
        ),
      ),
    );
  }
}