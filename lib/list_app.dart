import 'package:firestore_bloc_1/phase_list.dart';
import 'package:flutter/material.dart';

class ListApp extends MaterialApp {
  ListApp({super.key}) : super(
    title: 'Calendario ',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: const PhaseList()
    );

}