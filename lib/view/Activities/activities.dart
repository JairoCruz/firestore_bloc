import 'package:flutter/material.dart';

class Activities extends StatelessWidget {

  const Activities({super.key}) : super();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Activities'),
      ),
      body: const Center(child: Text('Lista de actividades'),),
    );
  }

}