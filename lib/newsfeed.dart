import 'package:flutter/material.dart';

class NewsFeed extends StatefulWidget {
  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      child: SingleChildScrollView( 
      child: Column(
              children: <Widget>[
                Container(
                      margin: EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                child: ClipOval(
                                    child: Image.asset(
                                      'images/av.png',
                                      fit: BoxFit.contain,
                                      matchTextDirection: true,
                                      height: 30,
                                  )
                                  )
                              ),
                              Text("Hululu",)
                            ],
                          ),
                          IconButton(
                            icon: Icon(Icons.more_horiz),
                            onPressed: () {

                            },
                          )
                        ],
                      ),
                    ),
          Container(
            constraints: BoxConstraints.expand(height: 1),
            color: Colors.grey,
          ),
          Container(
            constraints: BoxConstraints(
              maxHeight: 282
            ),
            decoration: BoxDecoration(
              image: new DecorationImage(
              image: new AssetImage("images/photo.jpeg"),
              fit: BoxFit.fill,
          )
          )
            ),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Stack(
                    alignment: Alignment(0, 0),
                    children: <Widget>[
                      Icon(Icons.thumb_up, size: 30),
                      IconButton(icon: Icon(Icons.thumb_up),color: Colors.white,
                      onPressed: () {
                  
                      },)
                    ],
                  ),
                  Stack(
                    alignment: Alignment(0, 0),
                    children: <Widget>[
                      Icon(Icons.comment, size: 30, color: Colors.black,),
                      IconButton(icon: Icon(Icons.comment), color: Colors.white,
                      onPressed: () {
                        
                      },)
                    ],
                  ),
                  Stack(
                    alignment: Alignment(0, 0),
                    children: <Widget>[
                      Icon(Icons.share, size: 30, color: Colors.black,),
                      IconButton(icon: Icon(Icons.share), color: Colors.white,
                      onPressed: () {
                        
                      },)
                    ],
                  )
                ],
              ),
              Stack(
                    alignment: Alignment(0, 0),
                    children: <Widget>[
                      Icon(Icons.bookmark, size: 30, ),
                      IconButton(icon: Icon(Icons.bookmark),color: Colors.white,   tooltip: 'Save Post',
                      onPressed: () {
                        
                      },)
                    ],
                  )
            ],
          ),
            ],
            )
      )
      )
    );
  }
}