import 'package:flutter/material.dart';
import 'package:flutter_final_practice/util/account.dart';
import 'package:flutter_final_practice/util/sharepref.dart';

class HomeScreen extends StatefulWidget {
  final Account account;
  HomeScreen(this.account);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  String quotes = "";
  void initState() {
      super.initState();
      SharedPreferencesUtil.loadQuote().then((value) {
        setState(() {
          quotes = value;
        });
      });
    }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("Hello ${widget.account.userName}"),
            subtitle: Text("Your quotes is ${quotes}"),
          ),
          RaisedButton(
            child: Text("PROFILE SETUP"),
            onPressed: () {
              Navigator.of(context).pushNamed('profile');
            },
          ),
          RaisedButton(
            child: Text("LOGOUT"),
            onPressed: () {
              SharedPreferencesUtil.saveLastLogin(null);
              SharedPreferencesUtil.saveQuote(null);
              Navigator.of(context).pushNamed('login');
            },
          ),
        ],
      ),
    );
  }
}
