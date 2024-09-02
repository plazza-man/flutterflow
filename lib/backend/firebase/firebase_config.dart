import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAm7ZKG3G3Uhj_jQ019EE3J6JQGAmafpRM",
            authDomain: "assignment-lt408q.firebaseapp.com",
            projectId: "assignment-lt408q",
            storageBucket: "assignment-lt408q.appspot.com",
            messagingSenderId: "805598234739",
            appId: "1:805598234739:web:1b3ae7312e9b55a5afc206"));
  } else {
    await Firebase.initializeApp();
  }
}
