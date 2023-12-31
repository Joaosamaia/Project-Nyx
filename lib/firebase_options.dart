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
    apiKey: 'AIzaSyBeoarI3a7_i9MhUmYH6bnN-88i4GjxPGc',
    appId: '1:513345062941:web:66b736ba3598c8cf1b1ef4',
    messagingSenderId: '513345062941',
    projectId: 'nyxdelivery',
    authDomain: 'nyxdelivery.firebaseapp.com',
    storageBucket: 'nyxdelivery.appspot.com',
    measurementId: 'G-1NGK0PTH55',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBqcSVouqxoehPzeqMzS5tIXk9rP5QZUxU',
    appId: '1:513345062941:android:0514688bdf7f076e1b1ef4',
    messagingSenderId: '513345062941',
    projectId: 'nyxdelivery',
    storageBucket: 'nyxdelivery.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAjh9JadraGWO3XC0vXUvjRgFVCyLFQpl4',
    appId: '1:513345062941:ios:96241f810bc81d971b1ef4',
    messagingSenderId: '513345062941',
    projectId: 'nyxdelivery',
    storageBucket: 'nyxdelivery.appspot.com',
    iosBundleId: 'com.example.projetoNyx',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAjh9JadraGWO3XC0vXUvjRgFVCyLFQpl4',
    appId: '1:513345062941:ios:3d9897d3e229eee21b1ef4',
    messagingSenderId: '513345062941',
    projectId: 'nyxdelivery',
    storageBucket: 'nyxdelivery.appspot.com',
    iosBundleId: 'com.example.projetoNyx.RunnerTests',
  );
}
