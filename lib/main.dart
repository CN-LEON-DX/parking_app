import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:parking_app/simple_bloc_observer.dart';
import 'package:user_repository/user_repository.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: FirebaseOptions(
    apiKey: "AIzaSyBp3xvVxOI40ziqDCbu7kjWFbnJXeb11Lc",  
    appId: "1:119200085791:android:472910ad9e1548df36a22a",
    messagingSenderId: "119200085791", 
    projectId: "parkingapp-f3024",  
    ));    
  // As the global observer of BLOCS    
  Bloc.observer = SimpleBlocObserver(); 
  runApp(MyApp(FirebaseUserRepo()));    
}