import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maoso3a_taranim_arabia/SearchScreen.dart';
import 'package:maoso3a_taranim_arabia/songs_sreen.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:maoso3a_taranim_arabia/searchResults.dart';
//import 'package:nathra_ama/key.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:maoso3a_taranim_arabia/data.dart';
//import 'list.dart';
import 'aftersplash.dart';
import 'database.dart' as fbDatabase;

import 'package:firebase_core/firebase_core.dart';

import 'display.dart';
//import 'package:firebase_database/firebase_database.dart';

class CatPage  extends StatefulWidget {
  CatPage({required this.cat_id, required this.cat_name, required this.connect});
  final int cat_id;
  final String cat_name;
  final bool connect;
  /*final FirebaseApp app;
  final FirebaseDatabase database;*/
  @override
  _CatPage  createState() => _CatPage (cat_id: cat_id, cat_title: cat_name, connect: connect);

}

class _CatPage extends State<CatPage>  {
  _CatPage({required this.cat_id, required this.cat_title, required this.connect});
  final int cat_id;
  final String cat_title;
  final bool connect;
  String _username = "";

  bool _loading = false;
  String searchtext = "";

  // Future <void> load()async {
  //   AfterSplash afterSplash = new AfterSplash(connection: connect);
  //   afterSplash.createState().refreshData();
  //   afterSplash.createState().build(context);
  //   Display d = new Display(connection: connect);
  //   d.createState().refreshData();
  //   setState(() { });
  // }

  @override
  Widget build(BuildContext context) {
    // return new RefreshIndicator(
    //   color: Colors.purple[900],
    //   onRefresh: load,
    //   child:
     return Scaffold(
       appBar: AppBar(
         title: Text('${cat_title}' , style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.5), textAlign: TextAlign.right,),
         actions: <Widget>[
            IconButton(icon: Icon(Icons.search),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => SearchScreen()))),
          ],
        backgroundColor: Colors.purple[900],
      ),
        body: _loading?Center(child: CircularProgressIndicator(color: Colors.purple[900]),):

        Scrollbar(
          isAlwaysShown: true,
          child:new Container(
            padding: new EdgeInsets.all(15.0),
            child: new Column(
              children: <Widget>[
                new Expanded(
                  child: new ListView.builder(
                    itemCount: fbDatabase.sqlSongList.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (fbDatabase.sqlSongList[index].song_category != cat_id) {
                        return new Container();
                      }
                      else {
                        if(fbDatabase.sqlSongList[index].song_category == cat_id) {
                          if (fbDatabase.sqlSongList[index].Songisdel == 0) {
                            return new Card(
                              child: new Container(
                                child: new Center(
                                  child: new Column(
                                    // Stretch the cards in horizontal axis
                                    crossAxisAlignment:
                                    CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: () =>
                                            Navigator.push(
                                              context, MaterialPageRoute(
                                              builder: (_) =>
                                                  SongScreen(songId: fbDatabase
                                                      .sqlSongList[index ]
                                                      .song_id,
                                                    songName: fbDatabase
                                                        .sqlSongList[index]
                                                        .song_name,
                                                    songCategory: fbDatabase
                                                        .sqlSongList[index]
                                                        .song_category,),
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
                                                    fbDatabase
                                                        .sqlSongList[index]
                                                        .song_name,
                                                    // set some style to text
                                                    style: new TextStyle(
                                                        fontSize: 17,
                                                        color: Colors
                                                            .purple[900],
                                                        fontWeight: FontWeight
                                                            .w600),
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
                      return Container();
                    },
                  ),
              ),
            ],
          ),
        ),
      ),
   //  ),
    );
  }

  @override
  void initState()  {
    super.initState();
    //loadData();
    // fetchvedio();

    // _initPdf();
    //_signIn();
    /*for (int index = 0; index < 2; index++) {
      int x = index+1;
      String n = x.toString();
      _loadVedios(n);
      _loadVedioLinks(n);
    }*/
  }


/*
  Widget pdf() {
    return Scaffold(
        appBar: AppBar(

    ),
    body:_loading ? Center(child: CircularProgressIndicator(),) : PDFViewer(document: _doc,
      indicatorBackground: Colors.red,
      // showIndicator: false,
      // showPicker: false,
    ),

    );}
*/
/*Widget video(){
  return Scaffold(
    appBar: AppBar(

    ),
    body:YoutubePlayer(
    controller: _controller,
    liveUIColor: Colors.amber,
  //bottomActions: [
  //CurrentPosition(),
  //ProgressBar(isExpanded: true),
  //],
  showVideoProgressIndicator: true,
  progressColors:ProgressBarColors(
  playedColor: Colors.amber,
  handleColor: Colors.amberAccent,
  ),
  ),);
}*/
}
