import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class StorageHandler{
  static final storage = FirebaseStorage.instance;
  static final Reference storageRef = FirebaseStorage.instance.ref();

  static Future uploadApartmentImages(List<XFile> images , List<String> imagesLinks)async{
    var firebaseUser = FirebaseAuth.instance.currentUser;
    for(XFile file in images){
      final task = storageRef.child("${file.path}/${firebaseUser?.uid}").putFile(File(file.path));
      await task.whenComplete(() => null).then((value) async{
        await value.ref.getDownloadURL().then((value) {
          imagesLinks.add(value);
        });
      });

    }
  }
}