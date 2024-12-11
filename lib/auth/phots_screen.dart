import 'dart:convert';

import 'package:api_testing/auth/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({super.key});

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  List<Photos> photoList = [];

  Future<List<Photos>> getPhoto() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    final response = await http.get(url);
    final data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        Photos photos = Photos(title: i['title'], url: i['url'], id: i['id']);
        photoList.add(photos);
      }
      return photoList;
    } else {
      return photoList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text(
            'Photos listing',
            style: TextStyle(color: Colors.white),
          )),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPhoto(),
                builder: (context, AsyncSnapshot<List<Photos>> snapShot) {
                  return ListView.builder(
                      itemCount: photoList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const UserScreen()));
                          },
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.blueAccent),
                              child: ListTile(
                                title: Text(
                                  snapShot.data![index].id.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      snapShot.data![index].url.toString()),
                                ),
                                subtitle: Text(
                                  snapShot.data![index].title.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              )),
                        );
                      });
                }),
          ),
        ],
      ),
    );
  }
}

class Photos {
  String title, url;
  int id;
  Photos({required this.title, required this.url, required this.id});
}
