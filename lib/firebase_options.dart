// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyCbCZF9crEq7rkU6qFDLa6E2XcuT3Zx_WY',
    appId: '1:327980796573:android:ebe848da3e266f74102274',
    messagingSenderId: '327980796573',
    projectId: 'todo-list-provider-d51c1',
    storageBucket: 'todo-list-provider-d51c1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCOOnEkN4SuIZUe7beGqmbZrTb0ad0HVOg',
    appId: '1:327980796573:ios:cc18ec9478a6ebef102274',
    messagingSenderId: '327980796573',
    projectId: 'todo-list-provider-d51c1',
    storageBucket: 'todo-list-provider-d51c1.appspot.com',
    androidClientId: '327980796573-eedek6kbe75u0c598ndr3cu0a5tmegau.apps.googleusercontent.com',
    iosClientId: '327980796573-ud9ca0p14s47sjhge5if6akodl3hitda.apps.googleusercontent.com',
    iosBundleId: 'br.com.luizgfalqueto.todoListProvider',
  );

}