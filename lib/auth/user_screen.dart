import 'dart:convert';
import 'package:api_testing/auth/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/UserModel.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List<UserModel> userList = [];

  var data;

  // another way to handle the api response
  Future<void> getData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {
      print("data are not find");
    }
  }

  // api method to calling the api when get the data from server side
  // first way to get the api response data
  Future<List<UserModel>> getUserApi() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    final response = await http.get(url);
    final data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      userList.clear();
      for (Map i in data) {
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'User Profile',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          //2nd way to api data show in the listing if data are not popularity in the queue
          Expanded(
            child: FutureBuilder(
              future: getUserApi(),
              builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                } else {
                  return ListView.builder(
                      itemCount: userList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const LastExampleScreen()));
                          },
                          child: Card(
                            elevation: 5,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Reuseable(
                                      title: 'Name',
                                      value: snapshot.data![index].name
                                          .toString()),
                                  Reuseable(
                                      title: 'username',
                                      value: snapshot.data![index].username
                                          .toString()),
                                  Reuseable(
                                      title: 'email',
                                      value: snapshot.data![index].email
                                          .toString()),
                                  Reuseable(
                                      title: 'Geo',
                                      value: snapshot
                                          .data![index].address!.geo!.lat
                                          .toString()),
                                  Reuseable(
                                      title: 'Address',
                                      value: snapshot
                                          .data![index].address!.street
                                          .toString()),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class Reuseable extends StatelessWidget {
  String title, value;

  Reuseable({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}

// first way to send and get the data and show in the list
// Expanded(
//   child: FutureBuilder(
//     future: getData(),
//     builder: (context,  snapshot) {
//       if (snapshot.connectionState == ConnectionState.waiting) {
//         return const CircularProgressIndicator();
//       } else {
//         return ListView.builder(
//             itemCount: data.length,
//             itemBuilder: (context, index) {
//               return Card(
//                 child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(children: [
//                       Reuseable(
//                           title: 'Name',
//                           value: data[index]['name'].toString()),
//                       Reuseable(
//                           title: 'username',
//                           value: data[index]['username'].toString()),
//                       Reuseable(
//                           title: 'email',
//                           value: data[index]['email'].toString()),
//                       Reuseable(
//                           title: 'Geo',
//                           value: data[index]['address']['geo'].toString()),
//                       Reuseable(
//                           title: 'Address',
//                           value: data[index]['address']['street'].toString()),
//                     ])),
//               );
//             });
//       }
//     },
//   ),
// )
