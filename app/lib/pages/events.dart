// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, avoid_print, avoid_unnecessary_containers, prefer_if_null_operators

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
  late String uid;
  late var url;
  late var response;
  var events;
  bool isloading = true;
  bool participated = false;

  getTokenFromSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      tokenValue = prefs.getString('token')!;
      fetchUser();
    });
  }

  void participate(id) async {
    print(id);
    url = Uri.parse('http://10.0.2.2:5000/participate');
    response = await post(
      url,
      headers: {"auth-token": tokenValue, "Content-Type": "application/json"},
      body: jsonEncode({
        "eventid": id,
      }),
    );

    setState(() {
      participated = true;
    });
  }

  void fetch() async {
    url = Uri.parse('http://192.168.137.228:5000/allEvents');
    response = await get(url);
    print(response.body);
    setState(() {
      events = jsonDecode(response.body);
      print(events[0]['participantid']);
      isloading = false;
    });
  }

  void fetchUser() async {
    url = Uri.parse('http://10.0.2.2:5000/getUserId');
    response = await get(url, headers: {"auth-token": tokenValue});
    print(response.body);
    setState(() {
      var u = jsonDecode(response.body);
      uid = u['_id'];
    });
  }

  @override
  void initState() {
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
                                padding: const EdgeInsets.only(left: 0),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: 300,
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
                                                      EdgeInsets.only(left: 0),
                                                  width: 324,
                                                  height: 500,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              'lib/images/beach_drive.webp'),
                                                          fit: BoxFit.fill),
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
                                                'Participants: ${(events[i]['participantid'] ?? []).length}',
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
                                                    onPressed: participated
                                                        ? null
                                                        : () {
                                                            // ignore: unused_label
                                                            print(tokenValue);
                                                            participate(
                                                                events[i]
                                                                    ['_id']);
                                                          },
                                                    style: TextButton.styleFrom(
                                                      disabledForegroundColor:
                                                          Colors.grey
                                                              .withOpacity(
                                                                  0.38),
                                                    ),
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
