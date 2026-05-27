import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimationScreen extends StatefulWidget {
  const LottieAnimationScreen({super.key});

  @override
  State<LottieAnimationScreen> createState() => _LottieAnimationScreenState();
}

class _LottieAnimationScreenState extends State<LottieAnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  bool isPlaying = true;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(vsync: this);
  }

  void toggleAnimation() {
    if (isPlaying) {
      animationController.stop();
    } else {
      animationController.repeat();
    }

    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lottie Animation'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.network(
                'https://assets10.lottiefiles.com/packages/lf20_jcikwtux.json',
                controller: animationController,
                width: 260,
                height: 260,
                fit: BoxFit.contain,
                onLoaded: (composition) {
                  animationController
                    ..duration = composition.duration
                    ..repeat();
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Lottie Animation Demo',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'This animation is loaded using the Lottie package.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: toggleAnimation,
                icon: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                ),
                label: Text(
                  isPlaying ? 'Pause Animation' : 'Play Animation',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// Lottie package JSON-based animations display karne ke liye use hota hai.
// Is example me Lottie.network se animation load ki hai.
// AnimationController se play, pause aur repeat animation control kiya.
// Lottie mostly loading, success, empty state, onboarding aur no internet UI me use hota hai.