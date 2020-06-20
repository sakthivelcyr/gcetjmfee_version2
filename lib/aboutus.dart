import 'package:flutter/material.dart';
import 'package:gcetjmfeev2/shared.dart';
import 'package:google_fonts/google_fonts.dart';

class Aboutus extends StatefulWidget {
  @override
  _AboutusState createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: pridarkColor,
        title: Text(
          'About us',
          style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Center(
                    child: Image.asset(
                  'images/appIcon.png',
                  height: MediaQuery.of(context).size.width / 2,
                )),
                SizedBox(height: MediaQuery.of(context).size.width / 15),
                Text('Version 1.0.0'),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Text('This app is developed by 2017-2021 CSE batch.'),
                SizedBox(height: MediaQuery.of(context).size.width / 80),
                Text('All rights are reserved.'),
                SizedBox(height: MediaQuery.of(context).size.width / 20),
                Text('In case you find any bug, Contact us.'),
                SizedBox(height: MediaQuery.of(context).size.width / 80),
                InkWell(
                  onTap: _launchURL,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.mail),
                      SizedBox(width: MediaQuery.of(context).size.width / 40),
                      Text('gcetjmfee@gmail.com'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Text('2017 - 2021 CSE batch'),
                SizedBox(height: MediaQuery.of(context).size.width / 80),
                Text('S Dhiraviya'),
                SizedBox(height: MediaQuery.of(context).size.width / 80),
                Text('S Divya'),
                SizedBox(height: MediaQuery.of(context).size.width / 80),
                Text('R Divyabharathy'),
                SizedBox(height: MediaQuery.of(context).size.width / 80),
                Text('P S Gajalakshmi'),
                SizedBox(height: MediaQuery.of(context).size.width / 80),
                Text('V Karthika'),
                SizedBox(height: MediaQuery.of(context).size.width / 80),
                Text('J Raja'),
                SizedBox(height: MediaQuery.of(context).size.width / 80),
                Text('M Sakthivel'),
              ],
            ),
          ),
        ],
      ),
    );
  }
  _launchURL() async {
    const url = 'mailto:gcetjmfee@gmail.com?subject=Bugs&body=Write your bug';
    /*if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }*/
  }
}
