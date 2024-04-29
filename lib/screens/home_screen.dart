import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meowlingo/screens/home_screen2.dart'; // Import the CatSpeakScreen

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  String _convertedText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MeowLingo',
          style: GoogleFonts.modak(
            fontSize: 20,
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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.64,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 227, 143, 87),
                borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      _convertedText,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 1,
            left: MediaQuery.of(context).size.width * 0.27 - 25,
            child: _buildCatEar(),
          ),
          Positioned(
            top: 1,
            right: MediaQuery.of(context).size.width * 0.27 - 25,
            child: _buildCatEar(),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.64,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'English',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      onSubmitted: (input) {
                        String convertedText = _convertToMeows(input);
                        setState(() {
                          _convertedText = convertedText;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter your text here',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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

  String _convertToMeows(String input) {
    List<String> words = input.split(' ');
    return 'meow ' * words.length;
  }
}

class _CatEarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 227, 143, 87)
      ..style = PaintingStyle.fill;

    final double triangleHeight = size.height * 0.9;

    final Path path = Path()
      ..moveTo(size.width * 0.15, size.height)
      ..lineTo(size.width * 0.4, size.height - triangleHeight)
      ..lineTo(size.width * 0.7, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}