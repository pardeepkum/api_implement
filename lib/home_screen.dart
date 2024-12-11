import 'dart:convert';

import 'package:api_testing/auth/profile_Screen.dart';
import 'package:api_testing/auth/signin.dart';
import 'package:flutter/material.dart';
import 'package:api_testing/model/home_model.dart';
import 'home_repositry.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Post>> postFuture;
  // Future<List<Post>> postGesture = getPosts();

  @override
  void initState() {
    super.initState();
    postFuture = HomeRepository().getPost();
  }

  // static Future<List<Post>> getPosts() async {
  //   var url = Uri.parse('https.google.com');
  //   final response =
  //       await http.get(url, headers: {'Content-Type': 'application/json'});
  //   final List body = json.decode(response.body);
  //   return body.map((e) => Post.fromJson(e)).toList();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: FutureBuilder<List<Post>>(
        future: postFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available'));
          } else {
            final posts = snapshot.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ProfileScreen()));
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white),
                    child: ListTile(
                      leading: post.url == null
                          ? const SizedBox.shrink()
                          : Image.network(
                              post.url.toString(),
                              height: 40,
                            ),
                      title: Text(post.title.toString()),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
