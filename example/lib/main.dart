// Copyright (c) 2024, the totaljs_flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// MIT-style license that can be found in the LICENSE file.

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
      home: const DefaultPage(),
    );
  }
}

class DefaultPage extends StatefulWidget {
  const DefaultPage({Key? key}) : super(key: key);

  @override
  _DefaultPageState createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  @override
  Widget build(BuildContext context) {
    return const Text('Hello from flutter');
  }
}
