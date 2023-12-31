import 'package:firestore_bloc_1/model/phase.dart';
import 'package:firestore_bloc_1/services/firestore_service.dart';

class FirestoreRepository implements DatabaseRepository {
  FirestoreService service = FirestoreService();

  @override
  Future<List<Phase>> getListPhases() {
    return service.getPhases();
  }
  
  @override
  Future<void> getActivitiesByPhase(int idDocument) {
    return service.getActivitiesByPhase(idDocument);
  }



}

abstract class DatabaseRepository {
  Future<List<Phase>> getListPhases();
  Future<void> getActivitiesByPhase(int idDocument);
}