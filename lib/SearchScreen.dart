import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:maoso3a_taranim_arabia/data.dart';
import 'package:maoso3a_taranim_arabia/query.dart';

//import 'package:maoso3a_taranim_arabia/database.dart' as fbDatabase;
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:maoso3a_taranim_arabia/searchB.dart';
import 'package:maoso3a_taranim_arabia/songs_sreen.dart';

class SearchScreen extends StatefulWidget {
  _SearchScreen createState() => _SearchScreen();
}

class _SearchScreen extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();

  //late QuerySnapshot _querySnapshot;
  //late QuerySnapshot _songSnapshot;
  late List<mysearch> sqlSearchList;
  bool isExecuted = false;
  String q = "";

  @override
  Widget build(BuildContext context) {
    Widget searchedData() {
      if (sqlSearchList.isEmpty) {
        return new Container(
          child: Center(
            child: Text(
              'لا يوجد ترنيمة بهذا الاسم، حاول مرة أخرى',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        );
      } else {
        return ListView.builder(
          itemCount: sqlSearchList.length,
          itemBuilder: (BuildContext context, int counter) {
            return new Card(
              child: new Container(
                child: new Center(
                  child: new Column(
                    // Stretch the cards in horizontal axis
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SongScreen(
                              songId: sqlSearchList[counter].search_id,
                              songName: sqlSearchList[counter].search_name,
                              songCategory:
                                  sqlSearchList[counter].search_category,
                            ),
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
                                    sqlSearchList[counter].search_name,
                                    // set some style to text
                                    style: new TextStyle(
                                        fontSize: 17,
                                        color: Colors.blue[900],
                                        fontWeight: FontWeight.w600),
                                    textAlign: TextAlign.center),
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
          },
        );
      }
    }

    int col = 0;
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('موسوعة ترانيم عربية',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.5),
              textAlign: TextAlign.right),
          actions: <Widget>[
            //IconButton(icon: Icon(Icons.search),
            //   onPressed: () => Navigator.of(context)
            //.push(MaterialPageRoute(builder: (_) => SearchScreen()))),
          ],
          backgroundColor: Colors.purple[900],
        ),
        body:
            //isExecuted?searchedData():new Container(child: Center(child: Text('Search any thing'),),)
            Scrollbar(
          child: new Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Container(
                    child: GetBuilder<DataController>(
                        init: DataController(),
                        builder: (v) {
                          return new TextField(
                            onChanged: (text) async {
                              setState(() {
                              // q = text;
                                sqlSearchList = [];
                              });
                              await v.searchSongs(searchController.text).then((value) {
                                sqlSearchList = value;
                                sqlSearchList.sort((a,b) => a.search_name.compareTo(b.search_name));
                               setState(() {
                                 isExecuted = true;
                               });
                              });
                              //for (int x = 0; x < _querySnapshot.docs.length; x++) {
                              //mysearch f = new mysearch(
                              //  search_name: _querySnapshot.docs[x]["SongName"],
                              //search_category: _querySnapshot.docs[x]["CategoryId"],
                              // search_id: _querySnapshot.docs[x]["SongID"]);
                              //qu.add(f);
                              //}
                              // Navigator.of(context).push(MaterialPageRoute(builder: (_) => Search(Q: q)));
                            },
                            onTap: () {
                              setState(() {
                                col = 0x61000000;
                              });
                            },
                            decoration: InputDecoration(
                                enabledBorder: new OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: Colors.black38)),
                                focusedBorder: new OutlineInputBorder(
                                    borderSide: new BorderSide(color: Colors.black38)),
                                border: new OutlineInputBorder(borderSide: new BorderSide(color: Colors.black38)),
                                hintText: 'أدخل اسم الترنيمة',
                                prefixIcon: IconButton(
                                    onPressed: () async {
                                      setState(() {
                                        sqlSearchList = [];
                                      });
                                      //Navigator.of(context).push(MaterialPageRoute(builder: (_) => Search(Q: q)));
                                      await v.searchSongs(searchController.text).then((value) {
                                        sqlSearchList = value;
                                        sqlSearchList.sort((a,b) => a.search_name.compareTo(b.search_name));
                                        print('text');
                                        setState(() {
                                          isExecuted = true;
                                        });
                                      });
                                      for (int x = 0; x < sqlSearchList.length; x++) {
                                        //mysearch f = new mysearch(
                                        //  search_name: _querySnapshot.docs[x]["SongName"],
                                        //search_category: _querySnapshot.docs[x]["CategoryId"],
                                        //search_id: _querySnapshot.docs[x]["SongID"]
                                        //);
                                        //qu.add(f);
                                        print(sqlSearchList[x].search_name);
                                      }
                                    },
                                    icon: Icon(Icons.search),
                                    color: Color(0x61000000)),
                                suffixIcon: IconButton(
                                  color: Color(0x61000000),
                                  icon: Icon(Icons.clear),
                                  onPressed: () {
                                    searchController.clear();
                                    setState(() {
                                      sqlSearchList = [];
                                    });
                                  },
                                )),
                            controller: searchController,
                          );
                        }),
                  ),
                ),
                /*Expanded(
              child: StreamBuilder <QuerySnapshot>(
                stream: q== null? FirebaseFirestore.instance.collection('Verses').snapshots()
                    :FirebaseFirestore.instance.collection('Verses').where("Text".replaceAll("\u1d2c", "")
                    .replaceAll("\u1d2e", "").replaceAll("\u1d9c", "").replaceAll("\u1d30", "").replaceAll("\u1d31", "").replaceAll("\u1da0", "")
                    .replaceAll("\u1d33", "").replaceAll("\u1d50", "").replaceAll("\u1d47", "")
                    .replaceAll("\ufe5f", "").replaceAll("\u2087", "").replaceAll("\u209b", "").replaceAll("\u1d64", "").replaceAll("\u2084", "")
                    .replaceAll("\u1d48", "").replaceAll("\u2071", "").replaceAll("/", "\n"), arrayContains: q).snapshots(),
                builder: (BuildContext context, snapshot) {
                  if(snapshot.hasError){
                    return new Container(child: Center(child:Text('Sorry we have an error ${snapshot.hasError}')));
                  }

                  if (!snapshot.hasData){
                   return new Container(child: Center(child: Text('No data found'),),);
                  }
                  return Container();
                },

              ),
            )*/
                isExecuted
                    ? Expanded(child: searchedData())
                    : new Container(
                        child: Center(
                          child: Text('أبحث عن اسم الترنيمة',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                        ),
                      )
              ],
            ),
          ),
        ));
  }
}
