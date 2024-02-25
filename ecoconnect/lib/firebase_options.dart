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
    apiKey: 'AIzaSyC7M5HJK79sFY7S3bGKYjDfuPd7RXx17YY',
    appId: '1:900184532731:web:385f423a8b6600185c725e',
    messagingSenderId: '900184532731',
    projectId: 'env-project-1bacd',
    authDomain: 'env-project-1bacd.firebaseapp.com',
    storageBucket: 'env-project-1bacd.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCcQQMt21jwXc_5tXOkPCiCYleodh8uj4A',
    appId: '1:900184532731:android:f60aa2e8023b579b5c725e',
    messagingSenderId: '900184532731',
    projectId: 'env-project-1bacd',
    storageBucket: 'env-project-1bacd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBvhkNKs6PN7-vmGAHtqzZLmvFnwcdKT9E',
    appId: '1:900184532731:ios:f8ee5fec39cac2175c725e',
    messagingSenderId: '900184532731',
    projectId: 'env-project-1bacd',
    storageBucket: 'env-project-1bacd.appspot.com',
    iosBundleId: 'com.example.envAssignment',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBvhkNKs6PN7-vmGAHtqzZLmvFnwcdKT9E',
    appId: '1:900184532731:ios:f8ee5fec39cac2175c725e',
    messagingSenderId: '900184532731',
    projectId: 'env-project-1bacd',
    storageBucket: 'env-project-1bacd.appspot.com',
    iosBundleId: 'com.example.envAssignment',
  );
}
