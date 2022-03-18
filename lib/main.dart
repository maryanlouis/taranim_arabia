//@dart=2.9
// ignore_for_file: directives_ordering, prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maoso3a_taranim_arabia/categoriesPages.dart';
import 'package:maoso3a_taranim_arabia/display.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:maoso3a_taranim_arabia/allsongs.dart';
import 'package:maoso3a_taranim_arabia/data.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
//import 'package:sqflite/sqflite.dart';
//import 'package:tekartik_app_platform/app_platform.dart';
import 'database.dart' as fbDatabase;
import 'package:maoso3a_taranim_arabia/aftersplash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:path/path.dart'; //needed for basename
import 'package:maoso3a_taranim_arabia/connectivity_check.dart';
//import 'package:tekartik_app_flutter_sqflite/sqflite.dart';
import 'package:sqflite_common/sqlite_api.dart';
//fbDatabase.NotesDatabase noteDatabase ;

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // platformInit();
  // // For dev on windows, find the proper sqlite3.dll
  // if (!kIsWeb) {
  //   sqfliteWindowsFfiInit();
  // }
  // var packageName = "com.example.maoso3a_taranim_arabia";
  // var databaseFactory = getDatabaseFactory(packageName: packageName);
  // noteDatabase = fbDatabase.NotesDatabase(databaseFactory);
 // String dbPath = await getDatabasesPath();
  //String path = join(dbPath, 'taranim.db');
  //await openDatabase(path, version: 1,);
  await fbDatabase.NotesDatabase.ins.database;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp();
  /*final FirebaseApp app;
  final FirebaseDatabase database;*/
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      title: 'موسوعة ترانيم عربية',
      theme: ThemeData(
        primaryColor: Colors.lightBlue[900],
      ),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Container(child: child),
        );
      },
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage();
  /*final FirebaseApp app;
  final FirebaseDatabase database;*/
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Data data = new Data();
  //_HomePageState();
  /*final FirebaseApp app;
  final FirebaseDatabase database;*/
  String _username = "";

  //List vedios;
  //List categoriesTitle = new List();

  /*Future<List> _loadVedios(String key) async {
    setState(() {
      _loading = true;
    });
    for(int i; i<2; i++) {
      vedios[i] = await fbDatabase.findVedios(key,i);
    }
    setState(() {
      _loading = false;
    });
    return vedios;
  }*/
   //fbDatabase.NotesDatabase noteDatabase;
  //bool _loading = false;
  // int verseLength =0;
  // int songsLength =0;
  // int count = 0;
  //
  // Future<void> _loadCategories(String x) async {
  //   //List categoryList = new List();
  //   //setState(() {
  //   //_loading = true;
  //   //});
  //   //for(int i; i<2; i++) {
  //   //int x = i+1;
  //   //String num = x as String;
  //   await fbDatabase.findCategories(x);
  //
  //   //}
  //   //setState(() {
  //   //_loading = false;
  //   //});
  //   //return categoryList;
  // }
  // Future<void> _loadSongs(String i) async {
  //   //List vediosList = new List();
  //   //setState(() {
  //   //_loading = true;
  //   //});
  //   //for(int i; i<2; i++) {
  //   //int x = i+1;
  //   //String num = x as String;
  //   await fbDatabase.findSongs(i);
  //   // }
  //   //setState(() {
  //   //_loading = false;
  //   //});
  //   //return vediosList;
  // }
  //
  // Future<void> _loadVerses(String i) async {
  //   //List vediosList = new List();
  //   //setState(() {
  //   //_loading = true;
  //   //});
  //   //for(int i; i<2; i++) {
  //   //int x = i+1;
  //   //String num = x as String;
  //   await fbDatabase.findVerses(i);
  //   // }
  //   //setState(() {
  //   //_loading = false;
  //   //});
  //   //return vediosList;
  // }
  //
  // Future <void> loadingFirebase() async {
  //   Query _messageRef;
  //   _messageRef = FirebaseFirestore.instance.collection('Categories');
  //   _messageRef.get().then((QuerySnapshot snapshot) async {
  //     setState(() {
  //       count = snapshot.size;
  //     });
  //     for (int index = 0; index < count; index++) {
  //       int x = index + 1;
  //       String n = x.toString();
  //       _loadCategories(n);
  //     }
  //   });
  //   Query _messageSongRef;
  //   _messageSongRef = FirebaseFirestore.instance.collection('Songs');
  //   _messageSongRef.get().then((QuerySnapshot snapshot) async {
  //     setState(() {
  //       songsLength = snapshot.size;
  //     });
  //     for (int index = 0; index < songsLength; index++) {
  //       int x = index + 1;
  //       String n = x.toString();
  //       _loadSongs(n);
  //     }
  //   });
  //   Query _messageRefVerse;
  //   _messageRefVerse = FirebaseFirestore.instance.collection('Verses');
  //    _messageRefVerse.get().then((QuerySnapshot snapshot) async {
  //     setState(() {
  //       verseLength = snapshot.size;
  //     });
  //     for (int a = 0; a < verseLength; a++) {
  //       int y = a + 1;
  //       String num = y.toString();
  //       _loadVerses(num);
  //     }
  //   });
  // }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    //loadingFirebase();
    //this.noteDatabase = fbDatabase.NotesDatabase();
    //this.noteDatabase.initializeDB();
  }

  @override
  Widget build(BuildContext context) {
    return new EasySplashScreen(
      durationInSeconds: 3,
      navigator: connectionCheck(),
      title: new Text(
        'موسوعة ترانيم عربية',
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      logo: new Image.asset(
        'assets/logo.png',
      ),
      logoSize: 150.0,
      backgroundColor: Colors.white,
      loaderColor: Colors.purple[900],
      showLoader: true,
    );
  }
}
