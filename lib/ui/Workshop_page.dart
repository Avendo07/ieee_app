import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class WorkshopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
//            pinned: true,
            title: Text(
              "Moki",
              style: TextStyle(color: Colors.black),
            ),
            flexibleSpace: FlexibleSpaceBar(
                background: InkWell(
                  child: Image.asset(
                    'images/bvp.jpg',
                    fit: BoxFit.fitWidth,
                  ),
                  onTap: () {
                    print("Hello");
                  },
                ),
                title: Text(
                  "May",
                  style: TextStyle(color: Colors.black),
                ),
                centerTitle: true,
                collapseMode: CollapseMode.parallax),
            expandedHeight: MediaQuery.of(context).size.height / 2,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              Brief(),
              EventDetails(),
              Mentors(),
              Container(
                color: Colors.limeAccent,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
              )
            ]),
          )
        ],
      ),
    );
  }
}

class Brief extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ReadMoreText(
          descText:
              "KJKFDJKJFDNFANKJNFKJAFNAKJNFDNJKNFKDANKJNFNKJNKSANJFSNKJANFSKJNFSKA"
              "dskafjlk;fdsj;kljfd;kljf;akjfdjjkl;sdjfkljklj"
              "jfdajshfdjlksfdhlkjfdshakjhfalkdsjhfjllhfa"
              "asdfkljkdsahfjlhasljdhfjhdsakfhjj"
              "sadlfjkshdflskhafjhdsfjh"
              "fsdkfajkjksdlafknjdsnjafjk"
              "sdjfjlnafdsnjnadfknkjsdfnjandfs"
              "dsjnfjljsnfknsdkanfkjlnadskjlf"
              "sdnfjnasjndfknasdjnflkjnsakjflnsdaf"
              "nfkjsandfjknkjladssd"
              "dskjfnjnsdakjfnkjnsdkjnfnkjsdaf"
              "sdfnjfsdnafkjndskj"),
    );
  }
}

class EventDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Card(
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.date_range),
                title: Text("12/122/2018"),
              ),
              Divider(
                indent: 10.0,
                endIndent: 10.0,
                thickness: 1,
              ),
              ListTile(
                leading: Icon(Icons.access_time),
                title: Text("2200Hours"),
              ),
              Divider(
                indent: 10.0,
                endIndent: 10.0,
                thickness: 1,
              ),
              ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text("College Library"),),
            ],
          )),
    );
  }
}

class Mentors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MentorCard(
          index: 0,
          name: "Naman Kaushik",
          pic: AssetImage("images/bvp1.jpg"),
          details: "HOKJ",
        ),
        MentorCard(
          index: 1,
          name: "Loki Joshua",
          pic: AssetImage("images/bvp2.jpg"),
          details: "Machine Learning",
        ),
      ],
    );
  }
}

class MentorCard extends StatelessWidget {
  final String name;
  final ImageProvider pic;
  final String details;
  final int index;

  MentorCard({this.name, this.pic, this.details, this.index});

  @override
  Widget build(BuildContext context) {
    if (index % 2 == 0)
      return ListTile(
        title: Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold),
          textScaleFactor: 1.2,
        ),
        trailing: CircleAvatar(
          backgroundImage: pic,
          radius: 30.0,
        ),
        subtitle: Text(details),
      );
    else {
      return ListTile(
        title: Align(
          child: Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold),
            textScaleFactor: 1.2,
          ),
          alignment: Alignment.centerRight,
        ),
        leading: CircleAvatar(backgroundImage: pic, radius: 30.0),
        subtitle: Align(
          child: Text(details),
          alignment: Alignment.centerRight,
        ),
      );
    }
  }
}

class ReadMoreText extends StatefulWidget {
  final String descText;
  final Color color;

  ReadMoreText({this.descText, this.color});

  @override
  _ReadMoreTextState createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool description = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.descText,
          maxLines: description ? 30 : 2,
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 15, color: widget.color),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            InkWell(
                onTap: () {
                  setState(
                    () {
                      description = !description;
                    },
                  );
                },
                child: description
                    ? Text(
                        "Show Less",
                        style: TextStyle(color: Colors.blue),
                      )
                    : Text("Read More", style: TextStyle(color: Colors.blue)))
          ],
        ),
      ],
    );
  }
}
