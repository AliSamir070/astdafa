
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/ApartmentModel.dart';
import '../model/CodeModel.dart';
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
  static CollectionReference<CodeModel> getCodeCollection(){
    return FirebaseFirestore.instance
        .collection(CodeModel.collectionName)
        .withConverter<CodeModel>(
        fromFirestore: (snapshot, options) =>CodeModel.fromJson(snapshot.data()),
        toFirestore: (code , options)=>code.toJson());

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

  static Future<CodeModel?> readCode(String code)async{
    var collection = getCodeCollection();
    QuerySnapshot<CodeModel> snapshot= await collection.where("code",isEqualTo: code,).limit(1).get();
    if(snapshot.docs.isEmpty){
      return null;
    }else{
      CodeModel codeModel = snapshot.docs[0].data();
      codeModel.id = snapshot.docs[0].id;
      return codeModel;
    }

  }
  static Future<void> updateCode(String id,Map<String , dynamic> data)async{
    var collection = getCodeCollection();
    var doc = collection.doc(id);
    return doc.update(data);
  }

  static CollectionReference<ApartmentModel> getApartmentCollectionRefrence(){
    return FirebaseFirestore.instance.collection(ApartmentModel.collection)
        .withConverter(
        fromFirestore: (snapshot , options)=>ApartmentModel.fromJson(snapshot),
        toFirestore: (apartment , options)=>apartment.toJson()
    );
  }

  static Future addApartment(ApartmentModel apartmentModel){
    var collection = getApartmentCollectionRefrence();
    var doc = collection.doc();
    apartmentModel.id = doc.id;
    return doc.set(apartmentModel);
  }
  static Future<List<QueryDocumentSnapshot<ApartmentModel>>> readAllApartments()async{
    var collection = getApartmentCollectionRefrence();
    QuerySnapshot<ApartmentModel> snapshot = await collection.get();
    return snapshot.docs;
  }
  static Future<List<QueryDocumentSnapshot<ApartmentModel>>> readApartmentsOfUser(String id)async{
    var collection = getApartmentCollectionRefrence();
    QuerySnapshot<ApartmentModel> snapshot = await collection.where("userId",isEqualTo: id).get();
    return snapshot.docs;
  }
}
