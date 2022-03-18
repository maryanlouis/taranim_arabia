import 'dart:async';
//import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maoso3a_taranim_arabia/data.dart';
import 'package:maoso3a_taranim_arabia/aftersplash.dart';
import 'database.dart' as fbDatabase;

class offline extends StatefulWidget{
  final bool connection;
  offline({required this.connection});
  @override
  _offline  createState() => _offline (connection: connection);
}

class _offline extends State<offline>{
  final bool connection;
  _offline({required this.connection});

  Future <void> loading() async {
    //await loadingFirebase();
  }
  bool gotPath = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //WidgetsBinding.instance?.addPostFrameCallback((_) async {
    loading().whenComplete((){
      setState(() {
        gotPath = true;
      });
    });
    //});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(gotPath) {
      return Scaffold(
        body:  AfterSplash(connection: connection),
      );
    }
    return Container();
  }
}