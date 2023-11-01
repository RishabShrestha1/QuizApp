import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.screenChange, {super.key});

  final void Function() screenChange;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/icon.png',
            width: 300,
            color: const Color.fromARGB(195, 0, 0, 0),
          ),
          const SizedBox(height: 50),
          Text(
            'Welcome',
            style: GoogleFonts.lobster(
              color: const Color.fromARGB(197, 3, 2, 2),
              fontSize: 48,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 252, 252, 252)),
            onPressed: screenChange,
            icon: const Icon(Icons.arrow_circle_right_rounded),
            label: const Text('CLICK ME'),
          ),
        ],
      ),
    );
  }
}
