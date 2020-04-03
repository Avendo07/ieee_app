
import 'package:bvp_ieee/Class_Event.dart';
class Workshop 
{
   String photoslink;
  String details;
  String date;
  String venue;
  String intro;
  String formLink;
  int eventNumber;
  String chapter;
  List<Mentor> mentors=[];

  Workshop(this.photoslink,this.details,this.date,this.venue,this.intro,this.formLink,this.eventNumber,this.chapter,this.mentors);
  

   
  Workshop.fromJson(Map<dynamic,dynamic> map){
    this.chapter=map['chapter'];
    this.date=map['date'];
    this.details=map['detail'];
    this.eventNumber=map['eventNo'];
    this.formLink=map['formLink'];
    this.intro=map['intro'];
    this.photoslink=map['photoLink'];
    this.venue=map['venue'];
    Map<dynamic,dynamic> mentors=map['Mentors'];
    for(int i=1;i<=mentors.length;i++){
     Map<dynamic,dynamic> men=mentors['Mentor$i'];
     this.mentors.add(Mentor(men['name'], men['photo']));
    }
  }

}

class Mentor{
  String name;
  String photolink;
  Mentor(this.name,this.photolink);

}
