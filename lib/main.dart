import 'dart:ui';

import 'package:covid19app/main_screen.dart';
import 'package:covid19app/widgets/MyHeader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:covid19app/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:covid19app/widgets/counter.dart';
import 'package:covid19app/info_screen.dart';

import 'loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes:{
     '/':(context)=>Loading(),
      '/home':(context)=>MyApp()

    },

  ));
}

