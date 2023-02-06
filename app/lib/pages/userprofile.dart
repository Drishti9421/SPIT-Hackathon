// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';

class ReportProfile extends StatefulWidget {
  const ReportProfile({Key? key}) : super(key: key);

  @override
  State<ReportProfile> createState() => _ReportProfileState();
}

class _ReportProfileState extends State<ReportProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          foregroundColor: Colors.black,
          title: Text(
            "Report",
            style: TextStyle(fontFamily: 'Poppins'),
          ),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    width: 350,
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 50.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Points',
                                  style: TextStyle(
                                      color: Color(0xFF0E1012),
                                      fontFamily: 'Poppins',
                                      fontSize: 24),
                                ),
                                SizedBox(
                                  height: 0,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '96',
                                      style: TextStyle(
                                          fontFamily: 'Poppins', fontSize: 58),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: Text(
                                        '',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 14),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 80),
                            height: 200,
                            width: 170,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fitWidth,
                                    image:
                                        AssetImage('lib/images/reward.png'))),
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xFFDCEDF9),
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Row(
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Color(0xFFFF5E1E9),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12.0, top: 10),
                                  child: Icon(
                                    Icons.water_drop,
                                    color: Color(0xFF9D4C6C),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 12.0, top: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                          'lib/images/Vector2.png',
                                        ))),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                'Community',
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontFamily: 'Poppins'),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                'NSS ',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                color: Color(0xFFFAF0DB),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12.0, top: 10),
                                        child: Icon(
                                          Icons.monitor_weight_rounded,
                                          color: Color(0xFFE09F1F),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 12.0, top: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                'lib/images/Vector2.png',
                                              ))),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      'Followers',
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.black,
                                          fontFamily: 'Poppins'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      '12',
                                      style: TextStyle(
                                        fontSize: 22,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 9.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Latest Report',
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 18),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 320,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.grey.shade200,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 80,
                              height: 60,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('lib/images/pose_.png'),
                                      fit: BoxFit.contain),
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                            SizedBox(
                              width: 00,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Participated in Events',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 0,
                                  ),
                                  Text('8 files',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w100)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 65,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Icon(Icons.arrow_forward_ios_rounded),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 320,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.grey.shade200,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 80,
                              height: 60,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('lib/images/report.png'),
                                      fit: BoxFit.contain),
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                            SizedBox(
                              width: 00,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Started Car Pool',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 0,
                                  ),
                                  Text('8 files',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w100)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 65,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Icon(Icons.arrow_forward_ios_rounded),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
