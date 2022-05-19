// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kpro/intro_slider.dart';
import 'package:kpro/splash_screeen.dart';
import 'package:kpro/login.dart';
import 'package:kpro/sign_up.dart';
import 'package:kpro/views/calender/calenderpage.dart';
import 'package:kpro/views/home.dart';
import 'package:kpro/views/home/home_screen.dart';
import 'package:kpro/views/home/landingpage.dart';
import 'package:kpro/views/profile/profilepage.dart';
import 'package:kpro/wp-api.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KPROS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
