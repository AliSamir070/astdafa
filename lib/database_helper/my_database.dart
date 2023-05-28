
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user.dart';

class MyDataBase {
  static CollectionReference<User> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection(User.collectionName)
        .withConverter<User>(
          fromFirestore: (snapshot, options) =>
              User.fromFireStore(snapshot.data()),
          toFirestore: (user, options) => user.toFireStore(),
        );
  }

  static Future<void> addUser(User user , String id) {
    var collection = getUsersCollection();
    var doc = collection.doc(user.id);
    user.id = doc.id;
    return doc.set(user);
  }

  static Future<User?> readUser(String email, String password) async {
    var collection = getUsersCollection();
    var querySnapshot = await collection
        .where('email', isEqualTo: email)
        .where('password', isEqualTo: password)
        .limit(1)
        .withConverter(
          fromFirestore: (snapshot, options) =>
              User.fromFireStore(snapshot.data()),
          toFirestore: (user, options) => user.toFireStore(),
        )
        .get();

    var userDoc = querySnapshot.docs[0];
    var userData = userDoc.data();
    return userData;
  }
}
