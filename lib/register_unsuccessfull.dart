import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
class RegisterUnsuccessful extends StatefulWidget {
  const RegisterUnsuccessful({Key? key}) : super(key: key);

  @override
  State<RegisterUnsuccessful> createState() => _RegisterUnsuccessfulState();
}

class _RegisterUnsuccessfulState extends State<RegisterUnsuccessful> {

 TextEditingController  emailController=TextEditingController();
 TextEditingController passwordController=TextEditingController();
 void  registerAccount(String email, String password)async{
   try{
     Response response = await post(Uri.parse('https://reqres.in/api/register?email=sydney@fife'),
     body: {
       'email':email,
      'password':password,
     });
     if(response.statusCode==400)
       {
         var data=jsonDecode(response.body.toString());
         print(data);
         print('Missing email or username');
       }
     else {
       print('Missing email/ password');
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
        title: Text('Register Unsuccessfull'),
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
              registerAccount( emailController.text.toString(),
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
