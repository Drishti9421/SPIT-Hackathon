// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CarPool extends StatefulWidget {
  const CarPool({Key? key}) : super(key: key);

  @override
  State<CarPool> createState() => _CarPoolState();
}

class _CarPoolState extends State<CarPool> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          title: Text("Car Pool"),
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
        body: Column(children: [
          Container(
            height: 60,
            width: 340,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Color(0xFFEEF6FC),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                SizedBox(width: 10),
                Icon(
                  Icons.search,
                  size: 28,
                  color: Color(0xFF8AA0BC),
                ),
                SizedBox(width: 5),
                Text(
                  'Search Friends...',
                  style: TextStyle(color: Color(0xFF8AA0BC)),
                ),
                SizedBox(
                  width: 150,
                ),
                Image.asset('lib/images/Vector.png'),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 7.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 370,
                  height: 290,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color.fromARGB(255, 238, 233, 233),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 7),
                        padding: const EdgeInsets.only(left: 35.0),
                        width: 110,
                        height: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('lib/images/crocin.png'),
                                fit: BoxFit.fitHeight),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 60.0,
                        ),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'Book Car Pool',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              ' Book a car pool as \n a reward with the points \n you earned on our app. \n rewards to book a \n car',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 7.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 370,
                  height: 290,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color.fromARGB(255, 238, 233, 233),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        padding: const EdgeInsets.only(left: 35.0),
                        width: 120,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            image: DecorationImage(
                                image: AssetImage('lib/images/dolo.jpg'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      SizedBox(
                        width: 11,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 60.0,
                        ),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'Start Car Pool',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              ' Start a car pool and \n earn points \n which you can use to \n redeem rewards',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}
