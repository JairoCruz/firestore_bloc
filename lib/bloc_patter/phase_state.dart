
import 'package:equatable/equatable.dart';
import '../model/activity.dart';
import '../model/phase.dart';

enum PhaseStatus { initial, success, failure }

final class PhaseState extends Equatable {

  const PhaseState({
    this.status = PhaseStatus.initial,
    this.phases = const <Phase>[],
    this.activities = const <Activity>[],
    this.txtButtonPhase = "Elige una Fases",
    this.idPhase = 0
  });


final PhaseStatus status;
final List<Phase> phases;
final List<Activity> activities;
final String txtButtonPhase;
final int idPhase;



PhaseState copyWith({
  PhaseStatus? status,
  List<Phase>? phases,
  List<Activity>? activities,
  String? txtButtonPhase,
  int? idPhase
}){
  return PhaseState(
    status: status ?? this.status,
    phases: phases ?? this.phases,
    activities:  activities ?? this.activities,
    txtButtonPhase: txtButtonPhase ?? this.txtButtonPhase,
    idPhase: idPhase ?? this.idPhase,
  );
}

  @override
  String toString() {
    return ''' PhaseState { status: $status, phases: ${phases.length }} ''';
  }


  @override
  List<Object?> get props => [status, phases, activities, txtButtonPhase, idPhase];

}