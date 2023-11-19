
//part 'phase_bloc.dart';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_bloc_1/bloc_patter/phase_event.dart';
import 'package:firestore_bloc_1/bloc_patter/phase_state.dart';
import 'package:firestore_bloc_1/repository/firestore_repository.dart';


class PhaseBloc extends Bloc<PhaseEvent, PhaseState> {

  FirebaseFirestore db = FirebaseFirestore.instance;
  final FirestoreRepository fr;

  PhaseBloc(this.fr) : super(const PhaseState()) {
    on<PhaseFetched>(_onPhaseFetched);
    on<ActivityFetched>(_onActivityFetched);
    on<TxtButtonPhase>(_onTxtButtonPhase);
  }


  Future<void> _onTxtButtonPhase(TxtButtonPhase event, Emitter<PhaseState> emit) async {
  
    try {
     final listActivities = await fr.getActivitiesByPhase(event.idPhase);     
     return emit(        
        state.copyWith(
          activities: listActivities,
          txtButtonPhase: event.txtButtonPhase,
          idPhase: event.idPhase
        )        
      );     
    }
    catch (e) {
      print('hay un error: ${e.toString()}');
    }
  }


  Future<void> _onPhaseFetched(PhaseFetched event, Emitter<PhaseState> emit) async {
    try {
      if (state.status == PhaseStatus.initial) {
        final phases = await fr.getListPhases();
        return emit(state.copyWith(
          status: PhaseStatus.success,
          phases: phases,
        ));
      }
    } catch (_) {
      emit(state.copyWith(status: PhaseStatus.failure));
    }
  }

  Future<void> _onActivityFetched(ActivityFetched event, Emitter<PhaseState> emit) async {
    
    try {
      if (state.status == PhaseStatus.success) {
        print('llego');
        final activities = await fr.getActivitiesByPhase(event.idD);
        return emit(state.copyWith(
          activities: activities,
        ));
       
      } 
    } catch(_){
      print('mal');
      emit(state.copyWith(status: PhaseStatus.failure));
    }
  }

/*  Este codigo es funcional, pero movi este codigo de aca a repository y service
   Future<List<Phase>> _fetchPhases() async {
    List<Phase> listPhases = [];
    QuerySnapshot<Map<String, dynamic>> data = await db.collection('calendario_2023').doc('local').collection('phases').get();
    data.docs.forEach((element) { 
      listPhases.add(Phase.fromFirestore(element, null));
    });
    return listPhases;
  } 
 */
}