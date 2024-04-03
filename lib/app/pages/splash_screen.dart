import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/bg-splash.png'), fit: BoxFit.cover)),
        child: Center(
          child: Image.asset('assets/ic_logo.webp'),
        ),
      ),
    );
  }
}
