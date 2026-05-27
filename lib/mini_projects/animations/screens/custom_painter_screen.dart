import 'package:flutter/material.dart';

class CustomPainterScreen extends StatelessWidget {
  const CustomPainterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomPaint(
            size: Size(
              MediaQuery.of(context).size.width,
              300,
            ),
            painter: WaveHeaderPainter(),
            child: SizedBox(
              width: double.infinity,
              height: 300,
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.brush,
                      size: 70,
                      color: Colors.white,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'CustomPainter Demo',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Wave background using Canvas & Path',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: const [
                Text(
                  'What is CustomPainter?',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'CustomPainter is used to draw custom shapes, waves, lines, circles, charts, and decorative UI using Canvas and Paint.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WaveHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.indigo
      ..style = PaintingStyle.fill;

    final Path path = Path();

    path.lineTo(0, size.height - 80);

    path.quadraticBezierTo(
      size.width * 0.25,
      size.height,
      size.width * 0.5,
      size.height - 70,
    );

    path.quadraticBezierTo(
      size.width * 0.75,
      size.height - 140,
      size.width,
      size.height - 60,
    );

    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

// CustomPainter Flutter ka low-level drawing widget hai.
// Isme Canvas par Paint aur Path ke through custom shapes draw karte hain.
// paint() method drawing logic handle karta hai.
// Path se hum custom wave shape banate hain.
// canvas.drawPath() se shape screen par draw hoti hai.
// shouldRepaint false hai kyunki static design hai aur redraw ki zarurat nahi.