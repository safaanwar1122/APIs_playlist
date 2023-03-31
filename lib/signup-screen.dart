import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 void login(String email, password)async {
   try{
     Response response=await post(Uri.parse('https://reqres.in/api/register'),
     body:{
       'email':email,
       'password':password
     }
     );

     if(response.statusCode==200)
       {
         var data=jsonDecode(response.body.toString());
        print(data);
         print(data['token']);
         print(data['id']);

         print('account created successfully');
       }
     else {
       print ('account not created');
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
        title: Text('Post API integration'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
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
          ), SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: (){
              login(emailController.text.toString(), passwordController.text.toString());
              
            },
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.lime,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text('Sign Up'),
                
              ),
            ),
          ),
        ],
      ),
    );
  }
}
