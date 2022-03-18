import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maoso3a_taranim_arabia/data.dart';
import 'package:maoso3a_taranim_arabia/database.dart'as fbDatabase;
import 'package:maoso3a_taranim_arabia/songs_sreen.dart';
import 'package:maoso3a_taranim_arabia/searchB.dart';
class search extends SearchDelegate<String> {

  searchResults() {}

  @override
  List<Widget> buildActions(BuildContext context) {

    // TODO: implement buildActions
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {
      query = '';
    })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, " ");
        });
  }
  //bool isQ =false;
 //var querySet =[];
  //var searchSet=[];
 /* int queryLength=0;
  int searchLength=0;
  Future<void> queryLoad(String q) async{
  Query _messageRefVerse;
  _messageRefVerse = FirebaseFirestore.instance.collection('Verses').where("Text".replaceAll("\u1d2c", "")
      .replaceAll("\u1d2e", "").replaceAll("\u1d9c", "").replaceAll("\u1d30", "").replaceAll("\u1d31", "").replaceAll("\u1da0", "")
      .replaceAll("\u1d33", "").replaceAll("\u1d50", "").replaceAll("\u1d47", "")
      .replaceAll("\ufe5f", "").replaceAll("\u2087", "").replaceAll("\u209b", "").replaceAll("\u1d64", "").replaceAll("\u2084", "")
      .replaceAll("\u1d48", "").replaceAll("\u2071", "").replaceAll("/", "\n"), arrayContains: q);
  _messageRefVerse.get().then((QuerySnapshot snapshot) async {
    queryLength = snapshot.size;

    for (int a = 0; a < queryLength; a++) {
      int y = a + 1;
      String num = y.toString();
      await fbDatabase.quering(num);
    }
  });
}
  Future<void> searchLoad(int id) async{
  Query _messageRefVerse;
  _messageRefVerse = FirebaseFirestore.instance.collection('Songs').where("SongID", isEqualTo: id);
  _messageRefVerse.get().then((QuerySnapshot snapshot) async {
    searchLength = snapshot.size;

    for (int a = 0; a < searchLength; a++) {
      int y = a + 1;
      String num = y.toString();
      await fbDatabase.searching(num);
    }
  });
}
*/
  @override
  Widget buildResults(BuildContext context) {

    // TODO: implement buildResults
   // for (int i = 0; i < fbDatabase.allverses.length; i++) {

     /* if (query.isEmpty) {
        return new Container(child: new Text("No Results Found"),);
      }
      else {
        return new Container(
          padding: new EdgeInsets.all(15.0),
          child: new Column(
            children: <Widget>[
              new Expanded(
                child: new ListView.builder(
                    itemCount: fbDatabase.allSongs.length,
                    itemBuilder: (BuildContext context, int index) {
                      for (int i = 0; i < fbDatabase.allverses.length; i++) {
                        if(fbDatabase.allSongs[index].song_id == fbDatabase.allverses[i].verse_song){
                          if (fbDatabase.allverses[i].Text.replaceAll("\u1d2c", "")
                              .replaceAll("\u1d2e", "").replaceAll("\u1d9c", "").replaceAll("\u1d30", "").replaceAll("\u1d31", "").replaceAll("\u1da0", "")
                              .replaceAll("\u1d33", "").replaceAll("\u1d50", "").replaceAll("\u1d47", "")
                              .replaceAll("\ufe5f", "").replaceAll("\u2087", "").replaceAll("\u209b", "").replaceAll("\u1d64", "").replaceAll("\u2084", "")
                              .replaceAll("\u1d48", "").replaceAll("\u2071", "").replaceAll("/", "\n").contains(query))
                          {
                            return new Card(
                              child: new Container(
                                child: new Center(
                                  child: new Column(
                                    // Stretch the cards in horizontal axis
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      // if(fbDatabase.allSongs[index].song_category == cat_id)
                                      GestureDetector(
                                        onTap: () =>
                                            Navigator.push(
                                              context, MaterialPageRoute(
                                              builder: (_) =>
                                                  SongScreen(songId: fbDatabase.allSongs[index ].song_id, songName: fbDatabase.allSongs[index].song_name, songCategory: fbDatabase.allSongs[index].song_category,),
                                            ),
                                            ),
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10.0, vertical: 5.0),
                                          padding: EdgeInsets.all(5.0),
                                          height: 50.0,
                                          width: 100.0,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey,
                                                offset: Offset(0, 1),
                                                blurRadius: 6.0,
                                              ),
                                            ],
                                          ),
                                          child: Row(
                                            //mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              SizedBox(width: 10.0),
                                              Expanded(
                                                child: new Text(
                                                  // Read the name field value and set it in the Text widget
                                                  fbDatabase.allSongs[index].song_name,
                                                    // set some style to text
                                                    style: new TextStyle(
                                                        fontSize: 17,
                                                        color: Colors.blue[900],
                                                        fontWeight: FontWeight.w600
                                                    ),
                                                    textAlign: TextAlign.center
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //padding: const EdgeInsets.all(15.0),
                                margin: EdgeInsets.all(10.0),
                              ),
                            );
                          }

                        }
                      }
                      return new Container();
                    }
                    ),
              ),
            ],
          ),
        );
        // if(!isQ) {
          // new Container(
            // child: new Column(
              // children: [
                // new Text("Cant find what you searched for, Try again"),
               //],
             //),
           //);
         //}
        }*/
    if(query.isEmpty){
      //searchSet=[];
      //querySet=[];
      return new Container(child: new Text("No Results Found"),);
    }
    else{
      return Search(Q: query);
    }
    return new Container();
}


  @override
  Widget buildSuggestions(BuildContext context) {
   // queryLoad(query);
    //print(fbDatabase.querySet[0].query_id);
    //for(int e=0; e<fbDatabase.querySet.length; e++){
      //searchLoad(fbDatabase.querySet[e].query_id);
    //}
    if(query.isEmpty){
      //searchSet=[];
      //querySet=[];
      return new Container(child: new Text("No Results Found"),);
    }
    else{
      Search(Q: query);
      return new Container(
        padding: new EdgeInsets.all(15.0),
        child: new Column(
          children: <Widget>[
            new Expanded(
              child: new ListView.builder(
                  itemCount: fbDatabase.searchSet.length,
                  itemBuilder: (BuildContext context, int index) {
                    //for (int i = 0; i < fbDatabase.allverses.length; i++) {
                    if(fbDatabase.querySet.isNotEmpty){
                      //if (fbDatabase.allverses[i].Text.replaceAll("\u1d2c", "")
                      //    .replaceAll("\u1d2e", "").replaceAll("\u1d9c", "").replaceAll("\u1d30", "").replaceAll("\u1d31", "").replaceAll("\u1da0", "")
                      //     .replaceAll("\u1d33", "").replaceAll("\u1d50", "").replaceAll("\u1d47", "")
                      //     .replaceAll("\ufe5f", "").replaceAll("\u2087", "").replaceAll("\u209b", "").replaceAll("\u1d64", "").replaceAll("\u2084", "")
                      //      .replaceAll("\u1d48", "").replaceAll("\u2071", "").replaceAll("/", "\n").contains(query))
                      // {
                      return new Card(
                        child: new Container(
                          child: new Center(
                            child: new Column(
                              // Stretch the cards in horizontal axis
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                // if(fbDatabase.allSongs[index].song_category == cat_id)
                                GestureDetector(
                                  onTap: () =>
                                      Navigator.push(
                                        context, MaterialPageRoute(
                                        builder: (_) =>
                                            SongScreen(songId: fbDatabase.searchSet[index].search_id, songName: fbDatabase.searchSet[index].search_name, songCategory: fbDatabase.searchSet[index].search_category,),
                                      ),
                                      ),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                                    padding: EdgeInsets.all(5.0),
                                    height: 50.0,
                                    width: 100.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0, 1),
                                          blurRadius: 6.0,
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      //mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(width: 10.0),
                                        Expanded(
                                          child: new Text(
                                            // Read the name field value and set it in the Text widget
                                              fbDatabase.searchSet[index].search_name,
                                              // set some style to text
                                              style: new TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.blue[900],
                                                  fontWeight: FontWeight.w600
                                              ),
                                              textAlign: TextAlign.center
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //padding: const EdgeInsets.all(15.0),
                          margin: EdgeInsets.all(10.0),
                        ),
                      );
                      // }

                      // }
                    }
                    if(fbDatabase.querySet.isEmpty){
                      return new Text("Cant find what you searched for, Try again");
                    }
                    return new Container(child:new Text("Blank2") ,);
                  }
              ),
            ),
          ],
        ),
      );
    }
    return new Container();
    // TODO: implement buildSuggestions
    /*return new Container(
          padding: new EdgeInsets.all(15.0),
          child: new Column(
            children: <Widget>[
              new Expanded(
                  child: new ListView.builder(
                      itemCount: fbDatabase.allSongs.length,
                      itemBuilder: (BuildContext context, int index) {
                        for (int i = 0; i < fbDatabase.allverses.length; i++)
                          if(fbDatabase.allSongs[index].song_id == fbDatabase.allverses[i].verse_song)
                            if (fbDatabase.allverses[i].Text.contains(query)) {
                              return new Card(
                                child: new Container(
                                  child: new Center(
                                    child: new Column(
                                  // Stretch the cards in horizontal axis
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                    // if(fbDatabase.allSongs[index].song_category == cat_id)
                                        GestureDetector(
                                          onTap: () =>
                                            Navigator.push(
                                              context, MaterialPageRoute(
                                              builder: (_) =>
                                                SongScreen(songId: fbDatabase.allSongs[index ].song_id, songName: fbDatabase.allSongs[index].song_name,  songCategory: fbDatabase.allSongs[index].song_category),
                                            ),
                                          ),
                                          child: Container(
                                            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                                            padding: EdgeInsets.all(5.0),
                                            height: 50.0,
                                            width: 100.0,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  offset: Offset(0, 1),
                                                  blurRadius: 6.0,
                                                ),
                                              ],
                                            ),
                                            child: Row(
                                              //mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                SizedBox(width: 10.0),
                                                Expanded(
                                                  child: new Text(
                                                    // Read the name field value and set it in the Text widget
                                                   fbDatabase.allSongs[index].song_name,
                                                   // set some style to text
                                                   style: new TextStyle(
                                                       fontSize: 17,
                                                       color: Colors.blue[900],
                                                       fontWeight: FontWeight.w600),
                                                      textAlign: TextAlign.center
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //padding: const EdgeInsets.all(15.0),
                                  margin: EdgeInsets.all(10.0),
                                ),
                              );
                            }
                        return new Container();
                      }
                      )
              ),
            ],
          ),
        );*/
   }
}