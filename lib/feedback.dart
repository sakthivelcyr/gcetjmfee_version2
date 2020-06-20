import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gcetjmfeev2/shared.dart';
import 'package:gcetjmfeev2/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class FeedBack extends StatefulWidget {
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  bool validateN = false;
  bool validateM = false;
  bool validateF = false;
  bool _load = false;
  String loadText = '';
  TextEditingController name = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController suggestions = TextEditingController();
  String errMsgN = '';
  String errMsgM = '';
  String errMsgMe = '';

  var status;
  var time;

  var iStatus = false;

  getIStatus() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      iStatus = true;
      // I am connected to a mobile network.
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      iStatus = true;
    } else {
      iStatus = false;
    }
  }

  Future sendFeedback() async {
    initializeDateFormatting();
    DateTime now = DateTime.now();
    var dateString = DateFormat('dd-MM-yyyy').format(now);
    print(new DateFormat("dd-MM-yyyy").format(now));
    TimeOfDay timeOfDay = TimeOfDay.fromDateTime(DateTime.now());
    String res =
        DateFormat("dd-MM-yyyy").format(now) + "  " + timeOfDay.format(context);
    print(res);

    await Firestore.instance
        .document(
            '$gbbatch/$gbbranch/Feedback/$gbrollNum/${DateFormat("dd-MM-yyyy").format(now)}/${timeOfDay.format(context)}')
        .setData({
      'name': name.text,
      'email': mail.text,
      'suggestion': suggestions.text,
      'time': res,
      'rollNum': gbrollNum,
      'batch': gbbatch,
      'branch': gbbranch,
    });
    Fluttertoast.showToast(
        msg: 'Thank you for your valuable feedback',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    name.dispose();
    mail.dispose();
    suggestions.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget getBox(String label, String hint, bool _validate, Icon i, int ml,
        int no, TextEditingController t, String errMsg) {
      return Container(
        padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
        child: TextFormField(
          keyboardType:
              no == 1 ? TextInputType.emailAddress : TextInputType.text,
          maxLines: ml,
          controller: t,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Colors.black54, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Colors.black, width: 1),
            ),
            errorText: _validate ? errMsg : null,
            labelText: label,
            labelStyle: TextStyle(color: Colors.blueGrey),
            //prefixIcon: icon,
            hasFloatingPlaceholder: true,
            icon: i,
            hintText: hint,
            border: OutlineInputBorder(borderSide: BorderSide()),
          ),
        ),
      );
    }

    Widget loadingIndicator = _load
        ? new Container(
            //color: Colors.white,
            width: 70.0,
            height: 70.0,
            child: new Padding(
              padding: const EdgeInsets.all(5.0),
              child: new Center(
                child: new CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
                ),
              ),
            ),
          )
        : new Container();

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: pridarkColor,
        title: Text(
          'Feedback Form',
          style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getBox(
                'Name',
                'Enter your name',
                validateN,
                Icon(
                  Icons.person,
                  color: pridarkColor,
                ),
                1,
                1,
                name,
                errMsgN),
            getBox(
                'E-mail',
                'Enter your mail',
                validateM,
                Icon(
                  Icons.mail,
                  color: pridarkColor,
                ),
                1,
                2,
                mail,
                errMsgM),
            getBox(
                'Message',
                'Do you have any Suggestion . . .',
                validateF,
                Icon(
                  Icons.message,
                  color: pridarkColor,
                ),
                6,
                3,
                suggestions,
                errMsgMe),
            SizedBox(
              height: 30,
            ),
            FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(0),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                child: const Text(
                  "Submit",
                  style: TextStyle(
                    fontFamily: "Lato",
                    color: Colors.white,
                    fontSize: 16,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              color: pridarkColor,
              //textColor: pridarkColor,
              onPressed: () async {
                time = await DateTime.now();
                setState(() {
                  validateN = false;
                  validateF = false;
                  validateM = false;
                  errMsgN = '';
                  errMsgM = '';
                  errMsgMe = '';
                  var i = 0;
                  final validCharacters = RegExp(r'^[a-zA-Z \.]+$');
                  if (name.text.isEmpty ||
                      !validCharacters.hasMatch(name.text)) {
                    validateN = true;
                    errMsgN = 'Invalid Name ';
                    i = 1;
                  }
                  if (mail.text.isEmpty ||
                      !EmailValidator.validate(mail.text)) {
                    validateM = true;
                    errMsgM = 'Invalid email';
                    i = 1;
                  }
                  if (suggestions.text.isEmpty) {
                    validateF = true;
                    errMsgMe = 'Message should not be null';
                    i = 1;
                  }
                  if (i == 0) {
                    getIStatus(); // net status check
                    if (iStatus) {
                      setState(() {
                        _load = true;
                        loadText = 'Wait for a while ......';
                      });
                      sendFeedback().whenComplete(() {
                        setState(() {
                          _load = false;
                          loadText = '';
                          name.clear();
                          suggestions.clear();
                          mail.clear();
                        });
                      });
                    } else {
                      Fluttertoast.showToast(
                          msg: 'No Internet Connection',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  }
                });
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 20,
            ),
            new Align(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  loadingIndicator,
                  Text(loadText),
                ],
              ),
              alignment: FractionalOffset.center,
            ),
          ],
        ),
      ),
    );
  }
}
