import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:tp/components/menu.dart';
import 'package:tp/services/auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AuthService authService ;
  var logger = Logger();
  String? userName = "";
  @override void initState() {
    // TODO: implement initState
    super.initState();
    authService = AuthService();
    userName = authService.getCurrentUser()?.displayName;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: AppBar(
        title:  Center(
            child: Text("Welcome Back ${userName ?? "testing"}")
        ),
      ),
    );
  }
}
