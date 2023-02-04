// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddEventsPage extends StatefulWidget {
  const AddEventsPage({super.key});

  @override
  State<AddEventsPage> createState() => _AddEventsPageState();
}

class _AddEventsPageState extends State<AddEventsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 40),
              child: InkWell(
                child: Icon(Icons.arrow_back_ios_new),
                onTap: () {
                  Get.to(() => HomePage());
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 120.0, top: 35),
              child: Text(
                'Add Events',
                style: TextStyle(
                    fontSize: 26,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Container(
                margin: EdgeInsets.all(20),
                height: 770,
                width: 700,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        colors: [Color(0xff9356fb), Color(0xffb772ea)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.3, 0.7])),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Event Name:',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  color: Colors.white)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Beach Cleaning Drive',
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 246, 242, 247),
                                fontSize: 14),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 3, color: Colors.white)),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 3, color: Colors.white),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Description:',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  color: Colors.white)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Cleaning drive at Juhu Beach',
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 246, 242, 247),
                                fontSize: 14),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 3, color: Colors.white)),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 3, color: Colors.white),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Date:',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  color: Colors.white)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: '28-12-2',
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 246, 242, 247),
                                fontSize: 14),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 3, color: Colors.white)),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 3, color: Colors.white),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Time',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  color: Colors.white)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: '06.00am',
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 246, 242, 247),
                                fontSize: 14),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 3, color: Colors.white)),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 3, color: Colors.white),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Categories:',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  color: Colors.white)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Cleaning',
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 246, 242, 247),
                                fontSize: 14),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 3, color: Colors.white)),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 3, color: Colors.white),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Add Image:',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  color: Colors.white)),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 320,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.image,
                              color: Colors.white,
                              size: 40,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              ':  Add File',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Poppins'),
                            )
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 2.5),
                        color: Colors.white.withOpacity(.0),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        onPressed: () {
                          //submit button
                        },
                        child: Text(
                          'Submit',
                          style:
                              TextStyle(fontSize: 26, color: Color(0xffffffff)),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
