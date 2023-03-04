 import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class StorageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance; // to get the user id


  // adding image to firebase storage
  // Could you use to store profile picture and posts
  Future<String> uploadImageToStorage(String childName, Uint8List file, bool isPost) async {
    // pointed to the file in our storage
    // child can be a folder that exists or doesn't exist
    Reference reference = _storage.ref().child(childName).child(_auth.currentUser!.uid);

    // if you put below data you can get upload task
    UploadTask uploadTask = reference.putData(file);

    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadURL = await taskSnapshot.ref.getDownloadURL(); // download url of the file that just uploaded above
    return downloadURL;
  }

}