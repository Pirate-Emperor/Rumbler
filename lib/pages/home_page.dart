import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to Flutter"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
