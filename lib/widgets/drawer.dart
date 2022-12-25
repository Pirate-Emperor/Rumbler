import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  final imgurl1 =
      "https://w0.peakpx.com/wallpaper/908/997/HD-wallpaper-one-piece-luffy-thumbnail.jpg";
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: Colors.deepPurple,
      child: ListView(
        children: [
          DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.green),
                margin: EdgeInsets.zero,
                accountName: Text("Rahul Singh"),
                accountEmail: Text("rahulramanbro@gmail.com"),
                currentAccountPicture:
                    CircleAvatar(backgroundImage: NetworkImage(imgurl1)),
                //currentAccountPicture: Image.network(imgurl1),
              )),
          ListTile(
            leading: Icon(CupertinoIcons.home, color: Colors.white),
            title: Text(
              "Home",
              textScaleFactor: 1.0,
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.profile_circled, color: Colors.white),
            title: Text(
              "Profile",
              textScaleFactor: 1.0,
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.mail, color: Colors.white),
            title: Text(
              "Email Me",
              textScaleFactor: 1.0,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    ));
  }
}
