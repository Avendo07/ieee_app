
//import 'package:bvp_ieee/addworkshop.dart';
import 'package:bvp_ieee/class_workshop.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget
{
    @override
  State<StatefulWidget> createState()  => AppState();
  
}
class AppState extends State<App>
{
List<Workshop>  entries = [Workshop('images/bvp.jpg', 'BVPIEEE: the student branch of IEEE at Bharati Vidyapeeths College of Engineering'),Workshop('images/bvp1.jpg', 'The Robotics and Automation Society (BVPIEEE RAS) is a professional society that supports the development and the exchange of scientific knowledge in the fields '),Workshop('images/bvp2.jpg','BVPIEEE Computer Society (sometimes abbreviated Computer Society or CS) is a professional society of IEEE. Its purpose and scope is “to advance the theory, practice, and application of computer and information processing science and technology” and the “professional standing of its members.')];
List<Workshop>  workshops=[Workshop('images/bvp.jpg',null),Workshop('images/bvp2.jpg',null)];

  @override
    Widget build(context)
    {
      return DefaultTabController(
             length: 3,
              child: Scaffold(
             appBar: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: AppBar(
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: IconButton(icon: Icon(Icons.notifications), onPressed: () {},),
              )
            ],
            title: Text("BVPIEEE"),
            backgroundColor: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)) ),
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
          ),
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
                  aboutus(),
 
                  
                ],
              ),
            ),
            Center(child: Text("Upcoming events appear here")),
            Center(child: Text("Chapters apear here")),
          ],
        ),
  
            drawer: drawers(),
            
                  ),
      );
    }

    Widget aboutus()
    {
      return Container(
                margin : EdgeInsets.only(left: 20,top: 30,right: 200),
                child: Text("About us",style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic, 
                  


                )),
                
              ); }

    Widget drawers()
    {
      return  Drawer(
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
                          ),),
                      Padding(
                        padding: const EdgeInsets.only(top: 100, left: 10),
                        child: Text("johnexample@gmail.com", style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold
                        ),),
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
                        bottomRight: Radius.circular(30.0)
                      )
                    ),
                    child: ListTile(
                      leading: Icon(Icons.home, color: Colors.black),
                      title: Text("Home"),
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
    Widget latestnews()
    {
      return Container(
                margin : EdgeInsets.only(left: 20,top: 30,right: 200),
                child: Text("Latest News",style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic, 
                  


                )),
                
              );
    }

Widget workshopes()
    {
      return Container(
                margin : EdgeInsets.only(left: 20,top: 30,right: 200, bottom: 30),
                child: Text("Workshop",style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic, 
                  


                )),
                
              );
    }

Widget workshopsliding()
    {
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

    Widget news(int index)
    {  
         if(index<0)
         {
           return null;
         } 

         if(index%2==0)
                 {
                   
                   return  Container(
        height: 150,
        margin: EdgeInsets.only(top: 50,bottom: 50,left: 10,right: 10),   
         

        
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
              
           ),Container(
             margin: EdgeInsets.only(left: 10,right: 10),
           )
            ,
          Flexible(child:   Text('${entries[index].details}',textAlign:TextAlign.start,overflow: TextOverflow.fade,
            style: TextStyle(fontSize: 15,
            color: Colors.black87),),)
          ],
        ),
        
        );
        }
        else
        {
          return Container(
        height: 150,
        margin: EdgeInsets.only(top: 50,bottom: 50,left: 10,right: 10),   
         

        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            
          Flexible(child:   Text('${entries[index].details}',textAlign:TextAlign.start,overflow: TextOverflow.fade,
            style: TextStyle(fontSize: 15,
            color: Colors.black87),),),
            Container(
             margin: EdgeInsets.only(left: 10,right: 10),
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
        
        );
        }
       
        
    }

    

}