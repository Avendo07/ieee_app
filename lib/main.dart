import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bvp_ieee/Auth.dart';
import 'package:bvp_ieee/Root.dart';
import 'package:bvp_ieee/App.dart';
import 'package:bvp_ieee/ui/Login.dart';
import 'package:bvp_ieee/ui/Workshop_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BVPIEEE App",
      home: MaterialApp(title: "app", home: RootPage(auth: new Auth())),
      /* DefaultTabController(
        child: new App(),
        length: 3,
      ),*/
     theme: ThemeData(
          primaryColor: Colors.cyan.shade800,
          accentColor: Colors.purple,
        selectedRowColor: Colors.purple.shade200,
      ),
    );
  }
}
