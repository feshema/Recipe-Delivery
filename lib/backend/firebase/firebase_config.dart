import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAg_ii6GeG_Jy3G0mRhU_j6zwdEJ1_W-2g",
            authDomain: "new-project-dd676.firebaseapp.com",
            projectId: "new-project-dd676",
            storageBucket: "new-project-dd676.firebasestorage.app",
            messagingSenderId: "658151314469",
            appId: "1:658151314469:web:5d299b33ca405b7d359bcc"));
  } else {
    await Firebase.initializeApp();
  }
}
