import 'package:flutter/material.dart';
import 'package:forsale/shared/shared.dart';
import 'package:forsale/ui/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "4Sale",
      theme: MyTheme.myTheme(),
      initialRoute: '/',
      routes: {
         '/': (context) => Login(),
         Login.routeName: (context) => Login(),
         MainMenu.routeName: (context) => MainMenu(),
         Register.routeName: (context) => Register(),
      },
    );
  }
}
