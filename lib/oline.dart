import 'dart:async';
//import 'dart:html';
import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maoso3a_taranim_arabia/data.dart';
import 'package:maoso3a_taranim_arabia/aftersplash.dart';

class online extends StatefulWidget{
  @override
  _online  createState() => _online ();
}
class _online extends State<online>{
  dataoffline() async{
    await FirebaseFirestore.instance.enablePersistence();

// All other platforms.
    FirebaseFirestore.instance.settings = Settings(persistenceEnabled: false);
    FirebaseFirestore.instance.settings = Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
    await FirebaseFirestore.instance.disableNetwork();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataoffline();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: //AfterSplash(),
      Container()
    );
  }
}