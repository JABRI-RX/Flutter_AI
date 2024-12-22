import 'package:envied/envied.dart';

part 'env.g.dart';
@Envied(path:'.env')
abstract class Env{
  //gemini api
  @EnviedField(varName:"geminiApiKey",obfuscate: true)
  static  String geminiApiKey = _Env.geminiApiKey;
  @EnviedField(varName:"webFireBaseApiKey",obfuscate: true)
  static String webFireBaseApiKey = _Env.webFireBaseApiKey;
  //
  @EnviedField(varName:"androidFireBaseApiKey",obfuscate: true)
  static String androidFireBaseApiKey = _Env.androidFireBaseApiKey;
  //
  @EnviedField(varName:"webFireBaseApiKey",obfuscate: true)
  static String windowsFireBaseApiKey = _Env.windowsFireBaseApiKey;

}