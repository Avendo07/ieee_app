import 'package:bvp_ieee/Society_View.dart';

import 'package:flutter/material.dart';
import 'package:bvp_ieee/App.dart';

class society_listview extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return society_listviewState();
  }
}

class society_listviewState extends State<society_listview> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SocietyView(index);
                }));
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(20), top: Radius.circular(20))),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        '${AppState.societydetail[index].society_image}',
                      ),
                      fit: BoxFit.fill,
                      colorFilter: ColorFilter.linearToSrgbGamma(),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: EdgeInsets.all(10),
                  height: 350,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(21))),
                    transform: Matrix4.identity(),
                    margin: EdgeInsets.only(bottom: 300, top: 0, left: 0),
                    child: ListTile(
                      trailing: Icon(
                        Icons.ac_unit,
                        color: Colors.white,
                      ),
                      title: Text(
                        '${AppState.societydetail[index].society_name}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                ),
              )

              //  child: Container(
              //    margin: EdgeInsets.all(10),
              //    height: 340,
              //    child: Column(
              //      children: <Widget>[
              //        Container(
              //          margin: EdgeInsets.all(10),
              //          child: Text('${AppState.societydetail[index].society_name}',
              //          style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              //         ),

              //        Expanded(

              //                                       child: Container(

              //             margin: EdgeInsets.all(10),
              //            child: Image.asset('${AppState.societydetail[index].society_image}',
              //             ),
              //          ),
              //        )
              //      ],
              //    ),

              );
        });
  }
}
