// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBhGDW9bV2zDZHS80g6XKy5pYYhOZpNFTU',
    appId: '1:626020871717:web:e8073c0cbfa62acf9519cc',
    messagingSenderId: '626020871717',
    projectId: 'sociobosque-8c074',
    authDomain: 'sociobosque-8c074.firebaseapp.com',
    databaseURL: 'https://sociobosque-8c074-default-rtdb.firebaseio.com',
    storageBucket: 'sociobosque-8c074.appspot.com',
    measurementId: 'G-STMXP5M3VM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBHPZOVAwQWluXUXZq_xYJ1efjZX2dX_PE',
    appId: '1:626020871717:android:61d06d939cd30f2c9519cc',
    messagingSenderId: '626020871717',
    projectId: 'sociobosque-8c074',
    databaseURL: 'https://sociobosque-8c074-default-rtdb.firebaseio.com',
    storageBucket: 'sociobosque-8c074.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCUoaDhze4KwnFAGC5r9OV-2kCl267Ku1U',
    appId: '1:626020871717:ios:810158d9febc6cfb9519cc',
    messagingSenderId: '626020871717',
    projectId: 'sociobosque-8c074',
    databaseURL: 'https://sociobosque-8c074-default-rtdb.firebaseio.com',
    storageBucket: 'sociobosque-8c074.appspot.com',
    iosBundleId: 'com.example.socioBosques',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCUoaDhze4KwnFAGC5r9OV-2kCl267Ku1U',
    appId: '1:626020871717:ios:0b2aafd334cb8c2d9519cc',
    messagingSenderId: '626020871717',
    projectId: 'sociobosque-8c074',
    databaseURL: 'https://sociobosque-8c074-default-rtdb.firebaseio.com',
    storageBucket: 'sociobosque-8c074.appspot.com',
    iosBundleId: 'com.example.socioBosques.RunnerTests',
  );
}