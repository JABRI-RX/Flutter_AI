import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:logger/logger.dart';

import '../env/env.dart';
var logger = Logger();
Future<String?> gemini_answer(String prompt) async{
  // Make sure to include this import:
// import 'package:google_generative_ai/google_generative_ai.dart';
  String key = Env.geminiApiKey;
  final model = GenerativeModel(
    model: 'gemini-1.5-flash',
    apiKey: key ,
  );

  final response = await model.generateContent([Content.text(prompt)]);
  return response.text;
}