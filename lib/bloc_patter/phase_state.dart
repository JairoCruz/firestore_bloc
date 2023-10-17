
import 'package:equatable/equatable.dart';
import '../model/activity.dart';
import '../model/phase.dart';

enum PhaseStatus { initial, success, failure }

final class PhaseState extends Equatable {

  const PhaseState({
    this.status = PhaseStatus.initial,
    this.phases = const <Phase>[],
    this.activities = const <Activity>[],
  });


final PhaseStatus status;
final List<Phase> phases;
final List<Activity> activities;



PhaseState copyWith({
  PhaseStatus? status,
  List<Phase>? phases,
  List<Activity>? activities
}){
  return PhaseState(
    status: status ?? this.status,
    phases: phases ?? this.phases,
    activities:  activities ?? this.activities,
  );
}

  @override
  String toString() {
    return ''' PhaseState { status: $status, phases: ${phases.length }} ''';
  }


  @override
  // TODO: implement props
  List<Object?> get props => [status, phases];

}