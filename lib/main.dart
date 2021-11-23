import 'package:findfault/XDGooglePixel51.dart';
import 'package:findfault/XD_intro.dart';
import 'package:findfault/XDintor2.dart';
import 'package:findfault/XDintor22.dart';
import 'package:findfault/states/authen.dart';
import 'package:findfault/states/ceate_database.dart';
import 'package:findfault/states/require_data.dart';
import 'package:findfault/states/show_map.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

final Map<String, WidgetBuilder> map = {
  // '/authen': (BuildContext context) => Authen(),
  '/requireData': (BuildContext context) => ReqireData(),
  '/createdatabase': (BuildContext context) => CreateDatabase(),
  '/intro': (BuildContext context) => XDintor2(),
  '/intro2': (BuildContext context) => XDGooglePixel51(),
  '/intro3': (BuildContext context) => XDintor22(),
};

String? firstState;

void main() {
  // firstState = '/intro';
  firstState = '/createdatabase';
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: map,
      initialRoute: firstState,
    );
  }
}
