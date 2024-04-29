import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:audioplayers/audioplayers.dart';
import 'package:meowlingo/screens/home_screen2.dart';
//import 'package:meowlingo/screens/home_screen2.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MeowLingo',
          style: GoogleFonts.modak(
            fontSize: 20, // Adjust the font size as needed
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.sync),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CatSpeakScreen()),
              );
            },
          ),
        ],
      ),
      resizeToAvoidBottomInset: false, // Prevents resizing when keyboard appears
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Main Content
          Container(
            color: Colors.white, // Change color as per your theme
            child: const Center(
              child: Text(
                'Your main content goes here',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          // Sliding Container
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SlidingContainer(),
          ),
          // Cat Ear Triangles
          Positioned(
            top: 162,
            left: MediaQuery.of(context).size.width * 0.27 - 25,
            child: _buildCatEar(),
          ),
          Positioned(
            top: 162,
            right: MediaQuery.of(context).size.width * 0.27 - 25,
            child: _buildCatEar(),
          ),
          // Header
          const Positioned(
            top: 20,
            left: 20,
            child: Text(
              'English',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.content_copy),
              onPressed: () {
                // Implement copy functionality for the Cat Speak text here
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCatEar() {
    return SizedBox(
      width: 50,
      height: 30,
      child: CustomPaint(
        painter: _CatEarPainter(),
      ),
    );
  }
}

class _CatEarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 227, 143, 87)
      ..style = PaintingStyle.fill;

    final double triangleHeight = size.height * 0.9;

    // Draw the first triangle
    final Path path1 = Path()
      ..moveTo(size.width * 0.15, size.height)
      ..lineTo(size.width * 0.4, size.height - triangleHeight)
      ..lineTo(size.width * 0.7, size.height)
      ..close();
    canvas.drawPath(path1, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class SlidingContainer extends StatelessWidget {
  const SlidingContainer();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.64,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 227, 143, 87),
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Cat Speak',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your text here',
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

