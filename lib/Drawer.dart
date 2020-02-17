import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
BuildContext con;
class DRAWER extends StatefulWidget{

  DRAWER(BuildContext context){
    con = context;
  }

  @override
  State<StatefulWidget> createState() {
    return DRAWERState();
  }
}

class DRAWERState extends State {
  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Image.asset('images/wall.jpg'),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 90, left: 3),
                      child: Icon(
                        Icons.account_circle,
                        size: 60,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 100, left: 10),
                      child: Text(
                        "johnexample@gmail.com",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 10.0),
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).selectedRowColor,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0))),
                  child: ListTile(
                    leading: Icon(Icons.home, color: Colors.black),
                    title: Text("Home"),
                    onTap: (){print("Hello");}
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.message, color: Colors.black),
                  title: Text("Discussion Forum"),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.highlight, color: Colors.black),
                  title: Text("Highlights"),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.image, color: Colors.black),
                  title: Text("Resources"),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12.0, left: 12.0),
            child: Text("CHAPTERS"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.directions_car, color: Colors.black),
                  title: Text("Robotic & Automation"),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.computer, color: Colors.black),
                  title: Text("Computer Society"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.hourglass_empty, color: Colors.black),
                  title: Text("Industry & Automation"),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.add_to_queue, color: Colors.black),
                  title: Text("HKN Lambda ETA"),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.pregnant_woman, color: Colors.black),
                  title: Text("Women In Engineering"),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12.0, left: 12.0),
            child: Text("ACCOUNT"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.account_circle, color: Colors.black),
                  title: Text("My Account"),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.exit_to_app, color: Colors.black),
                  title: Text("Log Out"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}