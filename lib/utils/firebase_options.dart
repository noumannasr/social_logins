
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
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
    apiKey: 'AIzaSyDHwWAltm8Gt_rlYd4l6odXdrfc__quJLM',
    appId: '1:1020100717704:android:73b10a1444afb1b991433d',
    messagingSenderId: '542338342867',
    projectId: 'zakat-tracker-flutter-app',
    storageBucket: 'zakat-tracker-flutter-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCbjaQvlGpuatCsiCOl9tC9imQy1lM2FSM',
    appId: '1:542338342867:ios:4d27a67de294f5d45a1926',
    messagingSenderId: '542338342867',
    projectId: 'urbansoundart-8d16f',
    storageBucket: 'urbansoundart-8d16f.appspot.com',
    iosClientId: '542338342867-pqm789bsv45c3p50tin1337ig82kovfr.apps.googleusercontent.com',
    iosBundleId: 'com.example.urbanSound',
  );


}
