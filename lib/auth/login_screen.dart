import 'dart:convert';

import 'package:api_testing/auth/phots_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/PostModel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  List<PostModel> postList = [];

  Future<List<PostModel>> getPostApi() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await http.get(url);
    final result = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      // var result = json.decode(response.body);
      postList.clear();
      for (Map i in result) {
        postList.add(PostModel.fromJson(i));
      }
      return postList;
    } else {
      print("api not get the response");
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text(
            'Post listing',
            style: TextStyle(color: Colors.white),
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPostApi(),
                builder: (context, snapShot) {
                  if (!snapShot.hasData) {
                    return const Text('Loading');
                  } else {
                    return ListView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        itemCount: postList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const PhotoScreen()));
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.blueAccent.shade100),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Id\n${postList[index].id}',
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Title\n${postList[index].title}',
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Description\n${postList[index].body}',
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  }
                }),
          )
        ],
      ),
    );
  }
}
