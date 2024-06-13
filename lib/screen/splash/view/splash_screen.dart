import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/screen/home/view/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3),() => Get.off(()=>HomeScreen(),transition: Transition.zoom),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // BackdropFilter(
          //   filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10,tileMode: TileMode.clamp),
          //   child: Image.asset(
          //     "assets/image/bg.jpg",
          //     fit: BoxFit.cover,
          //   ),
          // ),
          Center(
            child: Image.asset(
              "assets/image/tic-tac-toe.png",
              height: 170,
            ),
          ),
        ],
      ),
    );
  }
}
