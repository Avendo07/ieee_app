class OurEvent
{
  String photoslink;
  String details;
  String date;
  String venue;
  String intro;
  String formLink;
  int eventNumber;
  OurEvent(this.eventNumber,this.photoslink,this.intro,this.date,this.venue,this.details,this.formLink);

  OurEvent.nn(Map<dynamic,dynamic> map){
    this.photoslink=map['photoslink'];
    this.details=map['details'];
    this.date=map['date'];
    this.venue=map['venue'];
    this.intro=map['intro'];
    this.formLink=map['formLink'];
    this.eventNumber=map['eventno'];
  }
} 