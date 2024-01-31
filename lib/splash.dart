import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/home.dart';
// import 'package:google_fonts/google_fonts.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});
  // static var myNewFontWhite = GoogleFonts.pressStart2p(textStyle:const TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 15));
  static var myNewFontWhite =
      TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 15);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        children: [
          Expanded(
              child: Center(
            child: Text(
              'TIC TAC TOE',
              style: myNewFontWhite,
            ),
          )),
          Expanded(
            flex: 2,
            child: AvatarGlow(
              glowColor: Colors.white,
              duration: const Duration(seconds: 2),
              startDelay: const Duration(seconds: 1),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(style: BorderStyle.none),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.grey[900],
                  child: Image.asset(
                    'assets/tictactoe.jpg',
                    fit: BoxFit.cover,
                  ),
                  radius: 80,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Home(),
                        ));
                  },
                  child: const Text('Play the game'),
                ),
                const SizedBox(height: 10),
                Text(
                  'TIC TAC TOE',
                  style: myNewFontWhite,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
