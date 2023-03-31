import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class PutApiUpdate extends StatefulWidget {
  const PutApiUpdate({Key? key}) : super(key: key);

  @override
  State<PutApiUpdate> createState() => _PutApiUpdateState();
}

class _PutApiUpdateState extends State<PutApiUpdate> {
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  Future<void> putAPIUpdate(String name, String job) async {
    try {
      Response response =
          await put(Uri.parse('https://reqres.in/api/users/2'), body: {
        'name': name,
        'job': job,
      });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        print(data['name']);
        print(data['job']);
        print(data['updatedAt']);
      } else {
        print('error exist');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Unsuccessfull'),
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: '  name',
            ),
          ),
          SizedBox(
            height: 40,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: '  job',
            ),
          ),
          SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () {
              putAPIUpdate(nameController.text.toString(),
                  jobController.text.toString());
            },
            child: Container(
              height: 70,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.pink,
              ),
              child: Center(
                child: Text('press here'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
