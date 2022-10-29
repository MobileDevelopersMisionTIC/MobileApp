import 'package:flutter/material.dart';

import 'login_page.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    goToLogin();
    super.initState();
  }

  Future<void> goToLogin() async {
    Future.delayed(const Duration(seconds: 3), () async {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
        margin: const EdgeInsets.all(30),
        child: const Image(
          image: AssetImage("assets/images/logo.png"),
          width: 200,
          height: 200,
        ),
      ),
    ));
  }
}
