import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController=TextEditingController();
    TextEditingController passwordController=TextEditingController();
  void login(String email, String password)async{

    try{
      Response response=await post(Uri.parse('https://reqres.in/api/login'),body:
    {
      'email':email,
    'password':password,
    });
      if(response.statusCode==200){
        var data=jsonDecode(response.body.toString());
        print(data);
        print('login successfully');
      }
      else {
        print('login unsuccessful ');
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
        title: Text('Login Screen'),
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
            height: 20,
          ),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
              hintText: 'password',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: GestureDetector(
              onTap: (){
                login(emailController.text.toString(), passwordController.text.toString());
              },
              child: Container(
                height: 70,
                width: 100,

                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(' Press to Login '),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
