import 'package:flutter/material.dart';
import 'package:hackathonmaterial/loginselect.dart';
import 'package:hackathonmaterial/studteach/menu.dart';
import 'package:hackathonmaterial/studteach/paymentredirect.dart';
import 'package:hackathonmaterial/studteach/studteach.dart';
import 'package:hackathonmaterial/studteach/studteachlogin.dart';
import 'package:hackathonmaterial/studteach/stuteachaccount.dart';
import 'package:hackathonmaterial/vendor/vendorlogin.dart';
import 'package:hackathonmaterial/vendor/vendormenu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'eat.caias',
      theme: ThemeData(
          fontFamily: 'SFProDisplay',
          canvasColor: Colors.black87,
          colorScheme: ColorScheme(
              brightness: Brightness.dark,
              primary: const Color.fromARGB(255, 59, 49, 37),
              onPrimary: Colors.white,
              secondary: const Color.fromARGB(255, 107, 81, 49),
              onSecondary: Colors.white,
              error: Colors.redAccent,
              onError: Colors.white,
              background: Colors.black87,
              onBackground: Colors.white,
              surface: Colors.grey.shade900,
              onSurface: Colors.white)),
      routes: {
        '/loginselect': (context) => const Loginselect(),
        '/studteachlogin': (context) => const Studteachlogin(),
        '/studteach': (context) => const Studteach(),
        '/menu': (context) => const Menu(),
        '/stuteachaccount': (context) => const Stuteachaccount(),
        '/paymentredirect': (context) => const Paymentredirect(),
        '/vendorlogin': (context) => const VendorLogin(),
        '/vendormenu': (context) => const VendorMenu()
      },
      home: const Loginselect(),
    );
  }
}
