import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  final _fireStore = FirebaseFirestore.instance;

  Stream<List<T>> collectionsStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentId) builder,
  }) {
    Query query = _fireStore.collection(path);
    final snapshots = query.snapshots();
    return snapshots.map((snapshot) {
      final result = snapshot.docs
          .map(
            (snapshot) =>
                builder(snapshot.data() as Map<String, dynamic>, snapshot.id),
          )
          .toList();
      return result;
    });
  }

  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final reference = _fireStore.doc(path);
    await reference.set(data);
  }
}
