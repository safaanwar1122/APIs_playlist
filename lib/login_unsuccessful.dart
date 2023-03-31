import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class LoginUnsuccessful extends StatefulWidget {
  const LoginUnsuccessful({Key? key}) : super(key: key);

  @override
  State<LoginUnsuccessful> createState() => _LoginUnsuccessfulState();
}

class _LoginUnsuccessfulState extends State<LoginUnsuccessful> {
  TextEditingController  emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  void loginAccount(String email, String passord)async{
    Response response= await post(Uri.parse('https://reqres.in/api/login?email=peter@klaven'),
    body: {
      'email': email,
      'password':passord,
    });
    try{
      if(response.statusCode==400)
        {
          var data=jsonDecode(response.body.toString());
          print(data);
          print('login unsuccessful');
        }
    }
        catch(e){
      print(e.toString());
        }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Unsuccessfully'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: 'email',
            ),
          ),
          SizedBox(
            height: 50,
          ),
          TextFormField(
            controller:  passwordController,
            decoration: InputDecoration(
              hintText: 'password',
            ),
          ),SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () {
              loginAccount( emailController.text.toString(),
                  passwordController.text.toString());
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
