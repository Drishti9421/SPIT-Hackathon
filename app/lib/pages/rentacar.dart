// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:app/widgets/colors.dart' as color;

class RentCar extends StatefulWidget {
  const RentCar({super.key});

  @override
  State<RentCar> createState() => _RentCarState();
}

class _RentCarState extends State<RentCar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Text(
              'Rent a Car',
              style: TextStyle(
                  fontFamily: 'Poppins', fontSize: 28, color: Colors.black),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(left: 25, right: 25, top: 40, bottom: 25),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Container(
              height: 552,
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
                        // Container(
                        //   child: Text(
                        //     'Book a Car',
                        //     style: TextStyle(
                        //         fontSize: 30,
                        //         fontFamily: 'Poppins',
                        //         color: Colors.white),
                        //   ),
                        // ),
                        SizedBox(
                          height: 0,
                        ),
                        Container(
                          height: 300,
                          width: 334,
                          decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(40))),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 0),
                                child: Container(
                                  margin: EdgeInsets.only(left: 0),
                                  width: 324,
                                  height: 500,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'lib/images/beach_drive.webp'),
                                          fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(30)),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                ' Start a car pool and \n earn points \n which you can use to \n redeem rewards',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400),
                              ),
                              // Text(
                              //   'with you earned on our app',
                              //   style: TextStyle(
                              //       fontSize: 18,
                              //       fontFamily: 'Poppins',
                              //       color: Colors.white),
                              // ),
                              // SizedBox(
                              //   height: 10,
                              // ),
                              // Text(
                              //   'rewards to book a car',
                              //   style: TextStyle(
                              //       fontSize: 18,
                              //       fontFamily: 'Poppins',
                              //       color: Colors.white),
                              // ),
                              SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: Container(
                                  margin: EdgeInsets.only(left: 25),
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
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white),
                                  child: TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        disabledForegroundColor:
                                            Colors.grey.withOpacity(0.38),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Rent a Car',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Poppins',
                                              fontSize: 18),
                                        ),
                                      )),
                                ),
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
        ),
      ),
    );
  }
}
