import 'dart:async' show Future;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maoso3a_taranim_arabia/aftersplash.dart';
import 'package:maoso3a_taranim_arabia/songs_sreen.dart';

//import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'database.dart' as fbDatabase;

//import 'list.dart';

class Display extends StatefulWidget {
  final bool connection;
  Display({required this.connection});
  /*final FirebaseApp app;
  final FirebaseDatabase database;*/
  @override
  _Display createState() => _Display(connection: connection);

}


class _Display extends State<Display>  {
  final bool connection;
  _Display({required this.connection});

  /*final FirebaseApp app;
  final FirebaseDatabase database;*/
  String _username = "";
  /*List vediosId = new List();
  List vediosDescription = new List();
  List vediosTitle = new List();
  List vediosLinksTitle = new List();
  List vediosLinks =new List();*/
 // Data data = new Data(letters: [], categories: [], songs: [], jsondata: []);
 // DataJson alljsonData = DataJson(jsondata: []);
  bool _loaded = false;
  /*Future<String> _loadJsonDataAsset() async {
    return await rootBundle.loadString('assets/taranim_ro7eya.json');
  }


  Future loadData() async {
    setState(() {
      _loading = true;
    });
    String jsonPage = await _loadJsonDataAsset();
    final jsonResponse = json.decode(jsonPage);
    setState(() {
      alljsonData = DataJson.fromJson(jsonResponse);
    });

    print(alljsonData.jsondata[0].name);
    //setState(() {
      //final jsondata = new JsonData.fromJson(jsonResponse);
    //});
    // print(data.vedios[1].vedio_id);
    setState(() {
      _loading = false;
    });
  }*/

  /*Future<void> _insertSongs(int id,String i, String name, String text, int l) async {
    //List vediosList = new List();
    setState(() {
      _loading = true;
    });
    //for(int i; i<2; i++) {
    //int x = i+1;
    //String num = x as String;
    print("hello");
    await fbDatabase.insertSongs(id,i, name, text, l);

    // }
    setState(() {
      _loading = false;

    });
    //return vediosList;
  }*/
 /* Future <void> insertjsonsongs() async {
    await loadData();
    print(alljsonData.jsondata[0].text);
    for(int i=0; i < alljsonData.jsondata.length; i++ ){
      // print("test "+'${i}');
      int x = i+4;
      String n = x.toString();
      await _insertSongs(x,n, alljsonData.jsondata[i].name, alljsonData.jsondata[i].text, alljsonData.jsondata[i].letterid);
      }
  }*/

  //late fbDatabase.NotesDatabase noteDatabase ;

  // Future<void> insertingSong (int s)async {
  //   print("song length is: + ${fbDatabase.allSongs.length}");
  //   for(int i=s; i< fbDatabase.allSongs.length; i++){
  //     //_insertCat(db,fbDatabase.allCategories[i].category_id, fbDatabase.allCategories[i].category_name);
  //     await fbDatabase.NotesDatabase.ins.insertSong(fbDatabase.allSongs[i].song_id, fbDatabase.allSongs[i].song_name, fbDatabase.allSongs[i].song_category);
  //     print('Inserting songs');
  //   }
  // }
  // Future<void> insertingVerse ( int v)async {
  //   print("verse length is: + ${fbDatabase.allverses.length}");
  //   for(int i=v; i< fbDatabase.allverses.length; i++){
  //     if(fbDatabase.allverses[i].verseUpdate  == fbDatabase.sqlsyncList) {
  //       //_insertCat(db,fbDatabase.allCategories[i].category_id, fbDatabase.allCategories[i].category_name);
  //       await fbDatabase.NotesDatabase.ins.insertVerse(
  //           fbDatabase.allverses[i].verse_id,
  //           fbDatabase.allverses[i].verse_song, fbDatabase.allverses[i].order,
  //           fbDatabase.allverses[i].isMain, fbDatabase.allverses[i].Text, fbDatabase.allverses[i].isdel);
  //       print('Inserting verses');
  //     }
  //   }
  // }
  // Future <void> updatingSong ()async {
  //   for(int i=0; i< fbDatabase.allSongs.length; i++){
  //     await fbDatabase.NotesDatabase.ins.updateSong(fbDatabase.allSongs[i].song_id,
  //         fbDatabase.allSongs[i].song_category, fbDatabase.allSongs[i].song_name,);
  //   }
  // }

  // Future <void> updatingVerse ()async {
  //   for(int i=0; i< fbDatabase.allverses.length; i++){
  //     await fbDatabase.NotesDatabase.ins.updateVerse(fbDatabase.allverses[i].verse_id,
  //         fbDatabase.allverses[i].verse_song, fbDatabase.allverses[i].order,
  //         fbDatabase.allverses[i].isMain, fbDatabase.allverses[i].Text, fbDatabase.allverses[i].isdel);
  //   }
  // }
  //
  // Future <void> deleteingSongs (int sid)async {
  //   //for(int i=0; i< fbDatabase.allverses.length; i++){
  //   //if(fbDatabase.allverses[i].verse_id != vid) {
  //   await fbDatabase.NotesDatabase.ins.deletetSong(sid);
  //   //}
  //   //}
  // }
  //
  // Future <void> deleteingVerses (int vid)async {
  //   //for(int i=0; i< fbDatabase.allverses.length; i++){
  //     //if(fbDatabase.allverses[i].verse_id != vid) {
  //       await fbDatabase.NotesDatabase.ins.deletetVerse(vid);
  //     //}
  //   //}
  // }
  late int verseLength;
  late int songsLength;

  Future<void> _loadSongs(String i) async {
    //List vediosList = new List();
    // setState(() {
    //   _loading = true;
    // });
    //for(int i; i<2; i++) {
    //int x = i+1;
    //String num = x as String;
    await fbDatabase.findSongs(i);
    // }
    // setState(() {
    //   _loading = false;
    // });
    //return vediosList;
  }

  Future<void> _loadVerses(String i) async {
    //List vediosList = new List();
    // setState(() {
    //   _loading = true;
    // });
    //for(int i; i<2; i++) {
    //int x = i+1;
    //String num = x as String;
    await fbDatabase.findVerses(i);
    // }
    // setState(() {
    //   _loading = false;
    // });
    //return vediosList;
  }
  //int sCount=0;
  //int vCount=0;
  bool Songisexist = false;
  bool Verseisexist = false;

  Future <void> actions()async {

      // final Database db = await fbDatabase.NotesDatabase.ins.initializeDB();
      // //await db.execute('''SELECT * "Categories"''');
      // final List<Map<String, Object?>> queryResult = await db.query('Songs');
      // sqlSong= queryResult.map((e) => sqlSongs.fromMap(e)).toList();
      await fbDatabase.NotesDatabase.ins.querySongs();
      // for(int d=0 ; d < fbDatabase.sqlSongList.length; d++){
      //   print("the song ID is: ${fbDatabase.sqlSongList[d].song_name}");
      //   //setState(() {
      //     //sCount++;
      //   //});
      // }
      print('song count: ${fbDatabase.allSongs.length}');
      print('counting var = ${fbDatabase.sqlSongList.length}');
      for(int a=0; a< fbDatabase.allSongs.length; a++) {
        if (DateTime.parse(fbDatabase.sqlsyncList[fbDatabase.sqlsyncList.length - 1].sync_date).isBefore(fbDatabase.allSongs[a].SongUpdate.toDate().toLocal())) {
          print('scount var = ${fbDatabase.sqlSongList.length}');
          //_insertCat(db,fbDatabase.allCategories[i].category_id, fbDatabase.allCategories[i].category_name);
          for(int i =0; i< fbDatabase.sqlSongList.length; i++){
            if(fbDatabase.allSongs[a].song_id == fbDatabase.sqlSongList[i].song_id){
              setState(() {
                Songisexist = true;
              });

              print('id sexist $Songisexist');
            }
          }
          if(Songisexist == true){
            await fbDatabase.NotesDatabase.ins.updateSong(fbDatabase.allSongs[a].song_id,
                fbDatabase.allSongs[a].song_category, fbDatabase.allSongs[a].song_name,
                fbDatabase.allSongs[a].isdeleted);
          }
          if(Songisexist == false) {
            print('sid exist $Songisexist');
            await fbDatabase.NotesDatabase.ins.insertSong(
                fbDatabase.allSongs[a].song_id,
                fbDatabase.allSongs[a].song_name,
                fbDatabase.allSongs[a].song_category,
                fbDatabase.allSongs[a].isdeleted);
            print('Inserting songs');
          }
          //fbDatabase.sqlVerseList =[];
          await fbDatabase.NotesDatabase.ins.querySongs();
          //await queringVerses();
        }

        // else if (vCount == fbDatabase.allverses.length) {
        //   await updatingVerse();
        //   //fbDatabase.sqlVerseList =[];
        //   await fbDatabase.NotesDatabase.ins.queryVerses();
        //   //await queringVerses();
        // }
        //
        // else {
        //   print('No new verses to enter');
        // }
      }
   // });


      // final Database db = await fbDatabase.NotesDatabase.ins.initializeDB();
      // final List<Map<String, Object?>> queryVerseResult = await db.query('Verses');
      // sqlVerse= queryVerseResult.map((e) => sqlVerses.fromMap(e)).toList();
      await fbDatabase.NotesDatabase.ins.queryVerses();
      // for(int d=0 ; d < fbDatabase.sqlVerseList.length; d++){
      //   print("the verse ID is: ${fbDatabase.sqlVerseList[d].isMain}");
      //   // setState(() {
      //   //   vCount++;
      //   // });
      // }

      print('verse count: ${fbDatabase.allverses.length}');
      print('counting verse: ${fbDatabase.sqlVerseList.length}');
      for(int a=0; a< fbDatabase.allverses.length; a++) {
        if (DateTime.parse(fbDatabase.sqlsyncList[fbDatabase.sqlsyncList.length - 1].sync_date).isBefore(fbDatabase.allverses[a].verseUpdate.toDate().toLocal())) {
          print('vcount var = ${fbDatabase.sqlVerseList.length}');
            //_insertCat(db,fbDatabase.allCategories[i].category_id, fbDatabase.allCategories[i].category_name);
          for(int i =0; i< fbDatabase.sqlVerseList.length; i++){
            if(fbDatabase.allverses[a].verse_id == fbDatabase.sqlVerseList[i].verse_id){
              setState(() {
                Verseisexist = true;
              });

              print('id vexist $Verseisexist');
            }
          }
          if(Verseisexist == true){
            await fbDatabase.NotesDatabase.ins.updateVerse(fbDatabase.allverses[a].verse_id,
                fbDatabase.allverses[a].verse_song, fbDatabase.allverses[a].order,
                fbDatabase.allverses[a].isMain, fbDatabase.allverses[a].Text, fbDatabase.allverses[a].isdel);
          }
          if(Verseisexist == false) {
            print('vid exist $Verseisexist');
            await fbDatabase.NotesDatabase.ins.insertVerse(
                fbDatabase.allverses[a].verse_id,
                fbDatabase.allverses[a].verse_song,
                fbDatabase.allverses[a].order,
                fbDatabase.allverses[a].isMain, fbDatabase.allverses[a].Text,
                fbDatabase.allverses[a].isdel);
            print('Inserting verses');
          }
          //fbDatabase.sqlVerseList =[];
          await fbDatabase.NotesDatabase.ins.queryVerses();
          //await queringVerses();
        }

        // else if (vCount == fbDatabase.allverses.length) {
        //   await updatingVerse();
        //   //fbDatabase.sqlVerseList =[];
        //   await fbDatabase.NotesDatabase.ins.queryVerses();
        //   //await queringVerses();
        // }
        //
        // else {
        //   print('No new verses to enter');
        // }
      }
      if(fbDatabase.sqlsyncList.length != 0 && connection == true){
        DateTime def = DateTime.now().toLocal();
        print('datetime is: $def');

        await fbDatabase.NotesDatabase.ins.insertSync(def.toString());
        await fbDatabase.NotesDatabase.ins.querySync();
      }

    // if(mounted){
    //   setState(() { });
    // }
  }
  Future <void> loadingFirebase()async {
    if(connection == true) {
      Query _messageSongRef;
      _messageSongRef = FirebaseFirestore.instance.collection('Songs');
      await _messageSongRef.get().then((QuerySnapshot snapshot) async {
        //setState(() {
        songsLength = snapshot.size;
        //});
        for (int index = 0; index < songsLength; index++) {
          int x = index + 1;
          String n = x.toString();
          await _loadSongs(n);
        }
      });

      Query _messageRefVerse;
      _messageRefVerse = FirebaseFirestore.instance.collection('Verses');
      await _messageRefVerse.get().then((QuerySnapshot snapshot) async {
        //setState(() {
        verseLength = snapshot.size;
        //});
        for (int a = 0; a < verseLength; a++) {
          int y = a + 1;
          String num = y.toString();
          await _loadVerses(num);
        }
      });
    }
  }
  Future <void> loadData()async {
    loadingFirebase().whenComplete((){
      actions().whenComplete(() {
    //if(mounted) {
      setState(() {
        _loaded = true;
      });
   // }
     });
    });
  }
  // Future <void> refreshData()async {
  //   await loadingFirebase();
  //    await actions();
  // }

  // Future <void> load() async {
  //    AfterSplash d = new AfterSplash(connection: connection);
  //    d.createState().refreshData();
  //   refreshData();
  // }

  @override
  void initState() {
    super.initState();
    //Set messinsert;
    //messinsert = FirebaseFirestore.instance.collection('Songs').doc();
    //messinsert.add(value)
  //  loadData();
    //insertjsonsongs();
    loadData();
    //deleteingVerses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loaded == false ?Center(child: CircularProgressIndicator(color: Colors.purple[900],),):
          // RefreshIndicator(
          //   onRefresh: load,
          //   color: Colors.purple[900],
          //   child:
            Scrollbar(isAlwaysShown: true,
              child:new Container(
                padding: new EdgeInsets.all(15.0),
                child: new Column(
                  children: <Widget>[
                    Padding( padding: new EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child:new Align(
                        //padding:new EdgeInsets.fromLTRB(15, 15, 15, 15),
                        child: new Text('أحدث الترانيم:', textAlign: TextAlign.right, style: TextStyle(fontSize: 20),),
                        alignment: Alignment.centerRight,
                      ) ,
                    ),
                    new Expanded(
                      child: new ListView.builder(
                        itemCount: fbDatabase.sqlSongList.length,
                        itemBuilder: (BuildContext context, int index) {
                          if(fbDatabase.sqlSongList[index].Songisdel == 0) {
                            if(fbDatabase.sqlSongList.length - 9 <= fbDatabase.sqlSongList[index].song_id && fbDatabase.sqlSongList[index].song_id <= fbDatabase.sqlSongList.length) {
                              return
                                new Card(
                                  child: new Container(
                                    child: new Center(
                                      child: new Column(
                                        // Stretch the cards in horizontal axis
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: <Widget>[
                                          //if(fbDatabase.sqlSongList[index].Songisdel == 0)...[
                                          GestureDetector(
                                            onTap: () =>
                                                Navigator.push(
                                                  context, MaterialPageRoute(
                                                  builder: (_) =>
                                                    SongScreen(songId: fbDatabase
                                                        .sqlSongList[index].song_id,
                                                        songName: fbDatabase
                                                            .sqlSongList[index]
                                                            .song_name,
                                                        songCategory: fbDatabase
                                                            .sqlSongList[index]
                                                            .song_category),
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
                                                      '${fbDatabase
                                                          .sqlSongList[index]
                                                          .song_name}',
                                                      // set some style to text
                                                      style: new TextStyle(
                                                          fontSize: 17,
                                                          color: Colors.purple[900],
                                                          fontWeight: FontWeight
                                                              .w600),
                                                      textAlign: TextAlign.center
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        // ]
                                      ],
                                    ),
                                  ),
                                  //padding: const EdgeInsets.all(15.0),
                                  margin: EdgeInsets.all(10.0),
                                ),
                              );
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
         // )
    );
  }
}
