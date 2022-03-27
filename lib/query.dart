import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:maoso3a_taranim_arabia/data.dart';
import 'package:sqflite/sqflite.dart';
import 'package:maoso3a_taranim_arabia/database.dart' as fbDatabase;


class DataController extends GetxController{
  Future queryVerses (String q) async{

    return FirebaseFirestore.instance.collection('Verses').where("Text".replaceAll("\u1d2c", "")
        .replaceAll("\u1d2e", "").replaceAll("\u1d9c", "").replaceAll("\u1d30", "").replaceAll("\u1d31", "").replaceAll("\u1da0", "")
        .replaceAll("\u1d33", "").replaceAll("\u1d50", "").replaceAll("\u1d47", "")
        .replaceAll("\ufe5f", "").replaceAll("\u2087", "").replaceAll("\u209b", "").replaceAll("\u1d64", "").replaceAll("\u2084", "")
        .replaceAll("\u1d48", "").replaceAll("\u2071", "").replaceAll("/", "\n"), isGreaterThanOrEqualTo: q).get();
  }
  Future querySongs(String q){
    return FirebaseFirestore.instance.collection('Songs').where('SongName', isGreaterThanOrEqualTo: q)
        .where('SongName', isLessThanOrEqualTo: q+'z').get();
  }
  Future getData(String collection) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot snapshot= await firestore.collection(collection).get();
    return snapshot.docs;
  }
  Future <List<mysearch>> searchSongs(String q) async{
    final Database db = await fbDatabase.NotesDatabase.ins.database;
    print('test');
    final List<Map<String, Object?>> SongsResult = await db.rawQuery(''' SELECT Songs.SongID, Songs.CategoryId, Songs.SongName FROM Songs inner join Verses ON Songs.SongID = Verses.songId  WHERE 
    replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(
    replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(Verses.Text, "\u1d2c",""),"\u1d2e",""),"\u1d9c",""),"\u1d30",""),"\u1d31","")
    ,"\u1da0",""),"\u1d33",""),"\u1d50",""),"\u1d47",""),"\ufe5f",""),"\u2087",""),"\u209b",""),"\u1d64",""),"\u2084",""),"\u1d48",""),"\u2071", ""), "\u1d43",""),"\u02b2",""),"/", "\n" ),"-","")
    ,"ّ",""),"َ",""),"ً",""),"ُ",""),"ٌ",""),"ِ",""),"ٍ",""),"ْ","") LIKE "%$q%" AND Songs.isdeleted = 0 AND Verses.isdeleted = 0 group by Songs.SongID''');
    return SongsResult.map((e) => mysearch.fromMap(e)).toList();
  }
}