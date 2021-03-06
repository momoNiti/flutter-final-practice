import 'package:flutter/material.dart';
import 'package:flutter_final_practice/ui/home_screen.dart';
import 'package:flutter_final_practice/util/account.dart';
import 'package:flutter_final_practice/util/sharepref.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final AccountProvider db = AccountProvider();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void initState() {
    super.initState();
    this.db.open('account.db');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGIN"),
      ),
      body: Padding(
          padding: EdgeInsets.all(18),
          child: ListView(
            children: <Widget>[
              Center(
                child: Image.asset(
                  'assets/dog.jpg',
                  width: 250,
                ),
              ),
              Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(labelText: "Email"),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value.isEmpty) return "Email is required";
                      },
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(labelText: "Password"),
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) return "Password is required";
                      },
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: RaisedButton(
                            child: Text("Sign in"),
                            onPressed: () {
                              if (_formkey.currentState.validate()) {
                                db
                                    .getAccountByUserId(emailController.text)
                                    .then((account) {
                                  if (account == null ||
                                      passwordController.text !=
                                          account.password) {
                                    print("no account or wrong password");
                                  } else {
                                    SharedPreferencesUtil.saveLastLogin(emailController.text);
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HomeScreen(account)),
                                    );
                                  }
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    FlatButton(
                      child: Text("Register new user"),
                      padding: EdgeInsets.only(
                        left: 200,
                        right: 0,
                        top: 0,
                        bottom: 0,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "register");
                      },
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
