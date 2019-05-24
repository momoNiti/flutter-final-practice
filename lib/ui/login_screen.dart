import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("LOGIN"),),
      body: Padding(
          padding: EdgeInsets.all(18),
          child: ListView(
            children: <Widget>[
              Center(
                child: Image.asset('assets/dog.jpg', width: 250,) ,
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
                              if(_formkey.currentState.validate()){
                                print("hello");
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
