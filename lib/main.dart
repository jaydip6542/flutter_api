import 'package:flutter/material.dart';
import 'package:inteviewfacebookdemotest/getapipage/getapidemo.dart';
import 'package:inteviewfacebookdemotest/postapipage/postapidemo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Postapipagedemo(),
    );
  }
}


