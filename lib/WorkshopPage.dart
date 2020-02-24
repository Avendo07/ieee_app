import 'package:bvp_ieee/Head_AppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bvp_ieee/Drawer.dart';

import 'package:bvp_ieee/Class_Workshop.dart';

Workshop _workshop;
class WorkshopPage extends StatefulWidget {
  WorkshopPage({Key key,Workshop workshop}):super(key: key){
    _workshop=workshop;
    }
  @override
  State<StatefulWidget> createState() {
    return WorkshopPageState();
  }
}

class WorkshopPageState extends State {
  @override
  Widget build(BuildContext context) {
    return Page();
  }
}

class Page extends StatelessWidget {
  Padding _padding(Widget wid) {
    return new Padding(
      padding: EdgeInsets.all(5.0),
      child: wid,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: new Head_AppBar("Workshops"),
        preferredSize: Size.square(60),
      ),
      drawer: DRAWER(context),
      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new Container(
              constraints: BoxConstraints(minWidth: double.maxFinite),
              child: new Card(
                child: new Container(
                    margin: EdgeInsets.all(5),
                    constraints: BoxConstraints(
                        maxHeight: 275, maxWidth: double.maxFinite),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        //Chapter presents

                        Image(
                          image: AssetImage('${_workshop.photoslink}'),
                          fit: BoxFit.cover,
                        ),

                        new Stack(
                          alignment: AlignmentDirectional.center,
                          children: <Widget>[
                            new Container(
                              alignment: AlignmentDirectional.center,
                              margin: EdgeInsets.fromLTRB(2, 2, 2, 50),
                              child: new Card(
                                child: new Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
                                  child: new Text(
                                    "Presented\n By\n BVPIEEE RAS",
                                    textAlign: TextAlign.center,
                                    textScaleFactor: 1.5,
                                  ),
                                ),
                              ),
                            ),
                            new Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                new Card(
                                  margin: EdgeInsets.fromLTRB(5, 10, 5, 5),
                                  shape: CircleBorder(
                                      side: BorderSide(width: 0.5)),
                                  child: new CircleAvatar(
                                    backgroundImage:
                                        AssetImage('images/bvp.jpg'),
                                    maxRadius: 60,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ),
            new Container(
              margin: EdgeInsets.fromLTRB(10, 15, 0, 15),
              child: new Text(
                "Workshop Details",
                textScaleFactor: 2,
              ),
            ),
            new Card(
              child: _padding(
                new Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Text(
                      "Workshop No.: ${_workshop.eventNumber}",
                      textScaleFactor: 1.2,
                    ),
                  ],
                ),
              ),
            ),
            new Card(
              child: _padding(
                new Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Text(
                      "Date: ${_workshop.date}",
                      textScaleFactor: 1.2,
                    ),
                  ],
                ),
              ),
            ),
            new Card(
              child: _padding(
                new Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Text(
                      "Venue: ${_workshop.venue}",
                      textScaleFactor: 1.2,
                    ),
                  ],
                ),
              ),
            ),
            new Container(
              margin: EdgeInsets.fromLTRB(10, 15, 0, 15),
              child: new Text(
                "Mentors",
                textScaleFactor: 2,
              ),
            ),
            mentorsList(),
            new Container(
              margin: EdgeInsets.fromLTRB(10, 15, 0, 15),
              child: new Text(
                "Assignments",
                textScaleFactor: 2,
              ),
            ),
            new Container(
              margin: EdgeInsets.fromLTRB(10, 15, 0, 15),
              child: new Text(
                "Points to Note",
                textScaleFactor: 2,
              ),
            ),new Container(
              margin: EdgeInsets.fromLTRB(10, 15, 0, 15),
              child: new Text(
                "${_workshop.details}",
              ),
            ),
          ],
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }

  Widget mentorsList(){
      var holder=<Widget>[];
      List<Mentor> mentors=_workshop.mentors;
      for(int i=0;i<_workshop.mentors.length;i++)
        holder.add(new Stack(
                    children: <Widget>[
                      new Container(
                        margin: EdgeInsets.fromLTRB(2, 2, 30, 2),
                        child: new Card(
                          child: new Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 30, 0),
                            child: new Text(
                              "${mentors[i].name}",
                              textScaleFactor: 1.35,
                            ),
                          ),
                        ),
                      ),
                      new Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Card(
                            margin: EdgeInsets.fromLTRB(5, 10, 5, 5),
                            shape: CircleBorder(side: BorderSide(width: 0.5)),
                            child: new CircleAvatar(
                              backgroundImage: AssetImage('${mentors[i].photolink}'),
                              maxRadius: 30,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                          );
       return new Card(
              elevation: 5,
              child: new Column(
                children: holder
              ),
            );
    
  }
}

//musicbrains
