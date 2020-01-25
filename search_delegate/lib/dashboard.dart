import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("search"),
      actions: <Widget>[
        IconButton( 
          icon: Icon( Icons.search ),
          onPressed: (){ 
            showSearch( context: context, delegate: DataSearch());
          },
        )
      ],
    ),
    drawer: Drawer(),
 );
 }
}

class DataSearch extends SearchDelegate<String>{

  //dummy DATA
  //defs
  final cities = [
    "Ciudad de Guatemala",
    "Quetzaltenango",
    "Escuintla",
    "Puerto Barrios (Izabal)",
    "Cobán, Alta Verapaz",
    "Teculután, Zacapa",
    "Jutiapa",
    "Poptún (Petén)",
    "Huehuetenango",
    "Sacatepéquez",
    "Chimaltenango"
  ];

  //dummy last results 
  final recentCities = [
    "Ciudad de Guatemala",
    "Teculután, Zacapa",
    "Sacatepéquez",
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [ IconButton( 
      icon: Icon( Icons.clear), onPressed: (){
        query = "";   
      },
      ) 
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final suggestionsList = query.isEmpty 
      ? recentCities 
      : cities.where((p)=> p.startsWith(query)).toList();
    
    return ListView.builder(
      itemBuilder: (context, index)=> ListTile(
        leading: Icon(Icons.location_city),
        title: Text( suggestionsList[index]),
      ),
      itemCount: suggestionsList.length,
    );
  }
}