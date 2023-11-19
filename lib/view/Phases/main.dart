import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc_patter/phase_bloc.dart';
import '../../bloc_patter/phase_event.dart';
import '../../bloc_patter/phase_state.dart';

class HomePhase extends StatefulWidget {
  @override
  _HomePhase createState() => _HomePhase();
}

class _HomePhase extends State<HomePhase> {
  _HomePhase();

  String greetings = 'Selecciona unas fase';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhaseBloc, PhaseState>(builder: (context, state) {
      switch (state.status) {
        case PhaseStatus.failure:
          return const Center(
            child: Text('Fallo en recuperar datos'),
          );
        case PhaseStatus.success:
          if (state.phases.isEmpty) {
            return const Center(
              child: Text('No hay fases'),
            );
          }
          ///
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        showDialogPhase(context, state);
                      },
                      label: Text(state.txtButtonPhase.toString()),
                      icon: const Icon(Icons.arrow_drop_down),
                    ),
                  )),
                ],
              ), 
              Expanded(
                child: Container(
                  child: ListView.separated(
                    itemBuilder: (BuildContext context, index) {
                      return ListTile(
                        title: Text(state.activities[index].activity),
                      );
                    },
                    itemCount: state.activities.length,
                    separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                    ),
                  ) ,
              )

              /* (state.activities.isEmpty) ? 
              const Text('no hay datos') : 
              const Text('si hay muchos datos'), */

              
                          
            ],
          );
        case PhaseStatus.initial:
          return const Center(
            child: CircularProgressIndicator(),
          );
      }

      

    }
    );
  }

  Future<void> showDialogPhase(BuildContext context, PhaseState ps) {
    return showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext contextx) {
          return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(contextx);
                  },
                ),
                title: const Text('Fases'),
              ),
              body: ListView.separated(
                itemBuilder: (BuildContext contextt, int index) {
                  return ListTile(
                    title: Text(ps.phases[index].title),
                    subtitle: Text(ps.phases[index].description),
                    isThreeLine: true,
                    onTap: () {
                      context.read<PhaseBloc>().add(TxtButtonPhase(ps.phases[index].title, ps.phases[index].id));
                      /* setState(() {
                        greetings = ps.phases[index].title.toString();
                      }); */
                      Navigator.pop(contextt);
                      //context.read<PhaseBloc>().add(ActivityFetched(state.phases[index].id));
                      /*  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Activities())
                    ); */
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemCount: ps.phases.length,
              ));
        },
        isScrollControlled: true);
  }
}
