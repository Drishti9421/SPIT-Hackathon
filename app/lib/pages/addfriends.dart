// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, prefer_typing_uninitialized_variables, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/popular_doctors_user.dart';

class AddFriends extends StatefulWidget {
  const AddFriends({Key? key}) : super(key: key);

  @override
  State<AddFriends> createState() => _AddFriendsState();
}

class _AddFriendsState extends State<AddFriends> {
  late String tokenValue;
  late var url;
  late var response;
  var users;
  bool isloading = true;

  getTokenFromSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      tokenValue = prefs.getString('token')!;
      fetch();
    });
  }

  void fetch() async {
    url = Uri.parse('http://10.0.2.2:5000/getAllUsers');
    print("ass" + tokenValue);
    response = await get(url, headers: {"auth-token": tokenValue});
    print(response.body);
    setState(() {
      users = jsonDecode(response.body);
      print(users[0]);
      isloading = false;
    });
  }

  @override
  void initState() {
    getTokenFromSF();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          title: Text(
            "Add Friends",
            style: TextStyle(fontFamily: 'Poppins', fontSize: 22),
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
        body: Column(
          children: [
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
                    style: TextStyle(
                        color: Color(
                          0xFF8AA0BC,
                        ),
                        fontFamily: 'Poppins',
                        fontSize: 14),
                  ),
                  SizedBox(
                    width: 150,
                  ),
                  Image.asset('lib/images/Vector.png')
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Recommended People',
                      style: TextStyle(
                          color: Color(0xFF253141),
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 80,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('lib/images/friend2.png')),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('lib/images/friend3.png')),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('lib/images/friend4.png')),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('lib/images/friend5.png')),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('lib/images/doc12.png')),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('lib/images/doc16.jpg')),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('lib/images/doc17.jpg')),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      'Mutual Friends',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
                height: 420,
                width: 360,
                child: !isloading
                    ? ListView.builder(
                        itemCount: users.length,
                        itemBuilder: (context, i) {
                          return PopularCard(
                            uid: users[i]['_id'],
                            token: tokenValue,
                            color1: Colors.white,
                            disease1: users[i]['address'],
                            doctorName: users[i]['name'],
                            image2: 'lib/images/friend${i + 1}.png',
                            text3: '${i + 5} Mutuals',
                          );
                        })
                    : Text("Hello"))
          ],
        ),
      )),
    );
  }
}



// import 'package:flutter/material.dart';

// class SearchBarScreen extends StatefulWidget {
//   const SearchBarScreen({Key? key}) : super(key: key);

//   @override
//   State<SearchBarScreen> createState() => _SearchBarScreenState();
// }

// class _SearchBarScreenState extends State<SearchBarScreen> {
//   final List<Map<String, dynamic>> _allUsers = [
//     {
//       "image":
//           "https://im.rediff.com/300-300/movies/2019/oct/14neeraj-madhav2.jpg",
//       "id": 1,
//       "name": "Dr. Manu Kumar",
//       "des": "Co-founder & CEO @ ",
//     },
//     {
//       "id": 2,
//       "name": "BL Kumawat",
//       "des": "Co-founder & CEO @ ",
//       "image":
//           "https://upload.wikimedia.org/wikipedia/en/4/47/Iron_Man_%28circa_2018%29.png",
//     },
//     {
//       "id": 3,
//       "name": "Rohit Kumar",
//       "des": "Co-founder & CEO @ ",
//       "image":
//           "https://sa1s3optim.patientpop.com/assets/images/provider/photos/1888657.jpg",
//     },
//     {
//       "id": 4,
//       "name": "Mitesh Raj",
//       "des": "Co-founder & CEO @ ",
//       "image":
//           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_LmG47_W3RM0QBVGI23-vodL_oOOJxLIBrg&usqp=CAU",
//     },
//     {
//       "id": 5,
//       "name": "Dr. Manu Kumar",
//       "des": "Co-founder & CEO @ ",
//       "image":
//           "https://img.freepik.com/free-photo/black-man-city_1157-17027.jpg?w=2000",
//     },
//     {
//       "id": 6,
//       "name": "Deno James",
//       "des": "Co-founder & CEO @ ",
//       "image":
//           "https://media.gettyimages.com/photos/portrait-of-smiling-mid-adult-man-wearing-tshirt-picture-id985138674?s=612x612",
//     },
//     {
//       "id": 7,
//       "name": "Kaviraj Patil",
//       "des": "Co-founder & CEO @ ",
//       "image":
//           "https://image.shutterstock.com/image-photo/handsome-young-man-running-across-260nw-587931092.jpg",
//     },
//     {
//       "id": 8,
//       "name": "Raja Ram",
//       "des": "Co-founder & CEO @ ",
//       "image":
//           "https://media.istockphoto.com/photos/portrait-of-young-happy-indian-business-man-executive-looking-at-picture-id1309489745?b=1&k=20&m=1309489745&s=170667a&w=0&h=Wo_7nESC_ePyEYfEsnOm-rP6ElkxbWqIB3Ga4W3nw8M=",
//     },
//     {
//       "id": 9,
//       "name": "Caversky",
//       "des": "Co-founder & CEO @ ",
//       "image":
//           "https://media.istockphoto.com/photos/young-man-looking-at-digital-tablet-picture-id1184382530?k=20&m=1184382530&s=612x612&w=0&h=-G67wR9BU2-XqLTR70purl0vb2PFbu3OAg0T7O_ZpiI=",
//     },
//     {
//       "id": 10,
//       "name": "Becky",
//       "des": "Co-founder & CEO @ ",
//       "image":
//           "https://e0.365dm.com/22/06/2048x1152/skysports-erling-haaland-man-city_5803257.jpg",
//     },
//   ];

//   // This list holds the data for the list view
//   List<Map<String, dynamic>> _foundUsers = [];
//   @override
//   initState() {
//     // at the beginning, all users are shown
//     _foundUsers = _allUsers;
//     super.initState();
//   }

//   // This function is called whenever the text field changes
//   void _runFilter(String enteredKeyword) {
//     List<Map<String, dynamic>> results = [];
//     if (enteredKeyword.isEmpty) {
//       // if the search field is empty or only contains white-space, we'll display all users
//       results = _allUsers;
//     } else {
//       results = _allUsers
//           .where((user) =>
//               user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
//           .toList();
//       // we use the toLowerCase() method to make it case-insensitive
//     }

//     // Refresh the UI
//     setState(() {
//       _foundUsers = results;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text('User List'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           children: [
//             TextField(
//              // onChanged: (value) => _runFilter(value),
//               decoration: InputDecoration(
//                 contentPadding:
//                     const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
//                 hintText: "Search",
//                 suffixIcon: const Icon(Icons.search),
//                 // prefix: Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20.0),
//                   borderSide: const BorderSide(),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Expanded(
//               child: _foundUsers.isNotEmpty
//                   ? ListView.builder(
//                       itemCount: _foundUsers.length,
//                       itemBuilder: (context, index) => Card(
//                         elevation: 1,
//                         margin: const EdgeInsets.symmetric(vertical: 2),
//                         child: ListTile(
//                           leading: CircleAvatar(
//                             radius: 30.0,
//                             backgroundImage:
//                                 NetworkImage(_foundUsers[index]['image']),
//                             backgroundColor: Colors.transparent,
//                           ),
//                           title: Text(_foundUsers[index]['name']),
//                           subtitle: Text('${_foundUsers[index]["des"]}'),
//                         ),
//                       ),
//                     )
//                   : const Text(
//                       'No results found Please try with diffrent search',
//                       style: TextStyle(fontSize: 24),
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

