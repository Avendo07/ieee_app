import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bvp_ieee/App.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BVPIEEE App",
      home: DefaultTabController(
        child: new App(),
        length: 3,
      ),
      theme: ThemeData(
          primaryColor: Colors.cyan.shade800,
          accentColor: Colors.purple,
          selectedRowColor: Colors.purple.shade200
      ),
    );
  }
}
