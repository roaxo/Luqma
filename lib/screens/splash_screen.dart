import 'package:flutter/material.dart';
import 'package:proto/screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goWelconeScreen();
  }

  goWelconeScreen() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 700),
          pageBuilder: (_, __, ___) => WelcomeScreen(),
          transitionsBuilder: (_, animation, __, child) {
            final scale = Tween<double>(begin: 0.8, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutExpo),
            );

            return ScaleTransition(
              scale: scale,
              child: FadeTransition(opacity: animation, child: child),
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/images/splash_bg.png",
            width: media.width,
            height: media.height,
            fit: BoxFit.cover,
          ),
          Image.asset(
            "assets/images/main-logo.png",
            width: media.width * 0.55,
            height: media.height * 0.55,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
