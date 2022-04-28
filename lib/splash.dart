import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'home.dart';

class SplashScreenPage extends StatefulWidget {
  static const routeName = "/splashScreenPage";

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
     Future.delayed(
        const Duration(seconds: 3),
            () =>  Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder:
                    (context, animation, secondaryAnimation) =>
                    Home(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  final tween = Tween(begin: begin, end: end);
                  final offsetAnimation = animation.drive(tween);
                  return SlideTransition(
                      position: offsetAnimation, child: child);
                },
              ),
            ),
     );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: width<500?Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/images/unvired_logo.png'),
              SizedBox(
                  height: 10,
                  child: OverflowBox(
                      maxHeight: 230,
                      child: Lottie.asset('assets/images/load.json')),
                ),
              const Text(
                'please_wait',
                style: TextStyle(fontSize: 18, color: Colors.black),
              )
            ],
          ),
        ): Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/images/unvired_logo.png'),
            SizedBox(
              height: 20,
              child: OverflowBox(
                  maxHeight: 300,
                  child: Lottie.asset('assets/images/load.json')),
            ),
            const Text(
              'please_wait',
              style: TextStyle(fontSize: 28, color: Colors.black),
            )
          ],
        ),
      ),
      ),
    );
  }
}
