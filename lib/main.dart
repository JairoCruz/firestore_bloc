import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_bloc_1/app.dart';
import 'package:firestore_bloc_1/list_app.dart';
import 'package:firestore_bloc_1/phase_list.dart';
import 'package:firestore_bloc_1/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'model/phase.dart';
import 'package:bloc/bloc.dart';
import 'bloc_custom/counter_observer.dart';

void main() async {

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //Bloc.observer = const CounterObserver();
  //runApp(const MainApp());
 // runApp(const CounterApp());


  Bloc.observer = const SimpleBlocObserver();
  runApp(ListApp());
 // runApp(const MainApp());


}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

   /* 
   
   // este codigo es bueno
   void getData() async {
    final db = FirebaseFirestore.instance;
    List<Phase> p = [];

    QuerySnapshot<Map<String, dynamic>> data = await db.collection('phases').get();
    // print(Phase.fromFirestore(data.docs[0], null));

    print("Successfully completed");
    for (var dosSnapshot in data.docs) {
      //print(Phase.fromFirestore(dosSnapshot, null));
      p.add(Phase.fromFirestore(dosSnapshot, null));
    } */


    /* final ref = db.collection("phases").withConverter(fromFirestore: Phase.fromFirestore, toFirestore: (Phase p, _) => p.toFirestore(),);

    final docSn = await ref.get();

    final dosc = docSn.docs;

    dosc.forEach((element) {print(element.data().title);});

     await db.collection("phases")
    .get()
    .then((value) {
      for (var doc in value.docs) {
        print("${doc.id} => ${doc.data()}");
      }
    }); */ 
  //}

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Calendario',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: PhaseList(),
        /* body: Center(
          child: ElevatedButton(onPressed: () { getData(); }, child: const Text('presss')),
        ) ,*/
      ),
    );
  }
}

