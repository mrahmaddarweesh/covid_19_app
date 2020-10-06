import 'dart:convert';

import 'package:covid19app/services/CovidCases.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void connectApi() async{
    CovidCases instance=CovidCases();
    await instance.getCountries();
    /*Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':instance.location,
      'time':instance.time,
      'flag':instance.flag,
      'isDayTime':instance.isDayTime

    });*/
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connectApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body:Center(
          child: SpinKitRotatingCircle(
            color: Colors.white,
            size: 50.0,
          ),
        )
    );
  }
}
