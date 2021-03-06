import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class CovidCases{
  static final CovidCases _CaseObject= new CovidCases._internal();
  List<String> countries;


  factory CovidCases(){
    return _CaseObject;
  }

  CovidCases._internal(){
      countries=new List<String>();
  }
  Future<String> getCountries() async{
    //making the requset
    Response response=await get('https://api.covid19api.com/countries');

    List<dynamic> data=jsonDecode(response.body);

     countries=getCountriesNames(data);






    /*String dateTime=data['datetime'];
    String offset=data['utc_offset'].substring(1,3);
//    print(dateTime);
//    print(offset);
    DateTime now=DateTime.parse(dateTime);
    now=now.add(Duration(hours: int.parse(offset)));
    isDayTime=now.hour>6 && now.hour<15?true:false;
    time =DateFormat.jm().format(now);*/

  }
  List<String> getCountriesNames(List<dynamic> countries){
    List<String> countriesNames=new List<String>();
    for(int i=0;i<countries.length;i++){
      countriesNames.add(countries[i]['Country']);
    }
    return countriesNames;
  }
}