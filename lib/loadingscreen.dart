import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid19_status/Networking.dart';
import 'package:covid19_status/homescreen.dart';

class Loadingscreen extends StatefulWidget {
  @override
  _LoadingscreenState createState() => _LoadingscreenState();
}

class _LoadingscreenState extends State<Loadingscreen> {

  @override
  void initState() {
    super.initState();
    //getData();
    startTimer();
  }

  startTimer()async{
    var duration = Duration(seconds: 2);
    return Timer(duration, getData);
  }
  void getData() async{
    var url = 'https://api.covid19india.org/data.json';
    Networkhelper networkhelper = Networkhelper(url);
    var data = await networkhelper.getData();

     Navigator.pushReplacement(context, MaterialPageRoute(
         builder: (context) => Homescreen(totalData: data)));
 }

   @override
   Widget build(BuildContext context) {

     return Scaffold(
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Container(
               child: Image.asset('images/abc.png'),
             ),
             //Padding(padding: EdgeInsets.only(top: 20.0)),
             Text(
               'Covid-19 Status',
               style: TextStyle(
                 fontSize: 20.0,
                 color: Colors.white,
               ),
             ),
             Padding(padding: EdgeInsets.only(top: 10.0),),
             Text(
               'v1.0',
               style: TextStyle(
                 fontSize: 15.0,
                 color: Colors.white,
               ),
             ),
             Padding(padding: EdgeInsets.only(top: 20.0),),
             CircularProgressIndicator(
               backgroundColor: Colors.white,
               strokeWidth: 1.0,
             ),
             Padding(padding: EdgeInsets.only(bottom: 20.0),),
           Expanded(
             child:Align(
               alignment: Alignment.bottomCenter,
               child: Text(
                 'Developed by Aseem Bhutra',
                 style: TextStyle(
                   fontSize: 15.0
                 ),
               ),
             ),
           ),
             Padding(padding: EdgeInsets.only(bottom: 40.0),),
           ],
         ),
       ),
     );
   }
 }