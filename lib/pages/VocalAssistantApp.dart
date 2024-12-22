import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:tp/components/UIColors.dart';
import 'package:tp/services/gemini_API.dart';

class VocalAssistantApp extends StatefulWidget {
  const VocalAssistantApp({
    super.key,
  });

  @override
  State<VocalAssistantApp> createState() => _VocalAssistantAppState();
}

class _VocalAssistantAppState extends State<VocalAssistantApp> {
  String msg = "Your Voice To Text";
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = 'test';
  IconData currentIcon = Icons.mic;
  Color currentColor = UIColors.blue;
  String geminiAnswers = "";
  String currentText = "Hello How Can I Help you";
  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  /// This has to happen only once per app
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }
  //start listeing
  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }
  //stop listing
  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                radius: 100,
                backgroundImage: Image.network("https://img.freepik.com/free-vector/flat-design-illustration-customer-support_23-2148887720.jpg").image
              ),
              const Text("Tap To Talk"),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(color:UIColors.blue,width: 3)
                  ),
                  child:Center(child: Text(currentText))
                ),
              ),
              const SizedBox(height: 60,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  color: UIColors.red,
                  width: double.infinity,
                  height: 100,
                  // decoration: BoxDecoration(border: Border.all(
                  //   // width: 3,
                  //
                  //   color: UIColors.red
                  // )),
                  child:Center(
                      child: Text(_lastWords,
                        style: const TextStyle(fontSize: 20,color: UIColors.white),
                      )
                  ) ,
                ),
              )
          
            ],
            ),
        ),
        ),
      floatingActionButton: ElevatedButton(
          onPressed: () async{
            Logger().d(Image.asset("images/customer_icon.PNG").image);
            if(_speechToText.isListening){
              _stopListening();
              setState(() {
                currentColor = UIColors.green;
                currentIcon = Icons.mic;
              });
              geminiAnswers = (await gemini_answer(_lastWords))!;
              setState(() {
                currentText = geminiAnswers;
              });
            }
            else{
              _startListening();
              setState(() {
                currentColor = UIColors.red;
                currentIcon = Icons.mic_off;

              });
            }
          },
          child: Icon(currentIcon,color: currentColor,)
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.fcenterTop,
    );
  }
}
