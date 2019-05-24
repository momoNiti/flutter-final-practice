import 'package:flutter/material.dart';
import 'package:flutter_final_practice/util/account.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RegisterScreenState();
  }
}

class RegisterScreenState extends State<RegisterScreen> {
  final _formkey = GlobalKey<FormState>();
  final AccountProvider db = AccountProvider();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  void open() async{
    await db.open('account.db');
  }

  @override
  Widget build(BuildContext context) {
    open();
    return Scaffold(
      appBar: AppBar(
        title: Text("Register new user"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: ListView(
          children: <Widget>[
            Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: userNameController,
                decoration: InputDecoration(labelText: "Username"),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value.isEmpty) return "Username is required";
                },
              ),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Name"),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value.isEmpty) return "Name is required";
                },
              ),
              TextFormField(
                controller: ageController,
                decoration: InputDecoration(labelText: "Age"),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) return "Age is required";
                },
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty && value.length < 8)
                    return "Password is required";
                },
              ),
              TextFormField(
                controller: rePasswordController,
                decoration: InputDecoration(labelText: "Re-Password"),
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty && value.length < 8)
                    return "Re-Password is required";
                },
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: RaisedButton(
                      child: Text("Register"),
                      onPressed: () {
                        if (_formkey.currentState.validate()) {
                          db
                              .insert(
                            Account(
                              userName: userNameController.text,
                              name: nameController.text,
                              age: int.parse(ageController.text),
                              password: passwordController.text,
                            ),
                          )
                              .then((_) {
                            Navigator.pop(context);
                          });
                        } else {
                          print("error");
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
          ],
        )

      ),
    );
  }
}
