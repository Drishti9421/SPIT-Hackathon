// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unused_field, sort_child_properties_last, avoid_print, unused_local_variable, unused_import, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:ffi';

import 'package:app/pages/add_events.dart';
import 'package:app/pages/addfriends.dart';
import 'package:app/pages/events.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/widgets/colors.dart' as color;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String pass = "";
  String token = "";
  bool isLoading = true;

  addTokenToSF(token) async {
    print(token);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  Future<void> getData() async {
    print(email);
    print(pass);
    var res = await post(Uri.parse("http://10.0.2.2:5000/loginuser"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "email": email,
          "password": pass,
        }));
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      print(data);
      token = data["authToken"];
      print(token);
      await addTokenToSF(token);
      Get.to(() => HomePage());
    } else {
      throw "Error";
    }
  }
  // List<String> doctors = [
  //   'ayushtest@gmail.com',
  //   'ayush@doctor.com',
  //   "banner@doctor.com",
  //   'vinittest@gmail.com',
  //   'vinit@doctor.com',
  // ];

  // bool checkDoctor(String email) {
  //   if (doctors.contains(email)) {
  //     return true;
  //   }
  //   return false
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffb6ecfa),
      body: SafeArea(
        child: Container(
          height: 800,
          child: Stack(
            children: [
              Positioned(
                  top: 105,
                  right: -50,
                  child: Image.asset('lib/images/cloud.png')),
              Positioned(
                left: 20,
                top: 50,
                child: Container(
                  height: 150,
                  width: 240,
                  child: Text(
                    'Welcome Back',
                    style: TextStyle(
                        fontSize: 48,
                        color: Color(0xFF424242),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w800,
                        shadows: [
                          Shadow(
                              color: Color(0xFF424242).withOpacity(.1),
                              offset: Offset(1, 5),
                              blurRadius: 5)
                        ]),
                  ),
                ),
              ),
              Positioned(
                top: 225,
                left: 32,
                child: Container(
                  height: 394,
                  width: 320,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFf0f0f0).withOpacity(0.8),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(6, 6),
                        blurRadius: 12,
                        color: color.AppColor.gradientSecond.withOpacity(.2),
                      ),
                    ],
                  ),
                  child: Form(
                    // key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 26,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF424242)),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 300,
                          child: Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                              ),
                              child: TextFormField(
                                // validator: (val) => val!.isEmail
                                //     ? null
                                //     : 'Enter a valid email',
                                onChanged: (val) => email = val,
                                decoration: InputDecoration(
                                  labelText: 'Email Address',
                                  labelStyle: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFF8F9BB3),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300),
                                  hintText: 'example@email.com',
                                  hintStyle: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF8F9BB3),
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 300,
                          child: Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                              ),
                              child: TextFormField(
                                obscureText: true,
                                // validator: (val) => val!.length < 6
                                //     ? "Minimum 6 chars"
                                //     : null,
                                onChanged: (val) => pass = val,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFF8F9BB3),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300),
                                  // hintText: '*********',
                                  hintStyle: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF8F9BB3),
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                                fontSize: 17,
                                color: Color(0xff00c9ff),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Container(
                            height: 60,
                            width: 280,
                            child: Center(
                              child: TextButton(
                                  onPressed: () async {
                                    await getData();
                                  },
                                  //  async {
                                  //   if (_formKey.currentState!.validate()) {
                                  //     final result =
                                  //         await _auth.signInWithEmailPassword(
                                  //             email, pass);
                                  //     Get.to(() => HomePage());
                                  //     if (result != null) {
                                  //       String emailid =
                                  //           result.email.toString();
                                  //       if (checkDoctor(emailid)) {
                                  //         Get.to(() => DoctorBottomBar());
                                  //       } else {
                                  //         Get.to(() => HomePage());
                                  //       }
                                  //     }
                                  //   }
                                  // },
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: 21,
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )),
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    color.AppColor.gradientFirst
                                        .withOpacity(.9),
                                    color.AppColor.gradientSecond
                                        .withOpacity(1),
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(10, 10),
                                  blurRadius: 12,
                                  color: color.AppColor.gradientSecond
                                      .withOpacity(.1),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            'OR',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 22,
                                color: Color(0xFF8F9BB3)),
                          ),
                        ),
                        Center(
                          child: Text(
                            'Create Account',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xff00c9ff),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 150,
                margin: EdgeInsets.only(top: 640, left: 10),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'lib/images/login_logo.png',
                        ),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                  right: 0,
                  top: -80,
                  left: 200,
                  child: Container(
                    height: 550,
                    width: 380,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              'lib/images/bird_flying.gif',
                            ),
                            fit: BoxFit.fitHeight)),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
