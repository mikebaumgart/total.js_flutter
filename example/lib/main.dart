// Copyright (c) 2024, the totaljs_flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:totaljs_flutter/total5.dart';

// Total.js OpenLogger Service
final logger = OpenLogger(
    token: '<replace-with-your-token>',
    url: 'https://openlogger.yourdomain.tld',
    autoConfig: true,
  );

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
  // OpenLogger Service Call
  logger.log(type: 'Info', message: 'Total.js Flutter Demo App Started');
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Total.js Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: UnitedShareAppBarWidget(
      automaticallyImplyLeading: true,
      title: const Text(
        "Total.js",
        style: TextStyle(color: Colors.white),
      ),
      toolbarHeight: 56,
      leadingWidth: 50,
      centerTitle: true,
      backgroundColor: Colors.green,
      statusBarColor: Colors.blueGrey,
      elevation: 10,
      shadowColor: Colors.black,
      //sideMargin: 10,
      shapeBorder: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
      onBackButtonTapped: (BuildContext context) {},
    ),
  );
  }
}
