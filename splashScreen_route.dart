import 'package:flutter/material.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:untitled2/login_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class splash_route extends StatefulWidget {
  const splash_route({super.key});

  @override
  State<splash_route> createState() => _splash_routeState();
}

class _splash_routeState extends State<splash_route> {

  //Variables



  

  
  @override
  void initState() {

    // TODO: implement initState
      Future.delayed(Duration(seconds:2),(){
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (cn)=> HomePage()), (Route<dynamic> route)=> false);

    });
    super.initState();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(7, 7, 7, 1),
      body: Center(
        child:DelayedDisplay(
          child: Icon(Icons.task_alt,color: Colors.purple,size: 120,),
          delay: Duration(seconds: 1),
        ) ,
      ),

    );
  }
}


