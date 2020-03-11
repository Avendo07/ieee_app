import 'package:flutter/material.dart';
import 'Head_AppBar.dart';
class newsnews extends StatefulWidget {
  @override
  _newsnewsState createState() => _newsnewsState();
}

class _newsnewsState extends State<newsnews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: new Head_AppBar("LATEST NEWS"),
        preferredSize: Size.square(60),
      ),
      body: Text("hello"),
    );
  }
}