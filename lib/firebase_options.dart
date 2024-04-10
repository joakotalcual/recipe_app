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
    apiKey: 'AIzaSyBivHnyIKhj5LQ5EBsUq3AoabwgpZHKFGg',
    appId: '1:577390081261:web:1926b7723fa349219d48e4',
    messagingSenderId: '577390081261',
    projectId: 'recipeapp-cb290',
    authDomain: 'recipeapp-cb290.firebaseapp.com',
    storageBucket: 'recipeapp-cb290.appspot.com',
    measurementId: 'G-FVTNPE2PGZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA2pLqLUkYIgifNK-PP4N0AJbz-RBnacnQ',
    appId: '1:577390081261:android:2f0a0aeab35dfc9a9d48e4',
    messagingSenderId: '577390081261',
    projectId: 'recipeapp-cb290',
    storageBucket: 'recipeapp-cb290.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC7LhKAKYB-yKC3DIG6E0-9jujDOf4aVbc',
    appId: '1:577390081261:ios:bbe511609f927ec89d48e4',
    messagingSenderId: '577390081261',
    projectId: 'recipeapp-cb290',
    storageBucket: 'recipeapp-cb290.appspot.com',
    iosBundleId: 'com.example.recipeApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC7LhKAKYB-yKC3DIG6E0-9jujDOf4aVbc',
    appId: '1:577390081261:ios:5644935c5642e0339d48e4',
    messagingSenderId: '577390081261',
    projectId: 'recipeapp-cb290',
    storageBucket: 'recipeapp-cb290.appspot.com',
    iosBundleId: 'com.example.recipeApp.RunnerTests',
  );
}
