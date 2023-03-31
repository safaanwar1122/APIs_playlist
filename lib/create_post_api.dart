import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class CreatePostAPI extends StatefulWidget {
  const CreatePostAPI({Key? key}) : super(key: key);

  @override
  State<CreatePostAPI> createState() => _CreatePostAPIState();
}

class _CreatePostAPIState extends State<CreatePostAPI> {
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  void accountCreate(String name, String job) async {
    try {
      Response response =
          await post(Uri.parse('https://reqres.in/api/users'), body: {
        'name': name,
        'job': job,
      });
      if (response.statusCode == 201) {
        var data = jsonDecode(response.body.toString());
        print(data);
        print(data['name']);
        print(data['job']);
        print(data['id']);
        print(data['createdAt']);
        print('account  created successfully');
      } else {
        print('account not created');
      }
    } catch (e) {
      print(e.toString());
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: '  name',
            ),
          ),
          SizedBox(
            height: 50,
          ),
          TextFormField(
            controller: jobController,
            decoration: InputDecoration(
              hintText: '  job',
            ),
          ),
          SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () {
              accountCreate(nameController.text.toString(),
                  jobController.text.toString());
            },
            child: Container(
              height: 70,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text('Press here '),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
