import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utility/routes.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  final imgurl1 =
      "https://w0.peakpx.com/wallpaper/908/997/HD-wallpaper-one-piece-luffy-thumbnail.jpg";
  final imgurl2 =
      "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/620b74cf-2071-4a49-9571-c97c1db1585d/df3gezw-6ec2dac5-c2ce-427c-b355-2d8279a766f7.png/v1/fill/w_1280,h_1112,strp/monkey_d__luffy__gear_5____updated_by_b_a_i_o_r_e_t_t_o_df3gezw-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTExMiIsInBhdGgiOiJcL2ZcLzYyMGI3NGNmLTIwNzEtNGE0OS05NTcxLWM5N2MxZGIxNTg1ZFwvZGYzZ2V6dy02ZWMyZGFjNS1jMmNlLTQyN2MtYjM1NS0yZDgyNzlhNzY2ZjcucG5nIiwid2lkdGgiOiI8PTEyODAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.f9Ynpx3mSEYDWJFr7hhZm-pFxywC6hVMnKwUQZFuZgQ";
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
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.homeRoute);
            },
          ),
          ListTile(
            leading: Icon(CupertinoIcons.profile_circled, color: Colors.white),
            title: Text(
              "Profile",
              textScaleFactor: 1.0,
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.homeRoute);
            },
          ),
          ListTile(
            leading: Icon(CupertinoIcons.mail, color: Colors.white),
            title: Text(
              "Email Me",
              textScaleFactor: 1.0,
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.homeRoute);
            },
          ),
        ],
      ),
    ));
  }
}
