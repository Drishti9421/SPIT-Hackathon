// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables, unused_field, unused_import, prefer_const_constructors

import 'dart:convert';

import 'package:app/pages/expene.dart';
import 'package:app/pages/classifier.dart';
import 'package:app/pages/google_maps_page.dart';
import 'package:app/pages/articles.dart';
import 'package:app/pages/expene.dart';
import 'package:app/pages/login_page.dart';
import 'package:app/pages/marketplace.dart';
import 'package:app/pages/userprofile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import 'pages/add_events.dart';
import 'pages/addfriends.dart';
import 'pages/book_car.dart';
import 'pages/book_car_final.dart';
import 'pages/dashboard.dart';
import 'pages/ecofriendly.dart';
import 'pages/events.dart';
import 'pages/home_page.dart';
import 'pages/recyling.dart';
import 'pages/rentacar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ReportProfile());
  }
}
