import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:forsale/shared/shared.dart';
import 'package:forsale/ui/pages/pages.dart';

void enablePlatformOverrideForDekstop(){
  if(!kIsWeb && (Platform.isMacOS || Platform.isWindows ||Platform.isLinux)){
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
}

void main() async{
  enablePlatformOverrideForDekstop();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
         '/': (context) => Splash(),
         Splash.routeName: (context) => Splash(),
         Login.routeName: (context) => Login(),
         MainMenu.routeName: (context) => MainMenu(),
         Register.routeName: (context) => Register(),
         ListData.routeName: (context) => ListData(),
      },
    );
  }
}
