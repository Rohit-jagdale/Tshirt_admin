import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

FirebaseOptions firebaseOptions = Platform.isAndroid ? const FirebaseOptions(
    apiKey: "AIzaSyAl4tEmfwn27wS39Oqc_UZCcII0a7L3iA0",
    appId: "1:504184820759:android:69ca9c990251eb8e33b852",
    messagingSenderId: "504184820759",
    projectId: "footwear-a156d") : const FirebaseOptions(
    apiKey: "AIzaSyCS7sdWrQ57yo3kSoUE-82poRvHhnOfDXg",
    appId: "1:504184820759:ios:b028737dd1dacfc033b852",
    messagingSenderId: "504184820759",
    projectId: "footwear-a156d");