import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasks/models/task_model.dart';

class MyServicesFirestore {
  String collection;
  MyServicesFirestore({required this.collection});

  late final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection(collection);

//add

  Future<String> addTask(TaskModel model) async {
    DocumentReference documentReference =
        await _collectionReference.add({model.toJson()});
    String id = documentReference.id;
    return id;
  }

//delete

//update

}
