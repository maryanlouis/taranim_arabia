import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maoso3a_taranim_arabia/categoriesPages.dart';
import 'package:maoso3a_taranim_arabia/display.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:maoso3a_taranim_arabia/data.dart';
import 'package:maoso3a_taranim_arabia/songs_sreen.dart';

import 'SearchScreen.dart';
import 'database.dart' as fbDatabase;
class Search extends StatefulWidget{
  String Q;
  Search({required this.Q});
  @override
  _Search  createState() => _Search (Q: Q);
}

class _Search extends State<Search> {
  String Q;
  _Search ({required this.Q});
  int queryLength=0;
  int searchLength=0;
  List <myquery> qq=[];
  List <mysearch> ss=[];
  Future<void> queryLoad(String num) async{
    await fbDatabase.quering(num);
  }
  Future  queryIt(String q) async {
    Query _messageRefQuery;
    _messageRefQuery = FirebaseFirestore.instance.collection('Verses').where("Text".replaceAll("\u1d2c", "")
        .replaceAll("\u1d2e", "").replaceAll("\u1d9c", "").replaceAll("\u1d30", "").replaceAll("\u1d31", "").replaceAll("\u1da0", "")
        .replaceAll("\u1d33", "").replaceAll("\u1d50", "").replaceAll("\u1d47", "")
        .replaceAll("\ufe5f", "").replaceAll("\u2087", "").replaceAll("\u209b", "").replaceAll("\u1d64", "").replaceAll("\u2084", "")
        .replaceAll("\u1d48", "").replaceAll("\u2071", "").replaceAll("/", "\n"), isGreaterThanOrEqualTo: q);
    _messageRefQuery.get().then((QuerySnapshot snapshot) async {
      queryLength = snapshot.size;

      for (int a = 0; a < queryLength; a++) {
        int y = a + 1;
        String num = y.toString();
        //await queryLoad(num);
        myquery f = new myquery(query_id: snapshot.docs[a]["songId"] as int, query_text: snapshot.docs[a]["Text"] as String);
        qq.add(f);
      }
    });
  }
  Future<void> searchLoad(String num) async{
    await fbDatabase.searching(num);
  }
  Future <void> searchIt(int id) async {
    Query _messageRefSearch;
    _messageRefSearch = FirebaseFirestore.instance.collection('Songs').where("SongID", isEqualTo: id);
    _messageRefSearch.get().then((QuerySnapshot snapshot)  async {
      searchLength = snapshot.size;

      for (int a = 0; a < searchLength; a++) {
        int y = a + 1;
        String num = y.toString();
       //await searchLoad(num);
        mysearch t = new mysearch(
            search_category: snapshot.docs[a]['CategoryId'] as int,
            search_id: snapshot.docs[a]["SongID"] as int,
          search_name: snapshot.docs[a]['SongName'] as String
        );
        ss.add(t);
      }
    });
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    queryIt(Q);
    //print(fbDatabase.querySet[0]);
    for(int e=0; e<fbDatabase.querySet.length; e++){
      searchIt(qq[e].query_id);
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('موسوعة ترانيم عربية',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.5), textAlign: TextAlign.right),
        ),
      body: Q=="" || qq.isEmpty? new Container(child: new Text("no results"),) :
      new Container(
        padding: new EdgeInsets.all(15.0),
        child: new Column(
          children: <Widget>[
            new Expanded(
              child: new ListView.builder(
                  itemCount: ss.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (ss.isNotEmpty) {
                      return new Card(
                        child: new Container(
                          child: new Center(
                            child: new Column(
                              // Stretch the cards in horizontal axis
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                // if(fbDatabase.allSongs[index].song_category == cat_id)
                                GestureDetector(
                                 // onTap: () =>
                                      //Navigator.push(
                                       // context, MaterialPageRoute(
                                       // builder: (_) => SongScreen(songId: fbDatabase.searchSet[index].search_id, songName: fbDatabase.searchSet[index].search_name, songCategory: fbDatabase.searchSet[index].search_category,),),
                                     // ),
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
                                            ss[index].search_name,
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
                    else if(ss.isEmpty) {
                      return new Container(
                          child: new Text("Cant find any thing"));
                    }
                    return new Container( child: new Text('!!!!!!'),);
                  }
                  ),
            ),
          ],
        ),
      )
    );
  }
}