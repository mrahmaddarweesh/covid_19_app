



import 'package:covid19app/constants.dart';
import 'package:covid19app/widgets/MyHeader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyHeader(
              image:'assets/icons/coronadr.svg',
              textTop: 'Get to Know',
              textBottom: 'About Covid-19',
            ),
            Padding(
                padding:EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Symptoms',
                      style: kTitleTextstyle,
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SymptomCard(image:'assets/images/headache.png',title: 'Headache',isActive: true,),
                        SymptomCard(image:'assets/images/caugh.png',title: 'Caugh',),
                        SymptomCard(image:'assets/images/fever.png',title: 'Fever',),

                      ],
                    ),
                    SizedBox(height: 20,),
                    Text('Prevention',style: kTitleTextstyle,),
                    SizedBox(height: 20,),
                    PreventCard(text: 'since the start of covid-19 outbreak some places have fully embraced wearing facemasks',image: 'assets/images/wear_mask.png',title: 'Wear Face Mask',),
                    SizedBox(height: 20,),
                    PreventCard(text: 'since the start of covid-19 outbreak some places have fully embraced wearing facemasks',image: 'assets/images/wash_hands.png',title: 'Wash your hands',),

                  ],

                ),
            )

          ],
        ),
      ),
    );
  }
}

class PreventCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  const PreventCard({
    Key key, this.image, this.title, this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: SizedBox(
        height: 156,
        child: Stack(
        children: [
          Container(
            height: 300,
            width:double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color:Colors.white,
              boxShadow:[
                BoxShadow(
                offset:Offset(0,8),
                blurRadius: 24,
                color: kShadowColor,

              )]
            ),
          ),
          Image.asset(image),
          Positioned(
            left: 130,
            child:Container(
              padding:EdgeInsets.symmetric(horizontal: 20,vertical: 15),
              height: 150,
              width: MediaQuery.of(context).size.width-170,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      title,
                    style: kTitleTextstyle.copyWith(
                      fontSize: 16
                    ),
                  ),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 12,

                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                      child:SvgPicture.asset('assets/icons/forward.svg')
                  ),
                ],
              ),
            )
          )
        ],
      ),),
    );
  }
}

class SymptomCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;
  const SymptomCard({
    Key key, this.image, this.title, this.isActive=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          isActive?
          BoxShadow(
          offset:Offset(0,10),
          blurRadius: 20,
          color: kActiveShadowColor
        ):
              BoxShadow(
                offset: Offset(0,3),
                blurRadius: 6,
                color: kShadowColor
              )

        ],

      ),
      child: Column(
        children: [
          Image.asset(image,height: 90,),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }
}
