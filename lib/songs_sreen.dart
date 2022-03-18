import 'package:flutter/material.dart';
import 'package:maoso3a_taranim_arabia/data.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:charcode/charcode.dart';
//import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'database.dart' as fbDatabase;
class SongScreen extends StatefulWidget {

  final int songId;
   String songName;
  int songCategory;
  //int songLetter;
  //String verseText;
  //int order;
  SongScreen({required this.songId, required this.songCategory, required this.songName});

  @override
  _SongScreenState createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {

  //YoutubePlayerController _controller;
  bool _loading = false;

  // _launchURL(url) async {
  //   setState(() {
  //     _loading = true;
  //   });
  //   //const url = 'https://flutter.dev';
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  //   setState(() {
  //     _loading = false;
  //   });
  // }
  //List <sqlCategories> sqlcat=[];

  //Future <void> querydata()async {
    // await fbDatabase.NotesDatabase.ins.queryCat();
    //sqlverse = await fbDatabase.NotesDatabase.ins.queryVerses();
  //}
  @override
  void initState() {
    super.initState();
    /*_controller = YoutubePlayerController(
      initialVideoId: widget.id,
      params: YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
      ),

    );*/

     cordsExist();
     //querydata();
    //_dividing();

  }

  bool isSelected = false;
  List <String> text = [];
  double size = 22;
  String buffer = "\u1d2c\u1d2e\u1d9c\u1d30\u1d31\u1da0\u1d33\u1d50\u1d47\ufe5f\u2087\u209b\u1d64\u2084\u1d48\u2071";
  toggle() {
    //print (['a'-'z']['A'-'Z']'#');


  }
  bool cordIsExist= false;
  cordsExist(){
    for (int i = 0; i < fbDatabase.sqlVerseList.length; i++) {
      if (widget.songId == fbDatabase.sqlVerseList[i].verse_song) {
        for (int x = 0; x < buffer.length; x++) {
          if (fbDatabase.sqlVerseList[i].Text.contains(buffer[x])) {
            setState(() {
              cordIsExist = true;
              isSelected = true;
            });
          }
        }
      }
    }
    //if(mounted){
      //setState(() { });
    //}
  }

  increment(){
    setState(() {
      size++;
    });
  }
  decrement(){
    setState(() {
      size--;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        //flexibleSpace: FlexibleSpaceBar(
          title: Text('${widget.songName}', textAlign: TextAlign.right,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        toolbarHeight: 75.0,
        actions: [
          if(cordIsExist)
            IconButton(
              icon: isSelected?Icon(Icons.toggle_on): Icon(Icons.toggle_off),
                  onPressed: () {
                    setState(() {
                      isSelected = !isSelected;
                    });
                    //toggle();
                    },
            ),
          IconButton(onPressed: increment, icon: Icon(Icons.add)),
          IconButton(onPressed: decrement, icon: Icon(Icons.minimize))
        ],
        backgroundColor: Colors.purple[900],
      ),
      body:new Scrollbar(
        isAlwaysShown: true,
        child: new Container(
          padding: new EdgeInsets.all(15.0),
          child: new Column(
            children: <Widget>[
              new Expanded(
                  child: new ListView(
                      children:<Widget>[
                           for(int y=0; y<fbDatabase.sqlCatList.length; y++)...[
                              if(fbDatabase.sqlCatList[y].category_id == widget.songCategory)...[
                                new Padding(
                                  padding: new EdgeInsets.fromLTRB(15, 15, 15, 15),
                                  child: new Text(' ${fbDatabase.sqlCatList[y].category_name}',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black45,
                                    ),
                                    textAlign: TextAlign.right,
                                  )
                                ),
                              ]
                           ],
                          new Padding(padding: new EdgeInsets.fromLTRB(15, 15, 15, 15),
                            child: new Column(
                                  children: [
                                    if(isSelected)...[
                                      for (int i = 0; i < fbDatabase.sqlVerseList.length; i++)...[
                                        if(widget.songId == fbDatabase.sqlVerseList[i].verse_song)...[
                                          if(fbDatabase.sqlVerseList[i].isMain == 1 && fbDatabase.sqlVerseList[i].Verseisdel ==0)...[
                                            new Text(fbDatabase.sqlVerseList[i].Text.replaceAll("\u1d2c", "")
                                              .replaceAll("\u1d2e", "").replaceAll("\u1d9c", "").replaceAll("\u1d30", "").replaceAll("\u1d31", "").replaceAll("\u1da0", "")
                                              .replaceAll("\u1d33", "").replaceAll("\u1d50", "").replaceAll("\u1d47", "")
                                              .replaceAll("\ufe5f", "").replaceAll("\u2087", "").replaceAll("\u209b", "").replaceAll("\u1d64", "").replaceAll("\u2084", "")
                                              .replaceAll("\u1d48", "").replaceAll("\u2071", "").replaceAll("\u1d43","").replaceAll("\u02b2","").replaceAll("/", "\n").replaceAll("-", ""),
                                            style: TextStyle(fontSize: size, fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
                                          ]
                                          else if(fbDatabase.sqlVerseList[i].Verseisdel ==0)...[
                                            new Divider(color: Colors.purple[900], indent: 30, endIndent: 30,),
                                            new Text(fbDatabase.sqlVerseList[i].Text.replaceAll("\u1d2c", "")
                                              .replaceAll("\u1d2e", "").replaceAll("\u1d9c", "").replaceAll("\u1d30", "").replaceAll("\u1d31", "").replaceAll("\u1da0", "")
                                              .replaceAll("\u1d33", "").replaceAll("\u1d50", "").replaceAll("\u1d47", "")
                                              .replaceAll("\ufe5f", "").replaceAll("\u2087", "").replaceAll("\u209b", "").replaceAll("\u1d64", "").replaceAll("\u2084", "")
                                              .replaceAll("\u1d48", "").replaceAll("\u2071", "").replaceAll("\u1d43","").replaceAll("\u02b2","").replaceAll("/", "\n").replaceAll("-", ""),
                                            style: TextStyle(fontSize: size, fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
                                          ]
                                        ]
                                      ]
                                    ]
                                    else ...[
                                      for (int i = 0; i < fbDatabase.sqlVerseList.length; i++)...[
                                        if(widget.songId == fbDatabase.sqlVerseList[i].verse_song)...[
                                          if(fbDatabase.sqlVerseList[i].isMain == 1 && fbDatabase.sqlVerseList[i].Verseisdel ==0)...[
                                            new Text(fbDatabase.sqlVerseList[i].Text.replaceAll("/", "\n"), style: TextStyle(fontSize: size, fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
                                          ]
                                          else if(fbDatabase.sqlVerseList[i].Verseisdel ==0)...[
                                            new Divider(color: Colors.purple[900], indent: 30, endIndent: 30,),
                                            new Text(fbDatabase.sqlVerseList[i].Text.replaceAll("/", "\n"), style: TextStyle(fontSize: size, fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
                                          ]
                                        ]
                                      ]
                                    ]
                                ],
                              //],
                            ),
                          ),


                            //Expanded(child: dividing(),)
                       // dividing(),
                        //for(int i=0; i<fbDatabase.allLinks.length; i++)
                          //if(fbDatabase.allLinks[i].link != "" && widget.vedioSerial == fbDatabase.allLinks[i].vedio_serial)
                        /*    new Container(
                              margin: EdgeInsets.all(10.0),
                              child:RaisedButton(
                                child: new Text('${fbDatabase.allLinks[i].resource_title}',style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.5)),
                                onPressed:() =>{_loading ? Center(child: CircularProgressIndicator(),) : _launchURL('${fbDatabase.allLinks[i].link}')},
                              ),
                            ),*/
                      ]
                    ),
              ),

            ],
        ),
      ),
    ),
    );
  }
}