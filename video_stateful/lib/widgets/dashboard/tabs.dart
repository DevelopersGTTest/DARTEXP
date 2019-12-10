import 'package:flutter/material.dart';

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
       backgroundColor:  Colors.white,
       bottom: TabBar(
        tabs: <Widget>[
          Tab( icon: Icon( Icons.home)),
          Tab( icon: Icon( Icons.ondemand_video )),
          Tab( icon: Icon( Icons.contacts ))
        ],
      ),
     ),
     ),
   );
  }
}