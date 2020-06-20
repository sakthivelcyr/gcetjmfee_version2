import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:gcetjmfeev2/shared.dart';
import 'package:gcetjmfeev2/signup/stuAddDet.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUP extends StatefulWidget {
  @override
  _SignUPState createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  bool _validateN = false;
  bool _validateD = false;
  bool _validateB = false;
  bool _validateG = false;
  String dob, blood, gender;
  String errMsgBlood = '';
  String errMsgGender = '';
  String errMsgDOB = '';
  var currentSelectvalue, currentSelectvalueGender;

  TextEditingController Tname = TextEditingController();
  DateTime selectedDate = DateTime.parse("2000-01-01 20:18:04Z");

  Future<Null> _selectDate(BuildContext context) async {
    print(DateTime.now());
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1990, 8),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    Tname.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    Widget selectBlood() {
      return InputDecorator(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.white, width: 2),
          ),
          contentPadding:
              EdgeInsets.all(MediaQuery.of(context).size.width / 25),
        ),
        child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
          hint: Text(
            'Select Your Blood Group',
            style: TextStyle(color: Colors.white),
          ),
          value: currentSelectvalue,
          isDense: true,
          onChanged: (String newValue) {
            setState(() {
              currentSelectvalue = newValue;
              blood = currentSelectvalue;
              _validateB = false;
            });
          },
          items: <String>['o+', 'A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'others']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        )),
      );
    }

    Widget selectGender() {
      return InputDecorator(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.white, width: 2),
          ),
          contentPadding:
              EdgeInsets.all(MediaQuery.of(context).size.width / 25),
        ),
        child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
          hint: Text(
            'Select Your Gender',
            style: TextStyle(color: Colors.white),
          ),
          value: currentSelectvalueGender,
          isDense: true,
          onChanged: (String newValue) {
            setState(() {
              currentSelectvalueGender = newValue;
              gender = currentSelectvalueGender;
              _validateG = false;
            });
          },
          items: <String>['Male', 'Female', 'Transgender']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        )),
      );
    }

    Widget inputBox(String label, String errMsg, int i, bool validate,
        TextInputType t, Icon icon) {
      return TextFormField(
        controller: Tname,
        keyboardType: t,
        autofocus: false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              horizontal: 0, vertical: MediaQuery.of(context).size.width / 25),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.white, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
          errorText: validate ? errMsg : null,
          labelText: label,
          labelStyle: TextStyle(color: Colors.white),
          prefixIcon: icon,
          hasFloatingPlaceholder: true,
        ),
        cursorColor: Colors.white,
        showCursor: true,
        autocorrect: true,
        onChanged: (value) {
          if (i == 1) {
            _validateN = false;
          }
          if (i == 2) {
            _validateD = false;
            dob = value;
          }
        },
      );
    }

    TextEditingController dateOfBirth = TextEditingController();

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'images/bg.png',
              ),
              fit: BoxFit.fill,
            ),
          ),
          padding:
              EdgeInsets.symmetric(horizontal: size.width / 20, vertical: 0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    //Text('sak'),
                    Image.asset('images/clgicon.png',
                        height: MediaQuery.of(context).size.width/2.4),
                  ],
                ),
                Text(
                  'Personal Info',
                  style: titleTextStyle.copyWith(
                      fontSize: size.width / 12,
                      color: Colors.white,
                      letterSpacing: 1),
                ),
                SizedBox(
                  height: size.width / 40,
                ),
                inputBox(
                    'Your Name',
                    'Name must contains Alphabets',
                    1,
                    _validateN,
                    TextInputType.text,
                    Icon(Icons.person, size: 28, color: Colors.white)),
                SizedBox(
                  height: size.width / 20,
                ),
                selectGender(),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    errMsgGender,
                    style: TextStyle(color: Colors.red, fontSize: 13.5),
                  ),
                ),
                InkWell(
                  onTap: () => _selectDate(context),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width / 7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 40,
                        ),
                        Icon(Icons.calendar_today,
                            size: 28, color: Colors.white),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 40,
                        ),
                        Text(
                          "${selectedDate.toLocal()}".split(' ')[0],
                          style: TextStyle(color: Colors.black, fontSize: 17),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 20,
                        ),
                        Text('Select your DOB',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.width / 400,
                ),
                /*
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      errMsgDOB,
                      style: TextStyle(color: Colors.red, fontSize: 13.5),
                    )),*/

                SizedBox(
                  height: size.width / 40,
                ),
                selectBlood(),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      errMsgBlood,
                      style: TextStyle(color: Colors.red, fontSize: 13.5),
                    )),
                SizedBox(
                  height: size.width / 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(
                      child: Text('NEXT', style: btnstyle.copyWith(fontSize: MediaQuery.of(context).size.width / 18,)),
                      onPressed: () async {
                        SharedPreferences signupPrefs =
                            await SharedPreferences.getInstance();
                        setState(() {
                          dob = "${selectedDate.toLocal()}"
                              .split(' ')[0]
                              .toString();
                          errMsgDOB = '';
                          errMsgGender = '';
                          errMsgBlood = '';
                          var i = 0;
                          final validCharacters = RegExp(r'^[a-zA-Z \.]+$');
                          if (Tname.text.isEmpty ||
                              !validCharacters.hasMatch(Tname.text)) {
                            _validateN = true;
                            //errMsg = 'Roll number should not be empty';
                            i = 1;
                          }
                          if (currentSelectvalueGender == null) {
                            setState(() {
                              errMsgGender = 'Must select gender';
                            });

                            i = 1;
                          }
                          var check = DateTime.parse("2000-01-01").toString();
                          print(check);
                          if (currentSelectvalue == null) {
                            i = 1;
                            errMsgBlood = 'Must select any one type';
                          }
                          if (i == 0) {
                            signupPrefs.setString('sName', Tname.text);
                            signupPrefs.setString('sGender', gender);
                            signupPrefs.setString('sDOB', dob);
                            signupPrefs.setString('sBG', blood);
                            print(blood);
                            Navigator.of(context, rootNavigator: true).push(
                                CupertinoPageRoute<bool>(
                                    fullscreenDialog: false,
                                    builder: (BuildContext context) =>
                                        SignUPAdd()));
                          }
                        });
                      },
                    ),
                    Icon(Icons.arrow_forward, color: Colors.white, size: 28)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
