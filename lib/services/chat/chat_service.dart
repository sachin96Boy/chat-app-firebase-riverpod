import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  // instance of firebase auth
  final FirebaseAuth _firebaseAuth;

  // instance of firestore auth
  final FirebaseFirestore _firestore;

  ChatService(this._firebaseAuth, this._firestore);

  Future<void> sendMessage(String receiverId, String message) async{
    
  }
}
