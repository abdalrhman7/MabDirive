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
    apiKey: 'AIzaSyBFLKrhHwJcz4HZO3n92RYamhD4fGJN_C4',
    appId: '1:209904933376:web:d4283bc350e48932f116e5',
    messagingSenderId: '209904933376',
    projectId: 'mab-drive',
    authDomain: 'mab-drive.firebaseapp.com',
    storageBucket: 'mab-drive.appspot.com',
    measurementId: 'G-ZEEYRMKPR9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAOL8capWvb1WHfP7n5h0PxDkJmDWNIgoY',
    appId: '1:209904933376:android:36626ba4f9b59631f116e5',
    messagingSenderId: '209904933376',
    projectId: 'mab-drive',
    storageBucket: 'mab-drive.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDVRJHcZBaY2L4vf7B21PjpXff0GqZuU9Y',
    appId: '1:209904933376:ios:217716c0d7de8e2df116e5',
    messagingSenderId: '209904933376',
    projectId: 'mab-drive',
    storageBucket: 'mab-drive.appspot.com',
    iosBundleId: 'com.example.mabDrive',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDVRJHcZBaY2L4vf7B21PjpXff0GqZuU9Y',
    appId: '1:209904933376:ios:23097bc9a5b50622f116e5',
    messagingSenderId: '209904933376',
    projectId: 'mab-drive',
    storageBucket: 'mab-drive.appspot.com',
    iosBundleId: 'com.example.mabDrive.RunnerTests',
  );
}
