import 'package:Flutter_Onboarding_Screen_UI/onBoarding.dart';
import 'package:Flutter_Onboarding_Screen_UI/provider/indexNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'onBoarding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StackBoard Deck onBoarding',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
          create: (BuildContext context) => IndexNotifier(),
          child: OnBoarding()),
    );
  }
}
