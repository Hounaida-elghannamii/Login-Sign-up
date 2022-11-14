import 'package:ex2/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mongo_dart/mongo_dart.dart';

import 'mongodb.dart';

const d_green = Color(0xFF54D3C2);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDB.conectar();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => Login(),
    },
  ));
}
