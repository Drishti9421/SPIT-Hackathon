// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, avoid_print, avoid_unnecessary_containers

import 'dart:convert';

import 'package:app/widgets/colors.dart' as color;
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  late String tokenValue;
  late var url;
  late var response;
  var events;
  bool isloading = true;

  getTokenFromSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      tokenValue = prefs.getString('token')!;
    });
  }

  void fetch() async {
    url = Uri.parse('http://10.0.2.2:5000/allEvents');
    response = await get(url);
    print(response.body);
    setState(() {
      events = jsonDecode(response.body);
      isloading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTokenFromSF();
    fetch();
  }

  Future<void> _handleRefresh() async {
    return await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Center(
                  child: Text(
                'Events',
                style: TextStyle(
                    color: Colors.black, fontFamily: 'Poppins', fontSize: 25),
              )),
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            backgroundColor: Colors.white,
            body: LiquidPullToRefresh(
              onRefresh: _handleRefresh,
              color: Colors.deepPurple,
              height: 300,
              backgroundColor: Colors.deepPurple.shade200,
              animSpeedFactor: 10,
              showChildOpacityTransition: true,
              child: !isloading
                  ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: events.length,
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: EdgeInsets.only(
                              left: 25, right: 25, top: 15, bottom: 25),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Container(
                              height: 650,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        color.AppColor.gradientStartColor,
                                        color.AppColor.gradientEndColor
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      stops: [0.3, 0.7])),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 0.0),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: 320,
                                          width: 334,
                                          decoration: BoxDecoration(
                                              color: Colors.white24,
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(40),
                                                  bottomRight:
                                                      Radius.circular(40))),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 0),
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(left: 50),
                                                  width: 260,
                                                  height: 334,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              'lib/images/crocin.png'),
                                                          fit: BoxFit.fitWidth),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Title: ${events[i]['title']}',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'Description: ${events[i]['description']}',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'Date: ',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'Time: ${events[i]['time']}',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'Categories: ${events[i]['categories']}',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'Venue: ${events[i]['venue']}',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'Participants: ${(events[i]['participants'] ?? []).length}',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 0),
                                                height: 40,
                                                width: 200,
                                                decoration: BoxDecoration(
                                                    // gradient: LinearGradient(
                                                    //     colors: [
                                                    //       color.AppColor
                                                    //           .gradientStartColor,
                                                    //       color.AppColor
                                                    //           .gradientEndColor
                                                    //     ],
                                                    //     begin: Alignment.topCenter,
                                                    //     end: Alignment.bottomCenter,
                                                    //     stops: [0.1, 40]),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.white),
                                                child: TextButton(
                                                    onPressed: () {
                                                      print(tokenValue);
                                                    },
                                                    child: Text(
                                                      'Participate',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily: 'Poppins',
                                                          fontSize: 18),
                                                    )),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      })
                  : Center(
                      child: CircularProgressIndicator(
                      color: Colors.amberAccent,
                    )),
            )));
  }
}
