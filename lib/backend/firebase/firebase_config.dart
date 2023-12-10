import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyC_udKhRYiy2aOEwUF7j0gr3fKb8RbLIvc",
            authDomain: "app-mottor.firebaseapp.com",
            projectId: "app-mottor",
            storageBucket: "app-mottor.appspot.com",
            messagingSenderId: "502916795619",
            appId: "1:502916795619:web:fd22652128da48632689d6"));
  } else {
    await Firebase.initializeApp();
  }
}
