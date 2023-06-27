import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:placementor/locator.dart';
import 'dart:async';
import '../Models/job_model.dart';

class DataBaseService {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final String path;
  late CollectionReference ref;

  DataBaseService(this.path) {
    ref = db.collection(path);
  }

  Future<QuerySnapshot> getDataCollection() {
    return ref.get();
  }

  Stream<QuerySnapshot> streamDataCollection() {
    return ref.snapshots();
  }

  Future<DocumentSnapshot> getDocumentById(String id) {
    return ref.doc(id).get();
  }

  Future<void> removeDocument(String id) {
    return ref.doc(id).delete();
  }

  Future<DocumentReference> addDocument(Map data) {
    return ref.add(data);
  }

  Future<void> updateDocument(Map<Object, Object> data, String id) {
    return ref.doc(id).update(data);
  }
}

class ReadInternDetails extends ChangeNotifier {
  DataBaseService api = DataBaseService('InternDetails');
  late List<InternDetails> interndetailsList;

  Future<List<InternDetails>> fetchInternList() async {
    var result = await api.getDataCollection();
    interndetailsList = result.docs
        .map((doc) =>
            InternDetails.fromMap(doc.data() as Map<Object, Object>, doc.id))
        .toList();
    return interndetailsList;
  }

  Stream<QuerySnapshot> fetchInternListAsStream() {
    return api.streamDataCollection();
  }
}
