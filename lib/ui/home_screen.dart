import 'package:flutter/material.dart';
import 'package:flutter_final_practice/util/account.dart';
class HomeScreen extends StatefulWidget{
  final Account account;
  HomeScreen(this.account);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeScreenState();
  }

}
class HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),),
      body: Container(
        child: Text(widget.account.name),
      )
    );
  }

}