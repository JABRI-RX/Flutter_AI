// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

import 'env/env.dart';

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static FirebaseOptions web = FirebaseOptions(
    apiKey: Env.webFireBaseApiKey,
    appId: '1:206872413395:web:968662d09527b1e0a50026',
    messagingSenderId: '206872413395',
    projectId: 'aimodelsapps',
    authDomain: 'aimodelsapps.firebaseapp.com',
    storageBucket: 'aimodelsapps.firebasestorage.app',
  );

  static FirebaseOptions android = FirebaseOptions(
    apiKey: Env.androidFireBaseApiKey,
    appId: '1:206872413395:android:050bbc37c5b617cfa50026',
    messagingSenderId: '206872413395',
    projectId: 'aimodelsapps',
    storageBucket: 'aimodelsapps.firebasestorage.app',
  );

  static FirebaseOptions windows = FirebaseOptions(
    apiKey: Env.windowsFireBaseApiKey,
    appId: '1:206872413395:web:0a433991037c9615a50026',
    messagingSenderId: '206872413395',
    projectId: 'aimodelsapps',
    authDomain: 'aimodelsapps.firebaseapp.com',
    storageBucket: 'aimodelsapps.firebasestorage.app',
  );
}