import '../../../Features/Auth/Login/Models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../Features/History/Models/history_model.dart';

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


  static CollectionReference<HistoryModel> getHistoryCollection(String uid) {
    return FirebaseFirestore.instance
        .collection(HistoryModel.collectionName)
        .withConverter<HistoryModel>(
      fromFirestore: (snapshot, options) =>
          HistoryModel.fromFireStore(snapshot.data()),
      toFirestore: (history, options) => history.toFireStore(),
    );
  }


  static Future<void> addHistory(String uid,HistoryModel history){
    var newHistoryDoc = getHistoryCollection(uid)
        .doc();
    history.id = newHistoryDoc.id;
    return newHistoryDoc.set(history);

  }

  static Future<QuerySnapshot<HistoryModel>>getHISTORY(String uId){
    return getHistoryCollection(uId)
        .get();
  }


}
