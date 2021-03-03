import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:voice_app/home/homepage.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Voice',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: SpeechScreen(),
    );
  }
}

class SpeechScreen extends StatefulWidget {
  @override
  _SpeechScreenState createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  final Map<String, HighlightedWord> _highlights = {
    'flutter': HighlightedWord(
        onTap: () => print('Flutter'),
        textStyle:
            const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
    'voice': HighlightedWord(
        onTap: () => print('Voice'),
        textStyle:
            const TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
    'Python': HighlightedWord(
        onTap: () => print('Python'),
        textStyle:
            const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
    'Amit': HighlightedWord(
        onTap: () => print('Amit'),
        textStyle:
            const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
  };

    stt.SpeechToText _speech;
    bool _isListening = false;
    String _text = 'Please press the button and start speaking';
    // String _tempText=this._text;

    double _confidence = 1.0;

    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      _speech = stt.SpeechToText();
    }
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title:
            Text('Confidence : ${(_confidence * 100.0).toStringAsFixed(1)}%'),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: AvatarGlow(
        animate: _isListening,
        glowColor: Theme.of(context).primaryColor,
        endRadius: 75.0,
        duration: const Duration(milliseconds: 2000),
        repeatPauseDuration: const Duration(milliseconds: 100),
        repeat: true,
        child: FloatingActionButton(
          onPressed: _listen,
          child: Icon(_isListening ? Icons.mic : Icons.mic_none),
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 30, 30, 150),
          child: TextHighlight(
            text: _text,
            words: _highlights ,
            textStyle: const TextStyle(
                fontSize: 32.0,
                color: Colors.black,
                fontWeight: FontWeight.w300),
          ),
        ),
      ),
    );
  }

  void _listen() async {
    
    // print('object');
    if (!_isListening) {
      // print(!_isListening);
      bool available = await _speech.initialize(
          onStatus: (val) => print('onStatus: $val'),
          onError: (val) => print('onError: $val '));
      // bool available = await speech.initialize( onStatus: statusListener, onError: errorListener );
      print(available);
      if (available) {
        // print(available);
        // print('available');
        setState(() => _isListening = true);
        _speech.listen(
            onResult: (val) => setState(() {
                  _text = val.recognizedWords;
                  if (val.hasConfidenceRating && val.confidence > 0) {
                    _confidence = val.confidence;
                  }
                }
            )
          );
      } 
    }
    else {
        setState(() => _isListening = false);
        // _text=_tempText;
        _speech.stop();
      }
  }
}
