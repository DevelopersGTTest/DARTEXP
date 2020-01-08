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
          onPressed: (){ },
        )
      ],
    ),
 );
 }
}

class DataSearch extends SearchDelegate<String>{
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [ IconButton( 
      icon: Icon( Icons.clear), onPressed: (){},
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
      onPressed: (){},
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // si encuentro algun resultado de la busqueda
    return null;
  }
}