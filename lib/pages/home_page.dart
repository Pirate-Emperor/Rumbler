import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //backgroundColor: Colors.white,
          //elevation: 0.0,
          //iconTheme: IconThemeData(color: Colors.black),
          title: Center(
        child: Text(
          "Catalog App    ", /*style: TextStyle(color: Colors.black)*/
        ),
      )),
      body: Center(
        child: Container(
          child: Text("Welcome to Flutter"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
