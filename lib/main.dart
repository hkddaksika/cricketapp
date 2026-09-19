import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MiniCricketApp());
}

class MiniCricketApp extends StatelessWidget {
  const MiniCricketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CricketGamePage(),
    );
  }
}

class CricketGamePage extends StatefulWidget {
  const CricketGamePage({super.key});

  @override
  State<CricketGamePage> createState() => _CricketGamePageState();
}

class _CricketGamePageState extends State<CricketGamePage> {
  static const int totalBalls = 6;

  int runs = 0;
  int ballsRemaining = totalBalls;

  String outcomeText = 'No Runs';

  final Random _random = Random();

  final List<int> _possibleRuns = [0, 1, 2, 3, 4, 6];

  void _playBall() {
    if (ballsRemaining > 0) {
      final int scored =
          _possibleRuns[_random.nextInt(_possibleRuns.length)];

      setState(() {
        runs += scored;
        ballsRemaining--;
        outcomeText = scored == 0 ? 'No Runs' : '$scored Runs';
      });
    }
  }

  void _restartGame() {
    setState(() {
      runs = 0;
      ballsRemaining = totalBalls;
      outcomeText = 'No Runs';
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isGameOver = ballsRemaining == 0;

    return Scaffold(
      backgroundColor: const Color(0xFF0077E6),
      appBar: AppBar(
        title: const Text(
          'Mini Cricket',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const Color(0xFF0D47A1),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      color: Colors.white,
                      padding: const EdgeInsets.all(8),
                      child: Image.asset(
                        'assets/bat.png',
                        width: 100,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      width: 130,
                      height: 130,
                      color: Colors.white,
                      padding: const EdgeInsets.all(8),
                      child: Image.asset(
                        'assets/ball.png',
                        width: 100,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Text(
                            'Runs',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '$runs',
                            style: const TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        children: [
                          const Text(
                            'Balls',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '$ballsRemaining',
                            style: const TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                Text(
                  outcomeText,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: isGameOver ? _restartGame : _playBall,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isGameOver
                        ? const Color(0xFFC62828)
                        : const Color(0xFF0D47A1),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 36,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    elevation: 4,
                  ),
                  child: Text(
                    isGameOver ? 'Restart' : 'Bat',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
