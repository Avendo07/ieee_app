import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bvp_ieee/Class_Workshop.dart';
import 'package:bvp_ieee/WorkshopPage.dart';

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
          child: IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {Navigator.push(context, MaterialPageRoute(
              builder: (context) => 
              WorkshopPage(
                workshop: Workshop(
                  '101','images/bvp1.jpg',
                   'BVPIEEE: the student branch of IEEE at Bharati Vidyapeeths College of Engineering',
                   '24/02/2020','Library','details will be displayed here',null,null,
                <Mentor>[Mentor('Adit','images/wall.jpg'),Mentor('Aditi','images/women.jpg')]
                ),
              )
              ));},
          ),
        )
      ],
      title: Text("BVPIEEE"),
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
