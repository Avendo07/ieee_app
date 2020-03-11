import 'package:bvp_ieee/Class_Workshop.dart';
import 'package:bvp_ieee/Drawer.dart';
import 'package:bvp_ieee/Societydetail.dart';
import 'package:bvp_ieee/class_news.dart';
import 'package:bvp_ieee/newspage.dart';
import 'package:bvp_ieee/society_listview.dart';
import 'package:flutter/material.dart';
import './appBar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'Class_Event.dart';
import 'EventPage.dart';
import 'WorkshopPage.dart';
import 'class_news.dart';
import 'package:firebase_storage/firebase_storage.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  // Upcoming Events ////////////////////////////////////////////////////////////////////
  static List<OurEvent> events = [];
  ////////////////////////////////////////////////////////////////////////////////////////

  // For Workshops ///////////////////////////////////////////////////////////////////////
  static List<Workshop> workshops = [
    Workshop(
        101,
        'images/bvp.jpg',
        'BVPIEEE: the student branch of IEEE at Bharati Vidyapeeths College of Engineering',
        '24/02/2020',
        'Library',
        'bhhghg',
        null,
        null,
        null),
    Workshop(
        102,
        'images/bvp1.jpg',
        'The Robotics and Automation Society (BVPIEEE RAS) is a professional society that supports the development and the exchange of scientific knowledge in the fields ',
        '24/02/2020',
        'Library',
        'The Robotics and Automation Society (BVPIEEE RAS) is a professional society that supports the development and the exchange of scientific knowledge in the fields ',
        null,
        null, [
      Mentor('Adit', 'images/wall.jpg'),
      Mentor('Adit', 'images/women.jpg.jpg')
    ]),
    Workshop(
        103,
        'images/bvp2.jpg',
        'BVPIEEE Computer Society (sometimes abbreviated Computer Society or CS) is a professional society of IEEE. Its purpose and scope is “to advance the theory, practice, and application of computer and information processing science and technology” and the “professional standing of its members.',
        '24/02/2020',
        'Library',
        null,
        null,
        null,
        null)
  ];
  ////////////////////////////////////////////////////////////////////////////////////////

  // For Latest News ////////////////////////////////////////////////////////////////////////

  static List<news> latest_news = [
    news('101', 'images/bvp.jpg',
        'BVPIEEE: the student branch of IEEE at Bharati Vidyapeeths College of Engineering'),
    news('101', 'images/bvp.jpg',
        'BVPIEEE: the student branch of IEEE at Bharati Vidyapeeths College of Engineering'),
    news('101', 'images/bvp.jpg',
        'BVPIEEE: the student branch of IEEE at Bharati Vidyapeeths College of Engineering')
  ];
  ////////////////////////////////////////////////////////////////////////////////////////

  // for Society purpose //////////////////////////////////////////////////////////////////
  static List<Societydetail> societydetail = [];
  ////////////////////////////////////////////////////////////////////////////////////////

  // for firbase part ///////////////////////////////////////////////////////////////////
  DatabaseReference mref = FirebaseDatabase.instance.reference();

  @override
  void initState() {
    firebaseRetrive();
    super.initState();
  }

  Future<void> firebaseRetrive() async {
    mref.child('bvpieee').once().then((DataSnapshot snap) async {
      Map<dynamic, dynamic> maps = snap.value;

      // for chapter
      Map<dynamic, dynamic> chaptermaps = maps["Chapter"];
      for (int i = 1; i <= chaptermaps.length; i++) {
        Map<dynamic, dynamic> chapter = chaptermaps['Chapter$i'];
        // print('$societyname \n $societydescription \n $societyimage \n${mentorname[0]} \n${mentorname[1]} \n${phoneno[0]} \n${phoneno[1]}');
        societydetail.add(Societydetail.nn(chapter));
      }
      // for workshop

      // for latest news

      // for events
      Map<dynamic, dynamic> eventmaps = maps["OurEvent"];

      for (int i = 1; i <= eventmaps.length; i++) {
        Map<dynamic, dynamic> event = eventmaps['Event$i'];
        final ref = FirebaseStorage.instance
            .ref()
            .child('OurEvent/')
            .child('Event$i/')
            .child('img.jpg');
        String url = await ref.getDownloadURL();
        setState(() {
          event['photoslink'] = url;
          events.add(OurEvent.nn(event));
        });
      }
      ///////////
      
    });


  }
  ////////////////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(context) {
    //firebaseRetrive();

    return Scaffold(  
      drawer: new DRAWER(context),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: new App_Bar(context),
      ),
      body: TabBarView(
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                latestnews(),
                Card(child: app_news(latest_news.length - 1)),
                Card(child: app_news(latest_news.length - 2)),
                Card(child: app_news(latest_news.length - 3)),
                workshopes(),
                Card(child: workshopsliding()),
                //AboutUs(),
              ],
            ),
          ),
          UpcomingEvents(),
          society_listview(),
        ],
      ),
    );
  }

  Widget UpcomingEvents() {
    return Center(
        child: ListView.builder(
            itemCount: events.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return EventPage(event: events[index]);
                  }));
                },
                child: Card(
                  
                  margin:
                      EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: 140.0,
                        height: 200.0,
                        margin: EdgeInsets.only(
                            top: 8, bottom: 8, left: 8, right: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          color: Colors.redAccent,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10,bottom: 10),
                          child: Image.network(
                            '${events[index].photoslink}',
                            fit: BoxFit.fitHeight,
                            
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                      ),
                      Flexible(
                        child: Text(
                          '${events[index].intro}',
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.fade,
                          style: TextStyle(fontSize: 15, color: Theme.of(context).primaryColor),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }));
  }

  Widget latestnews() {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 30, right: 200),
      child: Text("Latest News",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 20,
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          )),
    );
  }

  Widget workshopes() {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 30, right: 200, bottom: 30),
      child: Text("Workshop",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 20,
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          )),
    );
  }

  Widget workshopsliding() {
    return SizedBox(
      height: 200.0,
      child: ListView.builder(
          itemCount: workshops.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WorkshopPage(
                              workshop: workshops[index],
                            )));
              },
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    child: Image.asset('${workshops[index].photoslink}'),
                    radius: 100,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                  )
                ],
              ),
            );
          }),
    );
  }

  Widget app_news(int index) {
    if (index < 0) {
      return null;
    }

    if (index % 2 == 0) {
      return InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => newsnews()));
        },
        child: Container(
          height: 150,
          margin: EdgeInsets.only(top: 50, bottom: 50, left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CircleAvatar(
                child: Image.asset(
                  '${latest_news[index].news_imagelink}',
                  fit: BoxFit.cover,
                  width: 200,
                  height: 200,
                ),
                backgroundColor: Colors.amber,
                radius: 80,
                foregroundColor: Colors.red,
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
              ),
              Flexible(
                child: Text(
                  '${latest_news[index].news_Description}',
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.fade,
                  style: TextStyle(fontSize: 15, color: Colors.black87),
                ),
              )
            ],
          ),
        ),
      );
    } else {
      return InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => newsnews()));
        },
        child: Container(
          height: 150,
          margin: EdgeInsets.only(top: 50, bottom: 50, left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: Text(
                  '${latest_news[index].news_Description}',
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.fade,
                  style: TextStyle(fontSize: 15, color: Colors.black87),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
              ),
              CircleAvatar(
                child: Image.asset(
                  '${latest_news[index].news_imagelink}',
                  fit: BoxFit.cover,
                  width: 200,
                  height: 200,
                ),
                backgroundColor: Colors.amber,
                radius: 80,
                foregroundColor: Colors.red,
              ),
            ],
          ),
        ),
      );
    }
  }
}
