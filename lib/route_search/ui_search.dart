import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class ui_search extends StatefulWidget{
  static const String route = 'search';
  @override
  _ui_search createState() => _ui_search();
  }

class _ui_search extends State<ui_search>{

  //this should eventually be either pulled from database initially and kept local
  //or should be pulled while creating search query
  List<String> dataholder = [
    "Johnette Otterson",
    "Sara Easler",
    "Anna Ayala",
    "Lamonica Uphoff",
    "Shakira Wolff",
    "Belle Abasta",
    "Christena Brownstein",
    "Grady Straker",
    "Roxann Ashbaugh",
    "Kyong Frank",
    "Angla Colunga",
    "Matha Flemister",
    "Felisha Premo",
    "Bernadette Kelly",
    "Glennis Bierbaum",
    "Etha Sessoms",
    "Kai Selders",
    "Celsa Yee",
    "Cherelle Evatt",
    "Lara Spainhour",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              showSearch(context: context, delegate: Search());
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: dataholder.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            dataholder[index],
          ),
      )
      ),
    );
  }
}

class Search extends SearchDelegate{

  String selectedResult = "";
  List<String> listExample = [];
  List<String> recentList = [];
  List<String> suggestionList = [];


  @override
  List<Widget> buildActions(BuildContext context) {
    return[
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query="";
        },
      ),
      ];
    }


  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: (){
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
        child: Text(selectedResult),
      );
  }

  @override
  Widget buildSuggestions(BuildContext context) {

//    query.isEmpty
//      ? suggestionList = recentList
//      : suggestionList.addAll(listExample.where(
//        (element) => element.contains(query),
      suggestionList.addAll(listExample.where(
          (element) => element.contains(query)
    ));

    return ListView.builder(
      itemCount:  suggestionList.length,
      itemBuilder: (context, index){
        return ListTile(
          title: Text(
            // this does not populate regardless what happens 
            // look back into suggestions, no data gets passed here properly
            //suggestionList[index],
            'ahhhhh',
          ),
          leading: query.isEmpty ? Icon(Icons.access_time) : SizedBox(),
          onTap: (){
            selectedResult = suggestionList[index];
            showResults(context);
          },
        );
      },
    );
  }
  
}