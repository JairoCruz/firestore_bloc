
import 'package:equatable/equatable.dart';
import '../model/phase.dart';

enum PhaseStatus { initial, success, failure }

final class PhaseState extends Equatable {

  const PhaseState({
    this.status = PhaseStatus.initial,
    this.phases = const <Phase>[],
  });


final PhaseStatus status;
final List<Phase> phases;


PhaseState copyWith({
  PhaseStatus? status,
  List<Phase>? phases,
}){
  return PhaseState(
    status: status ?? this.status,
    phases: phases ?? this.phases
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