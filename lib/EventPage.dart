import 'package:bvp_ieee/Head_AppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bvp_ieee/Drawer.dart';
import 'package:bvp_ieee/Class_Event.dart';
import 'package:url_launcher/url_launcher.dart';

OurEvent _event;

class EventPage extends StatefulWidget {
  EventPage({Key key, OurEvent event}) : super(key: key) {
    _event = event;
  }
  @override
  State<StatefulWidget> createState() {
    return EventPageState();
  }
}

class EventPageState extends State {
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
        child: new Head_AppBar("Events"),
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
                          image: NetworkImage(_event.photoslink),
                          fit: BoxFit.fill,
                          width: 190,
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
                "Event Details",
                textScaleFactor: 2,
              ),
            ),
            new Card(
              child: _padding(
                new Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Text(
                      "Event No.: ${_event.eventNumber}",
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
                      "Date: ${_event.date}",
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
                      "Venue: ${_event.venue}",
                      textScaleFactor: 1.2,
                    ),
                  ],
                ),
              ),
            ),
            new Container(
              margin: EdgeInsets.fromLTRB(10, 15, 0, 15),
              child: new Text(
                "Points to Note",
                textScaleFactor: 2,
              ),
            ),
            new Container(
              margin: EdgeInsets.fromLTRB(10, 15, 0, 15),
              child: new Text(
                "${_event.details}",
              ),
            ),
            Center(
              child: RaisedButton(
                splashColor: Colors.black,
                onPressed: () async {
                  const url = 'https://flutter.dev';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: Text("Click to Register "),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  side: BorderSide(style: BorderStyle.solid,color: Colors.white),

                ),
              ),
            )
          ],
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }
}
