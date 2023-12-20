import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyD14TcnbsKuj7RPJwS_IADX7UO3LuKl7n0',
    appId: '1:842050460388:web:f8c22313f524a4d511aaf1',
    messagingSenderId: '842050460388',
    projectId: 'watchflix-6295c',
    authDomain: 'watchflix-6295c.firebaseapp.com',
    storageBucket: 'watchflix-6295c.appspot.com',
    measurementId: 'G-RXD5XGNBRY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCbI3BFY6KhU9PK5iUFEU_u1DxnuvnPhO0',
    appId: '1:842050460388:android:585abe3700256aeb11aaf1',
    messagingSenderId: '842050460388',
    projectId: 'watchflix-6295c',
    storageBucket: 'watchflix-6295c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCGuJRn8d2RgPLVUoaGxsZReZim50jtSMc',
    appId: '1:842050460388:ios:cdf29d38d169175411aaf1',
    messagingSenderId: '842050460388',
    projectId: 'watchflix-6295c',
    storageBucket: 'watchflix-6295c.appspot.com',
    iosBundleId: 'com.imdvlpr.watchflix.watchflix',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCGuJRn8d2RgPLVUoaGxsZReZim50jtSMc',
    appId: '1:842050460388:ios:ec3746b33c92b68e11aaf1',
    messagingSenderId: '842050460388',
    projectId: 'watchflix-6295c',
    storageBucket: 'watchflix-6295c.appspot.com',
    iosBundleId: 'com.imdvlpr.watchflix.watchflix.RunnerTests',
  );
}
