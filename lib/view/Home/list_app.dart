import 'package:firestore_bloc_1/view/Phases/phase_list.dart';
import 'package:flutter/material.dart';

class HomeApp extends MaterialApp {
  HomeApp({super.key}) : super(
    title: 'Calendario Electoral 2023-24 ',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: const PhaseList()
    );

}