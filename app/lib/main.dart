// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables, unused_field, unused_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage());
  }
}
