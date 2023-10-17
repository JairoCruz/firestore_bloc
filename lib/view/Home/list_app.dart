import 'package:firestore_bloc_1/view/Phases/phase_list.dart';
import 'package:flutter/material.dart';

class HomeApp extends StatelessWidget{
  const HomeApp({super.key}) : super();
    
      @override
      Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Home'),
            ),
            body: Column(
      children: [
        ElevatedButton(
         onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PhaseList())
          );
         },
         child: const Text('Phases')
         )
      ],
    ),
          );
      }

}