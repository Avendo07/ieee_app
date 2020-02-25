
import 'package:flutter/material.dart';
import 'package:bvp_ieee/App.dart';

class SocietyView extends StatefulWidget
{
  int index;

  SocietyView(this.index);
   @override
   State<StatefulWidget> createState() =>  SocietyViewState(this.index);
}
class SocietyViewState extends State
{
   int index;
   SocietyViewState(this.index);
 
  @override
  Widget build(BuildContext context)
   {
     
    // Societydetail societydetail=Societydetail('ROBOTICS','BVIEE is a society of BVCOE affiliated to IEEE.When you join IEEE, you join a community of over 425,000 technology and engineering professionals united by a common desire to continuously learn, interact, collaborate, and innovate. IEEE Membership provides you with the resources and opportunities you need to keep on top of changes in technology; get involved in standards development; network with other professionals in your local area or within a specific technical interest; mentor the next generation of engineers and technologists, and so much more. ',null,['Ashish'],['ashisharora111122@gmail.com']);
    
     return Scaffold(
       appBar: AppBar(
         title: Text('BVPIEEE SOCIETY'),
         shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 20),
              child: Text("${AppState.societydetail[index].society_name}",textAlign: TextAlign.center,style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("${AppState.societydetail[index].society_description}",textAlign: TextAlign.justify,style: TextStyle(
                fontSize: 15
              ),),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("${AppState.societydetail[index].mentor_name[0] } \n ${AppState.societydetail[index].mentor_phoneno[0] }",textAlign: TextAlign.center,style: TextStyle(
                fontSize: 15
              ),),
            ),
            
            
          ],

        ),
       
     );
   }
}
