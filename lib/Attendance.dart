import 'package:bvp_ieee/App.dart';
import 'package:bvp_ieee/Class_Workshop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class Attendance extends StatefulWidget {
  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  
  List <DropdownMenuItem<String>> listdrop =[DropdownMenuItem(child: Text("HEllo"),value:'10',)];
  @override
  Widget build(BuildContext context) {
    return null;
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("BVPIEEE SOCIETY"),
    //     backgroundColor: Theme.of(context).primaryColor,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
    //       automaticallyImplyLeading: false,
    //   ),
    //   body: SingleChildScrollView(
    //     child: Column(
    //       children: <Widget>[
    //          Container(
    //             margin: EdgeInsets.all(20),
    //             child: Text(
    //               'Attendance',
    //               style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
    //             ),
    //           ),
    //          Container(
                              
    //            child: Form(child: Column(
                 
    //              children: <Widget>[
    //                Container(
    //                  margin: EdgeInsets.all(40),
    //                  child: DropdownButtonFormField(
    //                  //  items: AppState.workshop.map((Workshop value){
    //                    //  return DropdownMenuItem<String>(child: Text('${value.name}'),value:value.name);
    //                    }).toList(), 
    //                    onChanged: (_){},
    //                    ),
    //                ),
    //                  Container(
    //                    margin: EdgeInsets.all(40),
    //                    child: TextFormField(
    //                     keyboardType: TextInputType.number,
    //                     toolbarOptions: ToolbarOptions(
    //                       copy: true,
    //                       paste: true,
    //                       selectAll: true,
    //                       cut: true,
    //                     ),
    //                     cursorColor: Theme.of(context).primaryColor,
    //                     cursorRadius: Radius.circular(50),
    //                     cursorWidth: 5,
                        
    //                    ),
    //                  ),
    //                  Container(
    //                    height: 50,
    //                    width: 190,
    //                    margin: EdgeInsets.all(40),
    //                    child: RaisedButton(onPressed: (){},
    //                    color: Theme.of(context).primaryColor,
    //                    shape: RoundedRectangleBorder(
    //                      borderRadius: BorderRadius.circular(30),

    //                    ),
    //                    elevation: 20,
    //                    child: Text("Mark the Attendance"),
    //                    textColor: Colors.white,
    //                    ),
    //                  )
    //              ],
    //            )),
    //          ) 
    //       ],
    //     ),
    //   ),
     

    // );
  }
}