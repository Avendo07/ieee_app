import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class App_Bar extends StatefulWidget{
  BuildContext con;
  App_Bar(BuildContext con);


  @override
  State<StatefulWidget> createState() {
    return App_BarState();
  }
}

class App_BarState extends State {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
<<<<<<< HEAD
          
=======
>>>>>>> 599f3d14a46d33acec12407dff801ff2a307f790
          child: IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        )
      ],
<<<<<<< HEAD
      title: Text("BVPIEEEE"),
=======
      title: Text("BVPIEEE"),
>>>>>>> 599f3d14a46d33acec12407dff801ff2a307f790
      backgroundColor: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      bottom: TabBar(
        indicatorPadding: EdgeInsets.only(left: 15.0, right: 15.0),
        tabs: <Widget>[
          Tab(
            text: "Home",
            icon: Icon(Icons.home),
          ),
          Tab(
            text: "Upcoming",
            icon: Icon(Icons.event),
          ),
          Tab(
            text: "Chapters",
            icon: Icon(Icons.collections_bookmark),
          ),
        ],
      ),
    );
  }
}