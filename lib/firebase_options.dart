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
    apiKey: 'AIzaSyCWPrl3cmEmsNe6_u2h7whM-51GX5Xi-Ww',
    appId: '1:865234041472:web:6b27e665742c36c1ed8465',
    messagingSenderId: '865234041472',
    projectId: 'task-management-apps-eeca8',
    authDomain: 'task-management-apps-eeca8.firebaseapp.com',
    storageBucket: 'task-management-apps-eeca8.appspot.com',
    measurementId: 'G-FBGVVGN9KC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCKOjmZC0AU8fjeGsdjpLmoWXZpsyOS61Y',
    appId: '1:865234041472:android:83654f294caed873ed8465',
    messagingSenderId: '865234041472',
    projectId: 'task-management-apps-eeca8',
    storageBucket: 'task-management-apps-eeca8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB5lgPGi5ESW8n0IvWzfTOoAfyLqJD-8uA',
    appId: '1:865234041472:ios:36d4ebda25d53634ed8465',
    messagingSenderId: '865234041472',
    projectId: 'task-management-apps-eeca8',
    storageBucket: 'task-management-apps-eeca8.appspot.com',
    androidClientId: '865234041472-lk8b1thvgrhsdv0ulic1log1e196srdd.apps.googleusercontent.com',
    iosClientId: '865234041472-uscef3rcjo3fttnkh9cgnp06qtf6lcg6.apps.googleusercontent.com',
    iosBundleId: 'com.example.tasManagementApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB5lgPGi5ESW8n0IvWzfTOoAfyLqJD-8uA',
    appId: '1:865234041472:ios:36d4ebda25d53634ed8465',
    messagingSenderId: '865234041472',
    projectId: 'task-management-apps-eeca8',
    storageBucket: 'task-management-apps-eeca8.appspot.com',
    androidClientId: '865234041472-lk8b1thvgrhsdv0ulic1log1e196srdd.apps.googleusercontent.com',
    iosClientId: '865234041472-uscef3rcjo3fttnkh9cgnp06qtf6lcg6.apps.googleusercontent.com',
    iosBundleId: 'com.example.tasManagementApp',
  );
}