import 'package:flutter/material.dart';
import 'package:tp/pages/VocalAssistantApp.dart';
import 'package:tp/pages/annpage.dart';
import 'package:tp/pages/cnnpage.dart';
import 'package:tp/pages/loginpage.dart';
import 'package:tp/pages/mainpage.dart';
import 'package:tp/pages/ragpage.dart';
import 'package:tp/pages/stockPredictionpage.dart';

import 'pages/RegisterPage.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/':(context)=>const HomePage(),
        // '/':(context)=>const LoginPage(title: "Login Page"),
        '/registerPage':(context)=>const RegisterPage(title: "Register Page"),
        '/main':(context)=>const HomePage(),
        //models
        '/ann':(context)=>const Annpage(),
        '/cnn':(context)=>const Cnnpage(),
        '/spp':(context)=>const Stockpredictionpage(),
        '/voa':(context)=>const VocalAssistantApp(),
        '/rag':(context)=>const Ragpage()
      },
      debugShowCheckedModeBanner: false,
      title: 'Deep Learning Project',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyLoginPage(title: 'Student'),
    );
  }
}