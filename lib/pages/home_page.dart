import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(5, (index) => CatalogModel.items[0]);
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
            itemCount: dummyList.length,
            itemBuilder: (context, index) {
              return ItemWidget(item: dummyList[index]);
            }),
      ),
      drawer: MyDrawer(),
    );
  }
}
