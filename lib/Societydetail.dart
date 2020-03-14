class Societydetail
{
    String society_name;
    String society_description;
    String society_image;
    List<String> mentor_name;
    List<String> mentor_phoneno;

    Societydetail(this.society_name,this.society_description,this.society_image,this.mentor_name,this.mentor_phoneno);

    Societydetail.nn(Map<dynamic,dynamic> chapters)
    {
      this.society_name=chapters['society_name'];
      this.society_description=chapters['society_description'];
      this.society_image=chapters['society_image']; 
           
           Map<dynamic,dynamic> mentors=chapters['mentor'];
           this.mentor_name=[];
           for(int j=1;j<=mentors.length;j++)
           {
             mentor_name.add(mentors['mentor$j'].toString());
           }

           Map<dynamic,dynamic> phone=chapters['mentor_phoneno'];
           this.mentor_phoneno=[];
           for(int j=1;j<=phone.length;j++)
           {
             this.mentor_phoneno.add(phone['phone$j'].toString());
           }

    }
}