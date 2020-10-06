import 'dart:ui';

import 'package:covid19app/widgets/MyHeader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:covid19app/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:covid19app/widgets/counter.dart';
import 'package:covid19app/info_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid 19',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: kBodyTextColor
          )
        ),
        fontFamily: 'Poppins'
      ),
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyHeader(
              image:"assets/icons/Drcorona.svg",
              textTop: "All you need",
              textBottom: "is Stay At Home",
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Color(0xffe5e5e5)),


              ),
              child:Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/maps-and-flags.svg'),
                    SizedBox(width: 20),
                    Expanded(
                        child: DropdownButton(
                          isExpanded: true,
                          underline: SizedBox(),
                          icon: SvgPicture.asset('assets/icons/dropdown.svg'),
                          value: 'Indonesia',
                          items: ['Indonesia','Bangladesh','United States','Japan']
                              .map<DropdownMenuItem<String>>((String value){
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),

                                );
                          }).toList(),
                          onChanged: (value){},

                        )
                    )
                  ],
                ),

              ) ,
            ),
            SizedBox(height: 20.0,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      RichText(
                          text:TextSpan(
                            children: [
                              TextSpan(
                                text: "Case Update\n",
                                style: kTitleTextstyle
                              ),
                              TextSpan(
                                text: "Newest update March 28",
                                style: TextStyle(
                                  color: kTextLightColor
                                )
                              )
                            ]
                          )
                      ),
                      Spacer(),
                      Text(
                        "See Details",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset:Offset(0,4),
                          blurRadius: 30,
                          color: kShadowColor
                      )]
                    ),
                    child: Row(
                      children: [
                        Counter(number:1028,color:kInfectedColor,title:"Infected"),
                        Spacer(),
                        Counter(number: 25,color:kDeathColor,title: "Deaths",),
                        Spacer(),
                        Counter(number: 46,color:kRecovercolor,title: "Recovered",)
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Spread of Virus",
                        style: kTitleTextstyle,
                      ),
                      Text(
                        "See Details",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,

                        ),
                      )
                    ],
                  ),
                  Container(
                    margin:EdgeInsets.only(top:20),
                    padding:EdgeInsets.all(20),
                    height: 178,
                      width:double.infinity,
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color:Colors.white,
                        boxShadow: [BoxShadow(
                          offset: Offset(0,10),
                          blurRadius: 30,
                          color:kShadowColor


                        )]
                      ),
                    child: Image.asset(
                        "assets/images/map.png",
                    fit:BoxFit.contain),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

