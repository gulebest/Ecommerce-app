import 'package:ecommerce_app/models/cart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:provider/provider.dart';
import 'pages/Intro_page.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode, // This works on all platforms
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const IntroPage(),
        builder: DevicePreview.appBuilder,
        locale: DevicePreview.locale(context),
      ),
    );
  }
}
