
import 'package:cloud_firestore/cloud_firestore.dart';

class Data {
   List<mysongs> songs = [];
   List<mycategories> categories = [];
   List<myverses> verses = [];
   List <mysearch> search=[];
   List <myquery> query= [];
   //List<JsonData> jsondata =[];
  Data({required this.songs, required this.categories, required this.verses, required this.search, required this.query});
}

class mysongs {
   String song_name;
   int song_id;
   int song_category;
   Timestamp SongUpdate;
   bool isdeleted;
   //int song_letter;
   //String song_text;
  mysongs({required this.song_name,
      required this.song_id,
      required this.song_category,
      required this.SongUpdate,
    required this.isdeleted
  });

}

class mysearch {
  String search_name;
  int search_id;
  int search_category;
  //int song_letter;
  //String song_text;
  mysearch({required this.search_name,
    required this.search_id,
    required this.search_category,
    // required this.song_text
  });
  mysearch.fromMap(Map<String, dynamic> res):
        search_name = res['SongName'] as String,
        search_id= res['SongID'] as int,
        search_category = res['CategoryId']as int;
  Map<String, Object?> toMap() {
    return {'SongName':search_name,'SongID': search_id, 'CategoryId':search_category};
  }
}

class myquery{
  int query_id;
  String query_text;
  myquery({required this.query_id, required this.query_text});
}

class mycategories {
  int category_id;
  String category_name;
  Timestamp CatUpdate;
  bool isdeleted;
  mycategories({required this.category_id, required this.category_name, required this.CatUpdate, required this.isdeleted});

}

class myverses {
  int verse_id;
  int verse_song;
  int order;
  bool isMain;
  String Text;
  Timestamp verseUpdate;
  bool isdel;
  myverses({required this.verse_id, required this.verse_song, required this.order, required this.isMain, required this.Text, required this.verseUpdate, required this.isdel});

}
/*class DataJson{
 final List<JsonData> jsondata;
  DataJson({required this.jsondata});
 factory DataJson.fromJson(Map<String, dynamic> parsedJson) {
   var list = parsedJson['Songs'] as List;
   //List<JsonData> jsondata = <JsonData>[];
   List<JsonData> jsonList = list.map((i) => JsonData.fromJson(i)).toList();
   return DataJson(
     jsondata: jsonList,
   );

 }

}*/

class sqlCategories{
  int category_id;
  String category_name;
  int Catisdel;
  sqlCategories({required this.category_id, required this.category_name, required this.Catisdel});
  //JsonData.fromJson(Map<String, dynamic> json)
  //:name = json['Text'],
  //text = json['Text'];
  //Map<String, dynamic> toJson() => {
    //'Text': name,
    //'Text': text,
  //};
   sqlCategories.fromMap(Map<String, dynamic> res):
      category_id = res['AgeID'] as int,
      category_name= res['AgeName'] as String,
         Catisdel  = res['isdeleted'] as int;
  Map<String, Object?> toMap() {
    return {'AgeID':category_name,'AgeName': category_name, 'isdeleted': Catisdel};
  }
    //list.map((e) => JsonData.fromJson(e)).toList();

      //return JsonData(name: name, text: text);
      //flag: json['flag'] as String,
      //capital: json['capital'] as String,
    //);

}
class sqlSongs{
  String song_name;
  int song_id;
  int song_category;
  int Songisdel;
  //int song_letter;
  //String song_text;
  sqlSongs({required this.song_name,
    required this.song_id,
    required this.song_category,
     required this.Songisdel
  });
  //JsonData.fromJson(Map<String, dynamic> json)
  //:name = json['Text'],
  //text = json['Text'];
  //Map<String, dynamic> toJson() => {
  //'Text': name,
  //'Text': text,
  //};
  sqlSongs.fromMap(Map<String, dynamic> res):
        song_category = res['CategoryId'] as int,
        song_id= res['SongID'] as int,
        song_name = res['SongName'] as String,
        Songisdel = res['isdeleted'] as int;
  Map<String, Object?> toMap() {
    return {'CategoryId':song_category,'SongID': song_id, 'SongName': song_name, 'isdeleted': Songisdel};
  }
//list.map((e) => JsonData.fromJson(e)).toList();

//return JsonData(name: name, text: text);
//flag: json['flag'] as String,
//capital: json['capital'] as String,
//);

}

class sqlVerses{
  int verse_id;
  int verse_song;
  int order;
  int isMain;
  String Text;
  int Verseisdel;
  sqlVerses({required this.verse_id, required this.verse_song, required this.order, required this.isMain, required this.Text, required this.Verseisdel});

  //JsonData.fromJson(Map<String, dynamic> json)
  //:name = json['Text'],
  //text = json['Text'];
  //Map<String, dynamic> toJson() => {
  //'Text': name,
  //'Text': text,
  //};
  sqlVerses.fromMap(Map<String, dynamic> res):
        verse_id = res['verseID'] as int,
        verse_song= res['songId'] as int,
        order = res['order'] as int,
        isMain = res['IsMain'] as int,
        Text = res['Text'] as String,
        Verseisdel = res['isdeleted'] as int;
  Map<String, Object?> toMap() {
    return {'verseID':verse_id,'songId': verse_song, 'order': order, 'IsMain': isMain, 'Text': Text, 'isdeleted': Verseisdel};
  }

//list.map((e) => JsonData.fromJson(e)).toList();

//return JsonData(name: name, text: text);
//flag: json['flag'] as String,
//capital: json['capital'] as String,
//);

}

class sqlSync{
  int sync_id;
  String sync_date;
  sqlSync({required this.sync_id, required this.sync_date});
  //JsonData.fromJson(Map<String, dynamic> json)
  //:name = json['Text'],
  //text = json['Text'];
  //Map<String, dynamic> toJson() => {
  //'Text': name,
  //'Text': text,
  //};
  sqlSync.fromMap(Map<String, dynamic> res):
        sync_id = res['sync_id'] as int,
        sync_date= res['lastSync'] as String;
  Map<String, Object?> toMap() {
    return {'sync_id':sync_id,'lastSync': sync_date};
  }
//list.map((e) => JsonData.fromJson(e)).toList();

//return JsonData(name: name, text: text);
//flag: json['flag'] as String,
//capital: json['capital'] as String,
//);

}