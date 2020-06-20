import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gcetjmfeev2/shared.dart';
import 'package:gcetjmfeev2/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

String name, mobnum, email, rollno, address, batch, branch, joindate, roomno;

storeLastLogin(BuildContext context) async {
  print('called');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var user = prefs.getString('user');
  var stbatch = prefs.getString('stbatch');
  var stbranch = prefs.getString('stbranch');

  var lastlogintime = prefs.getString('lastlogintime');
  initializeDateFormatting();
  DateTime now = DateTime.now();
  var dateString = DateFormat('dd-MM-yyyy').format(now);
  print(new DateFormat("dd-MM-yyyy").format(now));
  TimeOfDay timeOfDay = TimeOfDay.fromDateTime(DateTime.now());
  String res =
      DateFormat("dd-MM-yyyy").format(now) + "  " + timeOfDay.format(context);
  print(res);
  var pass = prefs.getString('pass');
  var year = user.substring(0, 2);
  var branch = user.substring(2, 4);
  print(year);
  print(branch);
  Firestore.instance
      .collection('Login/$year/$branch')
      .document('${user}')
      .updateData({
    'lastLoginTime': lastlogintime,
    'lastOpenTime': res,
    'user': user,
    'pass': pass,
    'deviceToken': deviceToken,
  });
  print(lastlogintime);
  print(res);
  print(user);
  print(pass);
}

Widget getImage(String img, double ht) {
  if (img == 'JAN') {
    return Image(
      image: AssetImage('images/jan.png'),
      height: ht / 10,
      //width: wt/7,
    );
  } else if (img == 'FEB') {
    return Image(
      image: AssetImage('images/feb.png'),
      height: ht / 10,
      //width: wt/7,
    );
  } else if (img == 'MAR') {
    return Image(
      image: AssetImage('images/mar.png'),
      height: ht / 10,
      //width: wt/7,
    );
  } else if (img == 'APR') {
    return Image(
      image: AssetImage('images/apr.png'),
      height: ht / 10,
      //width: wt/7,
    );
  } else if (img == 'MAY') {
    return Image(
      image: AssetImage('images/may.png'),
      height: ht / 10,
      //width: wt/7,
    );
  } else if (img == 'JUN') {
    return Image(
      image: AssetImage('images/jun.png'),
      height: ht / 10,
      //width: wt/7,
    );
  } else if (img == 'JUL') {
    return Image(
      image: AssetImage('images/jul.png'),
      height: ht / 10,
      //width: wt/7,
    );
  } else if (img == 'AUG') {
    return Image(
      image: AssetImage('images/aug.png'),
      height: ht / 10,
      //width: wt/7,
    );
  } else if (img == 'SEP') {
    return Image(
      image: AssetImage('images/sep.png'),
      height: ht / 10,
      //width: wt/7,
    );
  } else if (img == 'OCT') {
    return Image(
      image: AssetImage('images/oct.png'),
      height: ht / 10,
      //width: wt/7,
    );
  } else if (img == 'NOV') {
    return Image(
      image: AssetImage('images/nov.png'),
      height: ht / 10,
      //width: wt/7,
    );
  } else {
    return Image(
      image: AssetImage('images/dec.png'),
      height: ht / 10,
      //width: wt/7,
    );
  }
}
/*
File image;
var url;
getImageUrl() async {
  final refmay = FirebaseStorage.instance.ref().child('may.png');
// no need of the file extension, the name will do fine.
  var urlmay = await refmay.getDownloadURL();
  print(urlmay);

  final refjun = FirebaseStorage.instance.ref().child('jun.png');
// no need of the file extension, the name will do fine.
  var urljun = await refmay.getDownloadURL();
  print(urljun);

  final refjul = FirebaseStorage.instance.ref().child('jul.png');
// no need of the file extension, the name will do fine.
  var urljul = await refmay.getDownloadURL();
  print(urljul);

  final refaug = FirebaseStorage.instance.ref().child('aug.png');
// no need of the file extension, the name will do fine.
  var urlaug = await refmay.getDownloadURL();
  print(url);
}
*/

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

Color pridarkColor = HexColor.fromHex('#79b700');
Color secondaryColor = HexColor.fromHex('#eeff41');
Color primaryColor = HexColor.fromHex('#aeea00');
Color primaryLightColor = HexColor.fromHex('#e4ff54');
Color primaryTextColor = HexColor.fromHex('#000000');
Color secondaryTextColor = HexColor.fromHex('#000000');

/*<color name="secondaryLightColor">#ffff78</color>
<color name="secondaryDarkColor">#b8cc00</color>
<color name="primaryTextColor">#000000</color>
<color name="secondaryTextColor">#000000</color>*/

TextStyle titleTextStyle = TextStyle(color: secondaryTextColor);
TextStyle subtitleTextStyle = TextStyle(color: primaryTextColor);

TextStyle btnstyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
);
