import 'package:firestore_bloc_1/bloc_patter/phase_bloc.dart';
import 'package:firestore_bloc_1/bloc_patter/phase_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhaseListWidget extends StatefulWidget {
  const PhaseListWidget({super.key});

  @override
  State<PhaseListWidget> createState() => _PhaseListState(); 
  
}

class _PhaseListState extends State<PhaseListWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhaseBloc, PhaseState>(
      builder: (context, state) {
        switch (state.status) {
          case PhaseStatus.failure:
            return const Center(child: Text('Failed to fetch phases'));
          case PhaseStatus.success:
            if (state.phases.isEmpty) {
              return const Center(child: Text('No phases'),);
            } 

            return ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(state.phases[index].title),
                  subtitle: Text(state.phases[index].description),
                  isThreeLine: true,
                  );
              } , 
              separatorBuilder: (BuildContext context, int index) => const Divider(),
              itemCount: state.phases.length,
              );

          case PhaseStatus.initial:
            return const Center(child: CircularProgressIndicator(),);
        }
      }
      );
  }

}