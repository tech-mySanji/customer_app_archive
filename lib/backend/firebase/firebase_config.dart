import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBCtGyppydFPncoWCdFQAmOVpgA41eF7xw",
            authDomain: "mysanji-d2c2f.firebaseapp.com",
            projectId: "mysanji-d2c2f",
            storageBucket: "mysanji-d2c2f.appspot.com",
            messagingSenderId: "112891698324",
            appId: "1:112891698324:web:ce11b42519251439f26881",
            measurementId: "G-JZDN7EJC6J"));
  } else {
    await Firebase.initializeApp();
  }
}
