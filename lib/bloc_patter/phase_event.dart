import 'package:equatable/equatable.dart';

sealed class PhaseEvent extends Equatable {

@override
List<Object> get props => [];

}

final class PhaseFetched extends PhaseEvent {}