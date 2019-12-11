import 'package:flutter/material.dart';
import 'package:video_stateful/screens/contact.dart';
import 'package:video_stateful/screens/home.dart';
import 'package:video_stateful/screens/video.dart';

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => new _TabsState();
}

class _TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
   return DefaultTabController(
     length: 3, //param required
     child: Scaffold(appBar: AppBar(
       title: Text("Video stateful"),
       backgroundColor:  Colors.transparent,
       bottom: TabBar(
        tabs: <Widget>[
          Tab( icon: Icon( Icons.home)),
          Tab( icon: Icon( Icons.ondemand_video )),
          Tab( icon: Icon( Icons.contacts ))
        ],
      ),
     ),
      body: TabBarView(
        children: <Widget>[
          Home(), Video(), Contact()
        ],
      ),
     ),
   );
  }
}