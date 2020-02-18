import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class AboutUs extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BVPIEEE',
      home: MyAboutPage(title: 'ABOUT BVPIEE'),
    );
  }
}

class MyAboutPage extends StatefulWidget {
  MyAboutPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyAboutPageState createState() => _MyAboutPageState();
}

class _MyAboutPageState extends State<MyAboutPage> {
  GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  final _marker = Marker(
    markerId: MarkerId("BVPIEEE"),
    position: LatLng(28.6758656, 77.1110182),
    infoWindow: InfoWindow(
      title: "BVPIEEE",
      snippet:
          " A-4 Block, Baba Ramdev Marg, Shiva Enclave, Paschim Vihar, New Delhi, Delhi 110063",
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('BVPIEE SOCIETY'),
        ),
        body: Column(children: <Widget>[
          Text(
            'About Us',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(
            'BVIEE is a society of BVCOE affiliated to IEEE.When you join IEEE, you join a community of over 425,000 technology and engineering professionals united by a common desire to continuously learn, interact, collaborate, and innovate. IEEE Membership provides you with the resources and opportunities you need to keep on top of changes in technology; get involved in standards development; network with other professionals in your local area or within a specific technical interest; mentor the next generation of engineers and technologists, and so much more. ',
          ), 
          Row(children: <Widget>[
            new Icon(Icons.email),
            Text('sb.bvpieee@gmail.com'),
          ]),
          Flexible(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _marker.position,
                  zoom: 16.0,
                ),
                markers: [_marker].toSet(),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
