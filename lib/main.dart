import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/pages/cart_page.dart';
import 'package:flutter_application_1/pages/home_detail_page.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/pages/sign_up_page.dart';
import 'package:flutter_application_1/widgets/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/utility/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var vxNavigator = VxNavigator(routes: {
      "/": (_, __) => MaterialPage(child: HomePage()),
      MyRoutes.homeRoute: (_, __) => MaterialPage(child: HomePage()),
      MyRoutes.homeDetailRoute: (uri, _) {
        final catalog = (VxState.store as MyStore)
            .catalog!
            .getById(int.parse(uri.queryParameters["id"]!));
        return MaterialPage(
            child: HomeDetailPage(
          catalog: catalog,
        ));
      },
      MyRoutes.loginRoute: (_, __) => MaterialPage(child: LoginPage()),
      MyRoutes.signupRoute: (_, __) => MaterialPage(child: SignUpPage()),
      MyRoutes.cartRoute: (_, __) => MaterialPage(child: CartPage()),
    });
    (VxState.store as MyStore).navigator = vxNavigator;

    return MaterialApp.router(
      //home: HomePage(),
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      routeInformationParser: VxInformationParser(),
      routerDelegate: vxNavigator,
    );
  }
}
