import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gcetjmfeev2/aboutus.dart';
import 'package:gcetjmfeev2/shared.dart';
import 'package:gcetjmfeev2/dues.dart';
import 'package:gcetjmfeev2/feedback.dart';
import 'package:gcetjmfeev2/homepage.dart';
import 'package:gcetjmfeev2/mFee_queries.dart';
import 'package:gcetjmfeev2/onboarding/clgImageScreen.dart';
import 'package:gcetjmfeev2/profile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wt = MediaQuery.of(context).size.width;
    return Drawer(
        child: Container(
      color: primaryLightColor,
      child: ListView(
        padding: EdgeInsets.all(0.0),
        children: [
          createHeader(ht),
          SizedBox(
            height: wt / 30,
          ),
          _createDrawerItem(
            icon: Icons.home,
            text: 'Home',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => HomePage(),
                ),
              );
            },
          ),
          SizedBox(
            height: wt / 80,
          ),
          _createDrawerItem(
            icon: Icons.question_answer,
            text: 'Queries',
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context, rootNavigator: true).push(
                  CupertinoPageRoute<bool>(
                      fullscreenDialog: false,
                      builder: (BuildContext context) => MFeeQueries()));
            },
          ),
          SizedBox(
            height: wt / 80,
          ),
          _createDrawerItem(
            icon: Icons.feedback,
            text: 'Feedback',
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context, rootNavigator: true).push(
                  CupertinoPageRoute<bool>(
                      fullscreenDialog: false,
                      builder: (BuildContext context) => FeedBack()));
            },
          ),
          SizedBox(
            height: wt / 80,
          ),
          _createDrawerItem(
            icon: Icons.person,
            text: 'About Us',
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context, rootNavigator: true).push(
                  CupertinoPageRoute<bool>(
                      fullscreenDialog: false,
                      builder: (BuildContext context) => Aboutus()));
            },
          ),
          SizedBox(
            height: wt / 80,
          ),
          /*_createDrawerItem(
            icon: Icons.bug_report,
            text: 'Report an issue',
            onTap: () {},
          ),*/
          Divider(
            color: pridarkColor,
            thickness: 2,
          ),
          SizedBox(
            height: ht / 3.3,
          ),
          _createDrawerItem(
            icon: Icons.exit_to_app,
            text: 'Logout',
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              //prefs.clear();
              prefs.setBool('first_time', true);
              var a = prefs.getBool('first_time');
              print(a);
              Navigator.pop(context);
              Navigator.of(context, rootNavigator: true).pushReplacement(
                  CupertinoPageRoute<bool>(
                      fullscreenDialog: false,
                      builder: (BuildContext context) => UIscreen1()));
            },
          ),
        ],
      ),
    ));
  }
}

Widget createHeader(double ht) {
  return Container(
    height: ht/3.8,
    child: DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: pridarkColor,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('images/drawerImg.gif'
          ),
          //fit: BoxFit.cover,
        ),
      ),
      /*child: Stack(
        children: [
          Positioned(
            bottom: 18.0,
            left: 7.0,
            /*child: Text(
              'GCETJ mFEE',
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
            ),*/
          ),
        ],
      ),*/
    ),
  );
}

Widget _createDrawerItem(
    {IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: [
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            text,
            style: GoogleFonts.openSans(
              textStyle: TextStyle(
                  //color: Colors.,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    ),
    onTap: onTap,
  );
}
