import 'package:flutter/material.dart';
import 'package:post_api_reqres/personal_data_getapi.dart';
import 'package:post_api_reqres/put_api_update.dart';
import 'package:post_api_reqres/register_unsuccessfull.dart';
import 'package:post_api_reqres/signup-screen.dart';
import 'package:post_api_reqres/login_screen.dart';
import 'create_post_api.dart';
import 'login_unsuccessful.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const SignUpScreen (),
      //home: LoginScreen(),
      //home:CreatePostAPI(),
      //home:RegisterUnsuccessful(),
      //home:LoginUnsuccessful(),
      //home: PutApiUpdate(),
      //home: GetPersonalDataAPI(),
    );
  }
}
