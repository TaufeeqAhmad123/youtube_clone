import 'package:flutter/material.dart';

import 'package:flutter_application_1/utils/shimmer.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
   
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const shimmerScreen();
      }));
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Lottie.asset('assets/images/lotti.json',height: 200, width: 200, repeat: true, animate: true, fit: BoxFit.fill,
          errorBuilder: (context, error, stackTrace) {
            return const Text('Error loading animation')  ;        },
      ),
    ));
  }
}