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
    apiKey: 'AIzaSyAZ7Ab-PfGPcIJWLD70n8prT_tKZBVY154',
    appId: '1:375993132013:web:173caaec9586c7f44bfde4',
    messagingSenderId: '375993132013',
    projectId: 'ecommerce-udemy-ff943',
    authDomain: 'ecommerce-udemy-ff943.firebaseapp.com',
    storageBucket: 'ecommerce-udemy-ff943.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCJISrSPiPT2guPmLgb8xfJn6M-p4X80UE',
    appId: '1:375993132013:android:b783f76f44a59a544bfde4',
    messagingSenderId: '375993132013',
    projectId: 'ecommerce-udemy-ff943',
    storageBucket: 'ecommerce-udemy-ff943.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD-I2qcD8bHSBUygfJmdi4jHBy0WWWkgyc',
    appId: '1:375993132013:ios:567e88a6c01082424bfde4',
    messagingSenderId: '375993132013',
    projectId: 'ecommerce-udemy-ff943',
    storageBucket: 'ecommerce-udemy-ff943.appspot.com',
    iosBundleId: 'com.example.ecommerceFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD-I2qcD8bHSBUygfJmdi4jHBy0WWWkgyc',
    appId: '1:375993132013:ios:5c9f106122e54f574bfde4',
    messagingSenderId: '375993132013',
    projectId: 'ecommerce-udemy-ff943',
    storageBucket: 'ecommerce-udemy-ff943.appspot.com',
    iosBundleId: 'com.example.ecommerceFlutter.RunnerTests',
  );
}
