import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/theme.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart    ".text.make().centered(),
      ),
    );
  }
}
