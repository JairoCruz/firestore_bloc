import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

final class Phase extends Equatable {
 
 const Phase({
  required this.id,
  required this.title,
  required this.description,
 });

 final int id;
 final String title;
 final String description;
  
  @override
  // TODO: implement props
  List<Object?> get props => [title, description];


factory Phase.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options) {
      final data = snapshot.data();
      return Phase(
        id: data?['id'],
        title: data?['title'],
        description: data?['description']
      );
  }

   Map<String, dynamic> toFirestore() {
    return {
      if (title != null) "title": title,
      if (description != null) "description": description, 
    };
  }

}