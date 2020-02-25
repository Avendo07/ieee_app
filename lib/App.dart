
import 'package:bvp_ieee/Class_Workshop.dart';
import 'package:bvp_ieee/Drawer.dart';
import 'package:bvp_ieee/Societydetail.dart';
import 'package:bvp_ieee/society_listview.dart';
import 'package:flutter/material.dart';
import 'package:bvp_ieee/WorkshopPage.dart';

import './appBar.dart';
import 'EventPage.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
List<Workshop>  entries = [
  Workshop('101','images/bvp.jpg', 'BVPIEEE: the student branch of IEEE at Bharati Vidyapeeths College of Engineering','24/02/2020','Library',null,null,null,null),
  Workshop('102','images/bvp1.jpg', 'The Robotics and Automation Society (BVPIEEE RAS) is a professional society that supports the development and the exchange of scientific knowledge in the fields ','24/02/2020','Library',null,null,null,null),
  Workshop('103','images/bvp2.jpg','BVPIEEE Computer Society (sometimes abbreviated Computer Society or CS) is a professional society of IEEE. Its purpose and scope is “to advance the theory, practice, and application of computer and information processing science and technology” and the “professional standing of its members.','24/02/2020','Library',null,null,null,null)
  ];
List<Workshop>  workshops=[Workshop(null,'images/bvp.jpg',null,null,null,null,null,null,null),Workshop(null,'images/bvp2.jpg',null,null,null,null,null,null,null)];

static List<Societydetail> societydetail=[Societydetail('Robotics', 'BVIEE is a society of BVCOE affiliated to IEEE.When you join IEEE, you join a community of over 425,000 technology and engineering professionals united by a common desire to continuously learn, interact, collaborate, and innovate. IEEE Membership provides you with the resources and opportunities you need to keep on top of changes in technology; get involved in standards development; network with other professionals in your local area or within a specific technical interest; mentor the next generation of engineers and technologists, and so much more. ','images/bvp1.jpg',['Ashish'],['ashisharora111122@gmail.com'])];
  @override
  Widget build(context) {
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
                   Card(child: news(entries.length-1)),
                   Card(child: news(entries.length-2)),
                   Card(child: news(entries.length-3)),
                  workshopes(),
                  Card(child: workshopsliding()),
                  //AboutUs(),

                ],
              ),
            ),
            Center(child: 
            ListView.builder(
          
          itemCount: 1,
          itemBuilder: (BuildContext context,int index)
          {
               return InkWell(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)
                       {
                         return EventPage(event: workshops[0]);
                       }));
                     }, 

                      child: Container(
            height: 150,
            margin: EdgeInsets.only(top: 50, bottom: 50, left: 10, right: 10),
            

            child: Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircleAvatar(
                  child: Image.asset('${entries[index].photoslink}',
                    fit: BoxFit.cover,
                    width: 200,
                    height: 200,),
                  backgroundColor: Colors.amber,
                  radius: 80,
                  foregroundColor: Colors.red,
                ), Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                )
                ,
                Flexible(child: Text(
                  '${entries[index].intro}', textAlign: TextAlign.start,
                  overflow: TextOverflow.fade,
                  style: TextStyle(fontSize: 15,
                      color: Colors.black87),),)
              ],
            ),

          ),
               );
          })
            ),
            society_listview(),
          ],
        ),
      );

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
          itemBuilder: (BuildContext context,int index){
          return  Row(
            children: <Widget>[
              CircleAvatar(
            child: Image.asset('${workshops[index].photoslink}'),
            radius: 100,
          ),
          Container(
            margin: EdgeInsets.only(left: 10,right: 10),
          )
            ],
          );
        }),
      );

    }

    Widget news(int index) {
      if (index < 0) {
        return null;
      }

      if (index % 2 == 0) {
        return InkWell(
            onTap: (){Navigator.push(context, MaterialPageRoute(
              builder: (context) => 
              WorkshopPage(
                workshop: workshops[index],
              )
              ));},
            child: Container(
            height: 150,
            margin: EdgeInsets.only(top: 50, bottom: 50, left: 10, right: 10),
            

            child: Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircleAvatar(
                  child: Image.asset('${entries[index].photoslink}',
                    fit: BoxFit.cover,
                    width: 200,
                    height: 200,),
                  backgroundColor: Colors.amber,
                  radius: 80,
                  foregroundColor: Colors.red,
                ), Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                )
                ,
                Flexible(child: Text(
                  '${entries[index].intro}', textAlign: TextAlign.start,
                  overflow: TextOverflow.fade,
                  style: TextStyle(fontSize: 15,
                      color: Colors.black87),),)
              ],
            ),

          ),
        );
      }
      else {
        return InkWell(
            onTap: (){Navigator.push(context, MaterialPageRoute(
              builder: (context) => 
              WorkshopPage(
                workshop: workshops[index],
              )
              ));},
                  child: Container(
            height: 150,
            margin: EdgeInsets.only(top: 50, bottom: 50, left: 10, right: 10),


            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Flexible(child: Text(
                  '${entries[index].intro}', textAlign: TextAlign.start,
                  overflow: TextOverflow.fade,
                  style: TextStyle(fontSize: 15,
                      color: Colors.black87),),),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                )
                ,
                CircleAvatar(
                  child: Image.asset('${entries[index].photoslink}',
                    fit: BoxFit.cover,
                    width: 200,
                    height: 200,),
                  backgroundColor: Colors.amber,
                  radius: 80,
                  foregroundColor: Colors.red,

                ),


              ],
            ),

          ),
        );
      }
    }}
