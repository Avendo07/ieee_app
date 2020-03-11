
import 'package:bvp_ieee/Class_Event.dart';
class Workshop extends OurEvent
{
  String chapter;
  List<Mentor> mentors;

  Workshop(int eventNumber,String photoslink,String intro,String date,String venue,String details,String formLink,this.chapter,this.mentors)
  :super(eventNumber,photoslink,intro,date,venue,details,formLink);
}

class Mentor{
  String name;
  String photolink;
  Mentor(this.name,this.photolink);

}
