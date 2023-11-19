import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

final class Activity extends Equatable {

  final String activity;
  final int dateStart;
  final int dateEnd;
  //final List<String> responsible;

  const Activity({
    required this.activity,
    required this.dateStart,
    required this.dateEnd,
   // required this.responsible
  });
  
  @override
  List<Object?> get props => [activity, dateStart, dateEnd,/* responsible*/];

  factory Activity.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options
  ){
    final data = snapshot.data();
    return Activity(
      activity: data?['activitiy'],
      dateStart: data?['date_start'],
      dateEnd: data?['date_end'],
      //responsible: data?['responsible']
      );
  }

}