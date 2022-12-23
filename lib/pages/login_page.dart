import 'package:flutter/material.dart';
import 'package:flutter_application_1/utility/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //const LoginPage({super.key});
  String name = "";
  String com = ", ";
  String sir = " Monsiuer";
  bool changebut = false;
  int butcount = 0;
  final _formkey = GlobalKey<FormState>();

  logToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changebut = true;
        butcount++;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changebut = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset("assets/images/undraw_Mobile_login_re_9ntv.png",
                  fit: BoxFit.cover),
              Text("Welcome to the Login Page$name",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 34.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter Username",
                        labelText: "Username",
                      ),
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "Username cannot be empty";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        if (value.toString().isEmpty == false) {
                          name = com + value + sir;
                        } else
                          name = "";
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                      ),
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.toString().length < 8) {
                          return "Password cannot be less than 8 characters";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Material(
                      color: Colors.deepPurple,
                      // shape: butcount % 2 == 1
                      //     ? BoxShape.circle
                      //     : BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(changebut ? 50 : 6),

                      child: InkWell(
                        onTap: () => logToHome(context),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changebut ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
                          child: changebut
                              ? Icon(Icons.done, color: Colors.white)
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                        ),
                      ),
                    ),

                    // ElevatedButton(
                    //   onPressed: () {
                    //     print("Yo");
                    //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //   },
                    //   child: Text("Login"),
                    //   style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
