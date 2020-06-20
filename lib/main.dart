import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gcetjmfeev2/homepage.dart';
import 'package:gcetjmfeev2/onboarding/clgImageScreen.dart';
import 'package:gcetjmfeev2/shared.dart';
import 'package:gcetjmfeev2/signup/personalDetails.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}
String gbrollNum, gbbranch, gbbatch;
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        accentColor: Colors.lightGreenAccent,
        backgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/HomePage': (BuildContext context) => HomePage(), //Homepage
        '/WelcomePage': (BuildContext context) => UIscreen1(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    gbrollNum = prefs.getString('rollNum');
    gbbranch = prefs.getString('branch');
    gbbatch = prefs.getString('batch');
    //print(gbrollNum+gbbatch+gbbranch);
    bool firstTime = prefs.getBool('first_time');
    print(firstTime);

    var _duration = new Duration(seconds: 3);
    if (firstTime != null && !firstTime) {
      // Not first time
      return new Timer(_duration, navigationPageHome);
    } else {
      // First time
      return new Timer(_duration, navigationPageWel);
    }
  }

  void navigationPageHome() {
    Navigator.of(context).pushReplacementNamed('/HomePage');
  }

  void navigationPageWel() {
    Navigator.of(context).pushReplacementNamed('/WelcomePage');
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double wt = screenSize.width;
    TextStyle ts = TextStyle(
      fontSize: wt / 10,
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      letterSpacing: 1,
    );
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset(
          'images/splash.gif',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
