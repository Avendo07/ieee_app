
import 'package:ieee_app/addworkshop.dart';
import 'package:ieee_app/class_workshop.dart';
import 'package:ieee_app/AboutUs.dart';
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
      return Scaffold(
           appBar: AppBar(
             title: Text("BVPIEEE SOCIETY"),
             leading: Icon(Icons.apps),
             actions: <Widget>[
              IconButton(icon:  Icon(Icons.note_add),
               onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => Addworkshops()));
               },),
             ],
           ),
          drawer: drawers(),
          body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
              
              children: <Widget>[
                latestnews(),
                 news(),
                workshopes(),
                workshopsliding(),
 
                
              ],
            ),
          ),
                );
    }

    Widget drawers()
    {
      return Drawer(
        
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(accountName: Text('Ashisharora')
                , accountEmail: Text('Ashisharora'),
                currentAccountPicture: null,),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Setting'),
                ),
                ListTile(
                  leading: Icon(Icons.add_box),
                  title: Text('About us'),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUs()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Logout'),
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

    Widget news()
    {
        return SizedBox(
          height: 500,
          child: ListView.builder(
         scrollDirection: Axis.vertical,
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          
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
        ));
    }

    

}
