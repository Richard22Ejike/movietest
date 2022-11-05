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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAq6XcV_1OmHSN6FQPHJC8xHkZHjADSjCs',
    appId: '1:163663788888:android:d757f0c0af065dea45032d',
    messagingSenderId: '163663788888',
    projectId: 'reddit-aadf0',
    storageBucket: 'reddit-aadf0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCTykSIfmlJDegvoC_ESUGkEES7oXNHvFs',
    appId: '1:163663788888:ios:84243b4f8c227d2545032d',
    messagingSenderId: '163663788888',
    projectId: 'reddit-aadf0',
    storageBucket: 'reddit-aadf0.appspot.com',
    androidClientId: '163663788888-k8nali99mk47n7tk0s8t6641ked2663u.apps.googleusercontent.com',
    iosClientId: '163663788888-5812oah9hls5mi0bi985uo438cnua4i4.apps.googleusercontent.com',
    iosBundleId: 'com.example.movieapptest',
  );
}
