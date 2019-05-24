import 'package:flutter/material.dart';
import 'package:flutter_final_practice/ui/login_screen.dart';
import 'package:flutter_final_practice/ui/register_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xfff06292),
      ),
      initialRoute: "login",
      routes: {
        'login': (context) => LoginScreen(),
        'register': (context) => RegisterScreen()
      }
    );
  }
}