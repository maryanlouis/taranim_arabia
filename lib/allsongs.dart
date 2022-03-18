import 'package:flutter/cupertino.dart';
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
import 'package:maoso3a_taranim_arabia/display.dart' as dis;
import 'display.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_database/firebase_database.dart';

class Allsongs  extends StatefulWidget {

  /*final FirebaseApp app;
  final FirebaseDatabase database;*/
  final bool connect;
  Allsongs({required this.connect});
  @override
  _Allsongs  createState() => _Allsongs (connect: connect);

}

class _Allsongs extends State<Allsongs >  {
   final bool connect;
  _Allsongs({required this.connect});

  /*final FirebaseApp app;
  final FirebaseDatabase database;*/
  //Video video = new Video();

  //static String myVideoId = 'AlOWMrTcPYg';

  //static String myVideoTitle = video.title;
  // the full url: https://www.youtube.com/watch?v=PQSagzssvUQ&ab_channel=NASA
  // it's an interesting video from NASA on Youtube
  //Data data = new Data();
  String _username = "";

  bool _loading = false;

 // _launchURL(url) async {
   // setState(() {
     // _loading = true;
    //});
    //const url = 'https://flutter.dev';
    //if (await canLaunch(url)) {
      //await launch(url);
    //} else {
      //throw 'Could not launch $url';
    //}
    //setState(() {
      //_loading = false;
    //});
  //}


  /*Future<void> _loadVedios() async {
    //List vediosList = new List();
    setState(() {
      _loading = true;
    });
    //for(int i; i<2; i++) {
      //String num = (i+1) as String;
      await fbDatabase.findVedios();
    //}
    setState(() {
      _loading = false;
    });
    //return vediosList;
  }*/

  /*Future<void> _loadVedioLinks(String i) async {
    //List vediosList = new List();
    setState(() {
      _loading = true;
    });
    //for(int i; i<2; i++) {
      //String num = (i+1) as String;
      await fbDatabase.findVediosLinks(i);
    //}
    setState(() {
      _loading = false;
    });
    //return vediosList;
  }*/
  /* String url = 'C:/Users/95200/Downloads/CVmaryan.pdf';
  String pdfasset = "assets/CVmaryan.pdf";
  PDFDocument _doc;
  bool _loading;

  _initPdf() async {
    setState(() {
      _loading = true;
    });
    final doc = await PDFDocument.fromAsset(pdfasset);
    setState(() {
      _doc=doc;
      _loading = false;
    });
  }
*/
  //String idvedio;
  /*void FetchVedioID(){
    String id;
    loadData();
    setState(() {
    for(int i=0; i< 3; i++ ){
      id= data.vedios[i].vedio_id;

      idvedio = id;

      //return idvedio;
      //return id;
    }
    });
  }*/
  // Initiate the Youtube player controller
  // YoutubePlayerController _controller;


  /* String url = 'C:/Users/95200/Downloads/CVmaryan.pdf';
  String pdfasset = "assets/CVmaryan.pdf";
  PDFDocument _doc;
  bool _loading;

  _initPdf() async {
    setState(() {
      _loading = true;
    });
    final doc = await PDFDocument.fromAsset(pdfasset);
    setState(() {
      _doc=doc;
      _loading = false;
    });
  }
*/
  /*void fetchvedio () async{
   String jsonPage = await _loadDataAsset();
   final jsonResponse = json.decode(jsonPage);
   data = new Data.fromJson(jsonResponse);
   print(data.vedios[1].vedio_id);
   //FetchVedioID();
   setState(() {
     for(int i=0; i< data.vedios.length; i++ ){
       _controller = YoutubePlayerController(


         initialVideoId: data.vedios[i].vedio_id,

         flags: YoutubePlayerFlags(
           autoPlay: false,
           mute: false,
         ),

       );
     }

   });
 }
*/
   // Future <void> load()async {
   //   Display d = new Display(connection: connect);
   //   d.createState().load();
   //   //d.createState().build(context);
   //   //AfterSplash(connection: connect,);
   //   setState(() {
   //   });
   // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('موسوعة ترانيم عربية', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.5), textAlign: TextAlign.right),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => SearchScreen()))),
        ],
        backgroundColor: Colors.purple[900],
      ),

      body: _loading?Center(child: CircularProgressIndicator(color: Colors.purple[900]),):
      // new RefreshIndicator(
      //   color: Colors.purple[900],
      //   onRefresh:load,
      //   child:
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
                      if(fbDatabase.sqlSongList[index].Songisdel == 0) {
                        return new Card(
                          child: new Container(
                            child: new Center(
                              child: new Column(
                                // Stretch the cards in horizontal axis
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () =>
                                      Navigator.push(
                                        context, MaterialPageRoute(
                                        builder: (_) =>
                                            SongScreen(songId: fbDatabase.sqlSongList[index].song_id, songName: fbDatabase.sqlSongList[index].song_name, songCategory: fbDatabase.sqlSongList[index].song_category,),
                                      ),
                                      ),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
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
                                            fbDatabase.sqlSongList[index].song_name,
                                              // set some style to text
                                              style: new TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.purple[900],
                                                  fontWeight: FontWeight.w600),
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
                    return Container();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    //)
    );
  }

  @override
  void initState()  {
    super.initState();

    //loadData();
    // fetchvedio();
    // _initPdf();
    //loadData();
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
