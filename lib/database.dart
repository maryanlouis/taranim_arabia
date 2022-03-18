import 'dart:async';
import 'dart:core';
import 'dart:core';
//import 'dart:html';
import 'dart:io';
//import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maoso3a_taranim_arabia/data.dart';
import 'package:maoso3a_taranim_arabia/display.dart' as dis;
import 'package:maoso3a_taranim_arabia/searchResults.dart';
//import 'package:tekartik_app_flutter_sqflite/sqflite.dart';
//import 'package:tekartik_common_utils/common_utils_import.dart';
import 'package:sqflite_common/sqflite_dev.dart';
import 'package:sqflite_common/sql.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common/utils/utils.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:get/get.dart';
//import 'package:tekartik_common_utils/common_utils_import.dart';
late FirebaseException error;

//myvedios myVedios = new myvedios();
List<mysongs> allSongs = [];
List<mycategories> allCategories= [];
List<myverses> allverses= [];
//List <JsonData> jsonData=[];
List <mysearch> searchSet=[];
List <myquery> querySet=[];
List <sqlCategories> sqlCatList=[];
List <sqlSongs> sqlSongList=[];
List <sqlVerses> sqlVerseList=[];
List <sqlSync> sqlsyncList=[];
Data alldata = new Data(verses: [], categories: [], songs: [], search: [], query: []);
//DataJson allJsonData = new DataJson(jsondata: []);
//List NameJson = [];
/*Future<void> insertSongs(int id,String num, String name, String text,int n) async {

  //DatabaseReference messinsert;
  //messinsert = ;
  //for(int a =0;a<alldata.jsondata.length; a++ ) {
    //if (alldata.jsondata[a].text.contains(alldata.jsondata[a].name)) {
      //  NameJson.add(alldata.jsondata[a].name);
    //}
  //}
  //int n =0;

  //for(int x=0; x<dis.alljsonData.jsondata.length; x++) {
    //for(int y=0; y< allLetters.length; y++)
      //{
        //if(name.startsWith(allLetters[y].letter_name)) {
          //n = allLetters[y].letter_id;
          //DocumentReference coll;
  //int x = num as int;
          Map<String, dynamic> addData ={
            "CategoryId": 1 as int,
            "LetterId": n as int,
            "SongID": id as int,
            "SongName": '${name}' as String,
            "Text": '${text}' as String
          };
          await FirebaseFirestore.instance.collection("Songs").doc("Song${num}").set
            (addData);

 //       }
      //}
     // }

}*/

Future<void> findSongs(String num) async {
  //final Firestore firestore = Firestore(app: app);
  //await FirebaseFirestore.instance.settings.persistenceEnabled;

  DocumentReference _messageRef;
  _messageRef = FirebaseFirestore.instance.collection('Songs').doc('Song${num}');
  await _messageRef.get().then((DocumentSnapshot snapshot) {

         mysongs e =  new mysongs(
             song_category: snapshot ['CategoryId'] as int,
             song_id: snapshot ['SongID'] as int,
             SongUpdate: snapshot ['UpdateSong'] as Timestamp,
             song_name: snapshot ['SongName'] as String,
             isdeleted: snapshot ['isdeleted'] as bool
         );
         //e.song_text.replaceAll("_b", "\n");
         allSongs.add(e);
         allSongs.sort((a, b) => a.song_name.compareTo(b.song_name));

    });

}

Future<void> findCategories(String num) async {

  DocumentReference _messageRef;
  _messageRef = FirebaseFirestore.instance.collection('Categories').doc("Age${num}") ;
  await _messageRef.get().then((DocumentSnapshot snapshot) {
   // print('tdtdtd');
      mycategories d = new mycategories(
        category_id: snapshot ["AgeID"] as int,
        category_name: snapshot ["AgeName"] as String,
        CatUpdate: snapshot ["UpdateOn"] as Timestamp,
        isdeleted: snapshot ["isDeleted"] as bool
      );
      allCategories.add(d);
      allCategories.sort((a,b) => a.category_id.compareTo(b.category_id));
    });
   //print(allCategories.length);
}

Future<void> findVerses(String num) async {
  DocumentReference _messageRef;
  _messageRef = FirebaseFirestore.instance.collection('Verses').doc("verse${num}") ;
  await _messageRef.get().then((DocumentSnapshot snapshot) {
    myverses d = new myverses(
      verse_id: snapshot ["verseID"] as int,
      verse_song: snapshot ["songId"] as int,
      order: snapshot ["order"] as int,
      isMain: snapshot ["IsMain"] as bool,
      Text: snapshot ["Text"] as String,
      verseUpdate: snapshot["UpdateVerse"] as Timestamp,
      isdel: snapshot["isdeleted"] as bool
    );
    allverses.add(d);
    allverses.sort((a,b) => a.order.compareTo(b.order));

  });

}

Future<void> searching(String num) async {

  DocumentReference  _search;
  _search = FirebaseFirestore.instance.collection('Songs').doc('Song${num}') ;
  _search.get().then((DocumentSnapshot snap) async{
    mysearch s = new mysearch(
        search_name:snap ["SongName"] as String,
        search_id: snap ["SongID"] as int,
        search_category: snap ['CategoryId'] as int);
    searchSet.add(s);
    searchSet.sort((a, b) => a.search_name.compareTo(b.search_name));
  });

}
Future<void> quering(String num) async{
  DocumentReference _messageRef;
  _messageRef = FirebaseFirestore.instance.collection('Verses').doc("verse${num}") ;

  await _messageRef.get().then((DocumentSnapshot snapshot) {

    myquery d = new myquery(

        query_id: snapshot ["songId"] as int,
      query_text: snapshot ["Text"] as String
    );
    querySet.add(d);
    querySet.sort((a,b) => a.query_id.compareTo(b.query_id));

  });
}

//const String dbName = 'TaranimAr.db';
//const int kVersion1 = 1;

class NotesDatabase{
  //final DatabaseFactory dbFactory;
  //NotesDatabase(this.dbFactory);
  NotesDatabase._init();
  static final NotesDatabase ins = NotesDatabase._init();
  Database? _database;
  //final lock = Lock(reentrant: true);

  Future<Database> get database async {
  //=> _database ??= await lock.synchronized(() async {
    if(_database != null){
      return _database!;
    }
    _database = await initializeDB();
    return _database!;
  }


  Future <Database> initializeDB () async {
    String dbpath = await getDatabasesPath();
    String path = join(dbpath,'TaranimArabicAll.db');
     print("the path is: "+path);
     return await openDatabase(path,
         version: 1,
         onCreate: (db, version) async {
            await creating(db);
            },
         onUpgrade: (db, oldVersion, newVersion) async {
            if (oldVersion < 1) {
              await creating(db);
            }
        });
  }

  // Future open() async {
  //   await initializeDB(await fixPath(dbName));
  // }
  //
  // Future<String> fixPath(String path) async => path;
  Future <void> creating(Database db) async {
  //final Database db = await ins.database;
    await db.execute('''CREATE TABLE IF NOT EXISTS Categories ( AgeID INTEGER CONSTRAINT Pk_Category PRIMARY KEY ASC ON CONFLICT ROLLBACK NOT NULL, AgeName VARCHAR NOT NULL, isdeleted BOOLEAN NOT NULL)''');
    await db.execute('''CREATE TABLE IF NOT EXISTS Songs (SongID INTEGER CONSTRAINT Pk_Songs PRIMARY KEY ASC ON CONFLICT ROLLBACK NOT NULL, CategoryId INTEGER CONSTRAINT Fk_Songs_Categories REFERENCES Categories (AgeID) NOT NULL, SongName VARCHAR NOT NULL, isdeleted BOOLEAN NOT NULL)''');
    await db.execute('''CREATE TABLE IF NOT EXISTS Verses (verseID INTEGER CONSTRAINT Pk_Verses PRIMARY KEY ASC ON CONFLICT ROLLBACK NOT NULL, songId CONSTRAINT Fk_Verses_Songs REFERENCES Songs (SongID) NOT NULL, [order] INTEGER NOT NULL, IsMain  BOOLEAN NOT NULL,Text VARCHAR NOT NULL,isdeleted BOOLEAN NOT NULL)''');
    await db.execute('''CREATE TABLE Syncing (sync_id  INTEGER CONSTRAINT Pk_Sync PRIMARY KEY ASC ON CONFLICT ROLLBACK AUTOINCREMENT NOT NULL, lastSync DATETIME NOT NULL DEFAULT (datetime('1999-01-01 12:00:00') ))''');
  }
  insertCat (int id, String ageName, bool isdel) async {
    final Database db = await ins.database;
    await db.execute('''INSERT INTO Categories ("AgeID", "AgeName", "isdeleted") VALUES (? , ?, ?)''', [id, ageName, isdel]);
  }

  insertSong (int id, String songName, int catId, bool isdel) async {
    final Database db = await ins.database;
    await db.execute('''INSERT INTO Songs ("SongID", "CategoryId", "SongName", "isdeleted") VALUES (? , ?, ?, ?)''', [id, catId, songName, isdel]);
  }

  insertVerse (int id, int songId, int order, bool ismain, String text, bool isdel) async {
    final Database db = await ins.database;
    await db.execute('''INSERT INTO Verses ("verseID", "songId", "order", "IsMain", "Text", "isdeleted") VALUES (? , ?, ?, ?, ?,?)''', [id, songId, order, ismain, text, isdel]);
  }

  insertSync (String lastsync) async {
    final Database db = await ins.database;
    await db.execute('''INSERT INTO Syncing ("lastSync") VALUES ( ?)''', [lastsync]);
  }

  updateCat (int id, String catname, bool isdel) async {
    final Database db = await ins.database;
    await db.execute('''UPDATE Categories SET AgeID = ?, AgeName = ?, isdeleted = ? WHERE AgeID = $id ''', [id, catname, isdel]);
  }
  updateSong (int id, int catId, String songname, bool isdel) async {
    final Database db = await ins.database;
    await db.execute('''UPDATE Songs SET SongID = ?, CategoryId = ?, SongName = ?, isdeleted = ?  WHERE SongID = $id ''', [id, catId, songname, isdel]);
  }
  updateVerse (int id, int songId, int order, bool ismain, String text, bool isdel) async {
    final Database db = await ins.database;
    await db.execute('''UPDATE Verses SET verseID = ?, songId = ?, [order] = ? , IsMain = ? , Text = ?, isdeleted = ? WHERE verseID = $id ''', [id, songId, order, ismain, text, isdel]);
  }

  deletetCat (int id) async {
    final Database db = await ins.database;
    await db.execute('''DELETE FROM Categories WHERE AgeID = $id''');
  }

  deletetSong (int id) async {
    final Database db = await ins.database;
    await db.execute('''DELETE FROM Verses WHERE SongID = $id''');
  }

  deletetVerse (int id) async {
    final Database db = await ins.database;
    await db.execute('''DELETE FROM Verses WHERE verseID = $id''');
  }

 Future<void> queryCat () async {
   final Database db = await ins.database;
    //await db.execute('''SELECT * "Categories"''');
    final List<Map<String, Object?>> queryResult = await db.query('Categories');
    sqlCatList= queryResult.map((e) => sqlCategories.fromMap(e)).toList();
    sqlCatList.sort((a,b) => a.category_id.compareTo(b.category_id));
  }
  Future<void> querySongs () async {
    final Database db = await ins.database;
    //await db.execute('''SELECT * "Categories"''');
    final List<Map<String, Object?>> querySongsResult = await db.query('Songs');
    sqlSongList = querySongsResult.map((e) => sqlSongs.fromMap(e)).toList();
    sqlSongList.sort((a,b) => a.song_name.compareTo(b.song_name));
  }

  Future<void> queryVerses () async {
    final Database db = await ins.database;
     final List<Map<String, Object?>> queryVerseResult = await db.query('Verses');
     sqlVerseList = queryVerseResult.map((e) => sqlVerses.fromMap(e)).toList();
     sqlVerseList.sort((a,b) => a.order.compareTo(b.order));
  }

  Future<void> querySync () async {
    final Database db = await ins.database;
    final List<Map<String, Object?>> querySyncResult = await db.query('Syncing');
    sqlsyncList = querySyncResult.map((e) => sqlSync.fromMap(e)).toList();
  }

  Future close() async{
    final Database db = await ins.database;
    db.close();
  }
}