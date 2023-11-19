import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/activity.dart';
import '../model/phase.dart';

class FirestoreService {

  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<List<Phase>> getPhases() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await db
      .collection('calendario_2023')
      .doc('local')
      .collection('phases')
      .get();

    return snapshot
            .docs.map((docSnapshot) => Phase.fromFirestore(docSnapshot, null))
            .toList();
  }


  // Get Activities from phases
  Future<List<Activity>> getActivitiesByPhase(int idDocument) async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await db
      .collection('calendario_2023')
      .doc('local')
      .collection('activities')
      .where('phase_id', isEqualTo: idDocument)
      .get();

      //print('todas las actividades ${snapshot.size}');
      print('from service: $idDocument');

      return snapshot
              .docs.map((docSnapshot) => Activity.fromFirestore(docSnapshot, null))
              .toList();

      // return snapshot
      //   .docs.map((docSnapshot) => )
  }

}

