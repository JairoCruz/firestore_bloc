import 'package:cloud_firestore/cloud_firestore.dart';

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
}

