import 'package:bvp_ieee/Drawer.dart';

//import 'package:bvp_ieee/appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

String head;

class Head_AppBar extends StatefulWidget {
  Head_AppBar(String s) {
    head = s;
  }

  @override
  State<StatefulWidget> createState() {
    return Head_AppState();
  }
}

class Head_AppState extends State {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      leading: new Padding(
        child:
        new InkWell(
//         highlightColor: Colors.black,
//          splashColor: Colors.amber,
          borderRadius: BorderRadius.all(Radius.elliptical(200, 200)),
          child: CircleAvatar(                                                  //Cupertino Button is large
            backgroundImage: AssetImage('images/wall.jpg'),
          ),
          onTap: () {                                                           //Open up the image
            Scaffold.of(context).showSnackBar(SnackBar(
              duration: Duration(microseconds: 10),
              content: new Text("Image"),
              backgroundColor: Theme.of(context).snackBarTheme.backgroundColor,
            ));
          },
        ),
        padding: EdgeInsets.all(5),
      ),
      title: new Row(
        children: <Widget>[
          Text(head),
        ],
      ),
//      automaticallyImplyLeading: true,

      actions: <Widget>[
        new IconButton(
            icon: new Icon(CupertinoIcons.bell),
            onPressed: () => Scaffold.of(context).showSnackBar(                 //Open up the notifications of assignments and workshops
                  new SnackBar(
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(

                      borderRadius:BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)) 
                    ) ,
                    content: new Text("Hello"),
                    duration: Duration(milliseconds: 300),
                  ),
                )),
      ],
      shape: RoundedRectangleBorder(
        
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
        automaticallyImplyLeading: false,
      
      
      /*bottom: new PreferredSize(
            child: new App_Bar(context),/*crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.ideographic,*/
            preferredSize: null)*/
    );
  }
}
