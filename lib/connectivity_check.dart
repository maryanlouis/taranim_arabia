import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:maoso3a_taranim_arabia/aftersplash.dart';
import 'package:maoso3a_taranim_arabia/load_data.dart';
import 'package:maoso3a_taranim_arabia/oline.dart';
import 'database.dart' as fbDatabase;
class connectionCheck  extends StatefulWidget{
  @override
  _connectionCheck  createState() => _connectionCheck ();

}

class _connectionCheck extends State<connectionCheck >  {

  bool isconnected = false;
  Future<bool> isInternet() async {
    ConnectivityResult connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network, make sure there is actually a net connection.
      if (await InternetConnectionChecker().hasConnection) {
        // Mobile data detected & internet connection confirmed.
        //return true;
        setState(() {
          isconnected = true;
        });
        return isconnected;
      } else {
        // Mobile data detected but no internet connection found.
        //return false;
        setState(() {
          isconnected = false;
        });
        return isconnected;
      }
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a WIFI network, make sure there is actually a net connection.
      if (await InternetConnectionChecker().hasConnection) {
        // Wifi detected & internet connection confirmed.
        //return true;
        setState(() {
          isconnected = true;
        });
        return isconnected;
      } else {
        // Wifi detected but no internet connection found.
        //return false;
        setState(() {
          isconnected = false;
        });
        return isconnected;
      }
    } else {
      // Neither mobile data or WIFI detected, not internet connection found.
      //return false;
      setState(() {
        isconnected = false;
      });
      return isconnected;
    }
  }
  // Future <void> checking()async {
  //   await isInternet();
  //   await syncActions();
  //  // await loadingFirebase();
  //   print('connection: $isconnected');
  // }

 // Future <void> loadingFirebase () async {
 //   print('tuhyf');
 //   print(fbDatabase.allverses.length);
 //   // if(mounted){
 //   //   setState(() { });
 //   // }
 // }

 bool isloaded =false;
  Future <void> syncActions()async {
    await fbDatabase.NotesDatabase.ins.querySync();
    if(fbDatabase.sqlsyncList.length == 0){
      DateTime def = DateTime(1999,1,1,12,0,0).toLocal();
      print('datetime is: $def');

      await fbDatabase.NotesDatabase.ins.insertSync(def.toString());
      await fbDatabase.NotesDatabase.ins.querySync();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isInternet().whenComplete(() async {
      //await loadingFirebase().whenComplete(() async {
       await syncActions().whenComplete(() {
          setState(() {
            isloaded = true;
          });
        //});
     });
    });
    //checking();
  }

  @override
  Widget build(BuildContext context) {
    print('connection state: $isconnected');
    return Scaffold(
      body://isconnected == true? AfterSplash() : new Container()
      //offline()
      isloaded == false? Center(child: CircularProgressIndicator(color: Colors.purple[900],),):
     AfterSplash(connection: isconnected)
    );
  }
}
/*   new Container(
            color: Colors.black12,
            child: Center(
              child:new Text(
                  'يرجى الأتصال بالأنترنت والمحاولة مرة أخرى',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black
                      ),
                textAlign: TextAlign.center,
              ),
            )
          )*/