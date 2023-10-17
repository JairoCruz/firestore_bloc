import 'package:firestore_bloc_1/view/Home/list_app.dart';
import 'package:firestore_bloc_1/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:bloc/bloc.dart';

void main() async {

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Bloc.observer = const SimpleBlocObserver();
  runApp(MaterialApp(
    title: 'Calendario Electoral 2023-2024',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor:  Colors.deepPurple),
      useMaterial3: true
    ),
    debugShowCheckedModeBanner: false,
    home: HomeApp()
    ));
 
}
