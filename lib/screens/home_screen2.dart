import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart'; // Import audioplayers package
import 'package:meowlingo/screens/home_screen.dart'; // Import the other HomePage


//class CatSpeakScreen extends StatefulWidget {
 //@override
//_CatSpeakScreenState createState() => _CatSpeakScreenState();
//}


/*class _CatSpeakScreenState extends State<CatSpeakScreen> {
 TextEditingController _controller = TextEditingController();
 String _catSpeak = '';
 AudioPlayer _audioPlayer = AudioPlayer(); // Initialize AudioPlayer
 List<String> meows = ['lib/audio/meow1.m4a', 'lib/audio/meow2.m4a', 'lib/audio/meow3.m4a']; // List of meow audio files


 void convertToCatSpeak(String input) {
   List<String> words = input.split(' ');
   setState(() {
     _catSpeak = 'meow ' * words.length;
   });
 }


 void playRandomMeow() async {
   int index = Random().nextInt(meows.length); // Generate random index
   String meow = 'assets/audio/${meows[index]}';
   int result = await _audioPlayer.play(meow, isLocal: true); // Play random meow
   if (result != 1) {
     print('Failed to play meow');
   }
 }


 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Row(
         children: [
           IconButton(
             icon: Icon(Icons.speaker), // Speaker icon
             onPressed: () {
               for (int i = 0; i < _catSpeak.length; i++) {
                 playRandomMeow();
               }
             },
           ),
           Text('Cat Speak'), // Title
         ],
       ),
       actions: [
         IconButton(
           icon: const Icon(Icons.sync),
           onPressed: () {
             Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => const HomePage()), // Navigate to the other HomePage
             );
           },
         ),
       ],
     ),
     body: Padding(
       padding: const EdgeInsets.all(16.0),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: [
           TextField(
             controller: _controller,
             onSubmitted: (value) {
               convertToCatSpeak(value);
             },
             decoration: const InputDecoration(
               hintText: 'Enter your sentence...',
             ),
           ),
           const SizedBox(height: 20),
           Text(
             'Cat Speak: $_catSpeak',
             style: const TextStyle(fontSize: 18),
           ),
         ],
       ),
     ),
   );
 }


 @override
 void dispose() {
   _controller.dispose();
   _audioPlayer.dispose(); // Dispose the AudioPlayer
   super.dispose();
 }
}
*/


//import 'package:flutter/material.dart';
//import 'package:audioplayers/audioplayers.dart';


class CatSpeakScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Random Sound Player'),
        ),
        body: Center(
          child: RandomSoundButton(),
        ),
      ),
    );
  }
}

class RandomSoundButton extends StatelessWidget {
  final List<String> soundFiles = ['meow1.wav', 'meow2.wav', 'meow3.wav'];
  final AudioPlayer audioPlayer = AudioPlayer();
  

  void playRandomSound() async {
    // Get a random index to select a sound file
    int randomIndex = Random().nextInt(soundFiles.length);
    String selectedSound = soundFiles[randomIndex];
    debugPrint(selectedSound);
    
    // Play the selected sound
    audioPlayer.play(AssetSource('assets/audio/$selectedSound'));

  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        playRandomSound();
      },
      child: const Text('Play Random Sound'),
    );
  }
}