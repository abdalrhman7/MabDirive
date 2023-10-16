import '../../../Features/Auth/Login/Models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyDataBase {
  static CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection(UserModel.collectionName)
        .withConverter<UserModel>(
          fromFirestore: (snapshot, options) =>
              UserModel.fromFireStore(snapshot.data()),
          toFirestore: (user, options) => user.toFireStore(),
        );
  }

  static Future<void> addUser(UserModel user) {
    var collection = getUsersCollection();
    return collection.doc(user.id).set(user);
  }

  static Future<UserModel?> readUser(String id) async {
    var collection = getUsersCollection();
    var docSnapshot = await collection.doc(id).get();
    return docSnapshot.data();
  }
}
