import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:maoso3a_taranim_arabia/SearchScreen.dart';
import 'package:maoso3a_taranim_arabia/categoriesPages.dart';
import 'package:maoso3a_taranim_arabia/display.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:maoso3a_taranim_arabia/allsongs.dart';
import 'package:maoso3a_taranim_arabia/data.dart';
import 'package:maoso3a_taranim_arabia/query.dart';
import 'package:maoso3a_taranim_arabia/songs_sreen.dart';
import 'package:sqflite/sqflite.dart';

import 'database.dart' as fbDatabase;
import 'package:maoso3a_taranim_arabia/searchResults.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:path/path.dart';

import 'database.dart';
import 'main.dart'; //needed for basename

class AfterSplash extends StatefulWidget {
 final bool connection;
 AfterSplash({required this.connection});
  @override
  _AfterSplash createState() => _AfterSplash(connection: connection);
}

class _AfterSplash extends State<AfterSplash> {
  final bool connection;
  _AfterSplash({required this.connection});
  bool isfirst= false;
  Future<void> _loadCategories(String x) async {
    //List categoryList = new List();
    // setState(() {
    //   _loading = true;
    // });
    //for(int i; i<2; i++) {
    //int x = i+1;
    //String num = x as String;
    await fbDatabase.findCategories(x);

    //}
    // setState(() {
    //   _loading = false;
    // });
    //return categoryList;
  }

  bool _loaded = false;

  /* Future<String> _loadDataAsset() async {
    return await rootBundle.loadString('assets/data.json');
  }

  Future loadData() async {
    setState(() {
      _loading = true;
    });
    String jsonPage = await _loadDataAsset();
    final jsonResponse = json.decode(jsonPage);
    setState(() {
      data = new Data.fromJson(jsonResponse);
    });
    print(data.vedios[1].vedio_id);
    setState(() {
      _loading = false;
    });
  }
*/
  // Future<void> getLength(int x) async {
  //   /*Query _messageRef;
  // _messageRef = FirebaseFirestore.instance.collection('myCategories');
  // await _messageRef.get().then((QuerySnapshot snapshot) {
  //
  //     count = snapshot.size;
  //
  // });*/
  //   Query _messageRef;
  //   _messageRef = FirebaseFirestore.instance.collection('Categories');
  //   await _messageRef.get().then((QuerySnapshot snapshot) {
  //     x = snapshot.size;
  //   });
  // }

//List CatId=[];
//List CatName=[];
  //int qcount = 0;
  bool Catisexist = false;
  //List <sqlCategories> sqlCat = [];
  // Future<void> inserting(int c) async {
  //   //Database db = await NotesDatabase.ins.database ;
  //   print("length is: + ${fbDatabase.allCategories.length}");
  //   for (int i = c; i < fbDatabase.allCategories.length; i++) {
  //     //_insertCat(db,fbDatabase.allCategories[i].category_id, fbDatabase.allCategories[i].category_name);
  //     await fbDatabase.NotesDatabase.ins.insertCat(
  //         fbDatabase.allCategories[i].category_id,
  //         fbDatabase.allCategories[i].category_name);
  //     print('Inserting');
  //   }
  // }

  // Future<void> updatingCat() async {
  //   for (int i = 0; i < fbDatabase.allCategories.length; i++) {
  //     await fbDatabase.NotesDatabase.ins.updateCat(
  //         fbDatabase.allCategories[i].category_id,
  //         fbDatabase.allCategories[i].category_name);
  //   }
  // }

  // Future<void> deleteingCat(int cid) async {
  //   //for(int i=0; i< fbDatabase.allverses.length; i++){
  //   //if(fbDatabase.allverses[i].verse_id != vid) {
  //   await fbDatabase.NotesDatabase.ins.deletetCat(cid);
  //   //}
  //   //}
  // }

  Future<void> actions() async {
    // Query _messageRef;
    // _messageRef = FirebaseFirestore.instance.collection('Categories');
    // _messageRef.get().then((QuerySnapshot snapshot) async {
    //   setState(() {
    //     count = snapshot.size;
    //   });
    //   for (int index = 0; index < count; index++) {
    //     int x = index + 1;
    //     String n = x.toString();
    //     await _loadCategories(n);
    //   }

      // final Database db = await fbDatabase.NotesDatabase.ins.initializeDB();
      // //await db.execute('''SELECT * "Categories"''');
      // final List<Map<String, Object?>> queryResult = await db.query('Categories');
      //queryResult.map((e) => sqlCategories.fromMap(e)).toList();
      await fbDatabase.NotesDatabase.ins.queryCat();

      // for (int d = 0; d < fbDatabase.sqlCatList.length; d++) {
      //   print("the ID is: ${fbDatabase.sqlCatList[d].category_id}");
      //   //setState(() {
      //    // qcount++;
      //   //});
      // }

      print('cat count: ${fbDatabase.allCategories.length}');
      print('counting cat = ${fbDatabase.sqlCatList.length}');
      if(connection==false && fbDatabase.sqlCatList.length ==0){
        setState(() {
          isfirst=true;
        });
      }
      else{
        setState(() {
          isfirst = false;
        });
        for(int a=0; a< fbDatabase.allCategories.length; a++) {
          if (DateTime.parse(fbDatabase.sqlsyncList[fbDatabase.sqlsyncList.length - 1].sync_date).isBefore(fbDatabase.allCategories[a].CatUpdate.toDate().toLocal())) {
            print('Ccount var = ${fbDatabase.sqlCatList.length}');
            //_insertCat(db,fbDatabase.allCategories[i].category_id, fbDatabase.allCategories[i].category_name);
            for(int i =0; i< fbDatabase.sqlCatList.length; i++){
              if(fbDatabase.allCategories[a].category_id == fbDatabase.sqlCatList[i].category_id){
                setState(() {
                  Catisexist = true;
                });

                print('id exist $Catisexist');
              }
            }
            if(Catisexist == true){
              await fbDatabase.NotesDatabase.ins.updateCat(fbDatabase.allCategories[a].category_id,
                  fbDatabase.allCategories[a].category_name, fbDatabase.allCategories[a].isdeleted);
            }
            if(Catisexist == false) {
              print('id exist $Catisexist');
              await fbDatabase.NotesDatabase.ins.insertCat(
                  fbDatabase.allCategories[a].category_id,
                  fbDatabase.allCategories[a].category_name,
                  fbDatabase.allCategories[a].isdeleted);
              print('Inserting cat');
            }
            //fbDatabase.sqlVerseList =[];
            await fbDatabase.NotesDatabase.ins.queryCat();
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
      }
      // if(mounted){
      //   setState(() { });
      // }
    //});
  }

  late int count;
  Future <void> loadingFirebase()async {
    if(connection == true){
      Query _messageRef;
      _messageRef = FirebaseFirestore.instance.collection('Categories');
      await _messageRef.get().then((QuerySnapshot snapshot) async {
        //setState(() {
        count = snapshot.size;
        //});
        for (int index = 0; index < count; index++) {
          int x = index + 1;
          String n = x.toString();
          await _loadCategories(n);
        }
      });
    }
  }

  Future <void> loadData()async {
    loadingFirebase().whenComplete(() {
      actions().whenComplete(() {
    //if(mounted) {
      setState(() {
        _loaded = true;
      });
   // }
      });
    } );
  }

  // Future <void> refreshData()async {
  //   await loadingFirebase();
  //   await actions();
  // }
  //
  // Future <void> loading()async {
  //   // AfterSplash afterSplash = new AfterSplash(connection: connect);
  //   // afterSplash.createState().refreshData();
  //   refreshData();
  //   Display d = new Display(connection: connection);
  //   d.createState().refreshData();
  // }

  @override
  void initState() {
    super.initState();
    //loadData();
    loadData();
    //quering() ;
    //print('counting: ${qcount}');
    //if(qcount<count){
    // inserting(qcount);
    // }
    //else{
    // print ('No new data to enter');
    // }
  }

  @override
  Widget build(BuildContext context) {
    Widget load(){
      if(_loaded == false ){return Center(child: CircularProgressIndicator(color: Colors.purple[900],),);}
      else{
        if(isfirst == true)
        {
          // return RefreshIndicator(
          //     onRefresh: loading,
          //     color: Colors.purple[900],
          //     child:
           return Container(child: Center(child: Text('عفوا، تأكد من إتصالك بالإنترنت لإستخدام التطبيق للمرة الأولى', style: TextStyle(fontSize: 30, color: Colors.black), textAlign: TextAlign.center,),),);
          //);
        }

           else{ return
          // RefreshIndicator(
          //   onRefresh: loading,
          //   color: Colors.purple[900],
          //   child:
            Display(connection: connection,);
          //);
           }
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('موسوعة ترانيم عربية',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.5),
            textAlign: TextAlign.right),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => SearchScreen()))),
        ],
        backgroundColor: Colors.purple[900],
      ),
      drawer:
      // RefreshIndicator(
      //     onRefresh: loading,
      //     color: Colors.purple[900],
      //     child:
          new Drawer(
            elevation: 100.0,
            child: new Column(
              children: <Widget>[
                new Expanded(
                  child: ListView(
                    children: <Widget>[
                      Container(
                        height: 200.0,
                        child: new UserAccountsDrawerHeader(
                          currentAccountPicture: new CircleAvatar(
                            backgroundImage: new AssetImage('assets/logo.png'),
                          ),
                          accountName: new Text(
                            'موسوعة ',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          accountEmail: new Text(
                            'ترانيم عربية',
                            textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.purple[900],
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text('عرض الكل',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 19)),
                        onTap: () => {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                              builder: (_) => new Allsongs(connect: connection),
                            ),
                          ),
                        },
                      ),
                      for (int index = 0; index < fbDatabase.sqlCatList.length; index++)...[
                        if(fbDatabase.sqlCatList[index].Catisdel == 0)...[
                          ListTile(
                            title: Text('${fbDatabase.sqlCatList[index].category_name}',
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19)),
                            onTap: () => {
                              //if (fbDatabase.allCategories[index].category_title == 'العهد القديم')
                              Navigator.push(context,
                                new MaterialPageRoute(
                                  builder: (_) => new CatPage(cat_id: fbDatabase.sqlCatList[index].category_id, cat_name: fbDatabase.sqlCatList[index].category_name, connect: connection),
                                ),
                              ),
                            },
                          ),
                        ]
                      ],
                      ListTile(
                        leading: Icon(Icons.exit_to_app),
                        title: Text('خروج',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 19)),
                        onTap: () => {
                          //Navigator.of(context).pop()
                          // exit(0)
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('هل أنت متأكد'),
                              content: Text('هل تريد الخروج من البرنامج؟'),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () => Navigator.of(context).pop(false),
                                  child: Text('لا'),
                                ),
                                FlatButton(
                                  onPressed: () =>
                                  /*Navigator.of(context).pop(true)*/
                                  SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
                                  child: Text('نعم'),
                                ),
                              ],
                            ),
                          )
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      //),
      body:load()
    );

  }
}
