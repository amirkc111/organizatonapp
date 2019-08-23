import 'package:app/message.dart';
import 'package:app/newsfeed.dart';
import 'package:app/notification.dart';
import 'package:app/profile.dart';
import 'package:app/uploadnews.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'main.dart';
import 'about.dart';

final routes = <String, WidgetBuilder>{
  "login": (context) => Login(),
  "about": (context) => About(),
};

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false,home: MyApp(),));

class  MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      routes: routes,
      home: new Home()
      );
  }
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageIndex = 0;

  final Profile _profile = Profile();
  final NewsFeed _news =new NewsFeed();
  final Message _message =new Message();
  final Notifiy _notification = new Notifiy();
  final UploadNews _uploadNews = new UploadNews();

  Widget _showPage = new NewsFeed();

  Widget _pageChooser(int page){
    switch(page){
      case 0:
      return _news;
      break;
      case 1:
      return _message;
      break;
      case 2:
      return _uploadNews;
      break;
      case 3:
      return _notification;
      break;
      case 4:
      return _profile;
      break;
    }
  }

  GlobalKey _bottomNavigationKey = GlobalKey();
    var title = '';
    Widget appBarTitle = new Text("Welcome");
  Icon actionIcon = new Icon(Icons.search);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomPadding: false ,
      appBar: new AppBar(
        centerTitle: true,
        title:appBarTitle,
        actions: <Widget>[
          new IconButton(icon: actionIcon,onPressed:(){
          setState(() {
                     if ( this.actionIcon.icon == Icons.search){
                      this.actionIcon = new Icon(Icons.close);
                      this.appBarTitle = new TextField(
                        style: new TextStyle(
                          color: Colors.white,
                        ),
                        decoration: new InputDecoration(
                          prefixIcon: new Icon(Icons.search,color: Colors.white),
                          hintText: "Search...",
                          hintStyle: new TextStyle(color: Colors.white)
                        ),
                      );
                      }
                      else {
                        this.actionIcon = new Icon(Icons.search);
                        this.appBarTitle = new Text("Welcome");
                      }
                    }
                    );
        } ,
        ),
        ]
      ),
      bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          initialIndex: pageIndex,
          items: <Widget>[
            Icon(Icons.web_asset, size: 30),
            Icon(Icons.message, size: 30),
            Icon(Icons.add, size: 30),
            Icon(Icons.notifications, size: 30),
            Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.grey,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (int tappedIndex) {
            setState(() {
              _showPage = _pageChooser(tappedIndex);
            });
          },
        ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: _showPage,
        ),
         // child: Center(
           
        
         ),
        
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountEmail: new Text("hululu@hulu.com"),
              accountName: new Text("Mr. hululu"),
              currentAccountPicture: 
                Image.asset("images/avt.png"),
            ),
            new ListTile(
            leading: new Icon(Icons.home),
            title: new Text('Home'),
            onTap: () {
              setState((){
                this.title = 'This is Photos page';
              });
              Navigator.pop(context);
            },
          ),
            new ListTile(
            leading: new Icon(Icons.photo_album),
            title: new Text('Photos'),
            onTap: () {
              setState((){
                this.title = 'This is Photos page';
              });
              Navigator.pop(context);
            },
          ),
          new ListTile(
            leading: new Icon(Icons.video_library),
            title: new Text('Videos'),
            onTap: () {
              setState((){
                this.title = 'This is video page';
              });
              Navigator.pop(context);
            },
          ),
          new ListTile(
            leading: new Icon(Icons.notifications),
            title: new Text('Notifications'),
            onTap: () {
              setState((){
                this.title = 'This is Notifications page';
              });
              Navigator.pop(context);
            },
          ),
          new ListTile(
            leading: new Icon(Icons.settings),
            title: new Text('Settings'),
            onTap: () {
              setState((){
                this.title = 'This is Settings page';
              });
              Navigator.pop(context);
            },
          ),
          new Divider(
            color: Colors.black45,
            indent: 16.0,
          ),
          new ListTile(            
            title: new Text('About us'),
            onTap: () {
              //Navigator.of(context).pushNamed("about");
              Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => new About()),
          );
            },
          ),
          new ListTile(
            title: new Text('Logout'),
            onTap: () {
             //Navigator.of(context).pushNamed("login");
             Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => new Login()),
          );
            },
          )
          ],
        ),
      ),
    );
    
  }
}


