import 'package:firestore_bloc_1/bloc_patter/phase_event.dart';
import 'package:firestore_bloc_1/bloc_patter/phase_bloc.dart';
import 'package:firestore_bloc_1/view/Phases/phase_list_widget.dart';
import 'package:firestore_bloc_1/repository/firestore_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhaseList extends StatelessWidget {
  const PhaseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Fases')),
        body: BlocProvider(
          create: (_) => PhaseBloc(FirestoreRepository())..add(PhaseFetched()),
          child: const PhaseListWidget(),
        ),
      );
  }

}