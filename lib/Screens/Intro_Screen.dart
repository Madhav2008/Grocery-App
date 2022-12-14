import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/Screens/Home_Screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 0.0,
                right: 100.0,
                top: 120,
                bottom: 20,
              ),
              child: Image.asset(
                '../assets/images/intro1.png',
                width: 500,
                height: 300,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Text(
                'We deliver groceries at your doorstep',
                textAlign: TextAlign.center,
                style: GoogleFonts.arvo(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Groceer gives you fresh vegetables and fruits. Order fresh items from groceer.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey[600],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Spacer(),
            GestureDetector(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const HomeScreen();
                  },
                ),
              ),
              child: Container(
                width: 150,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff515acd),
                      Color(0xff4140b7),
                    ],
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
