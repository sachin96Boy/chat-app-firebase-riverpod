import 'package:chat_app_firebase/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  // instance of firebase auth
  final FirebaseAuth _firebaseAuth;

  // instance of firestore auth
  final FirebaseFirestore _firestore;

  ChatService(this._firebaseAuth, this._firestore);

// send message
  Future<void> sendMessage(String receiverId, String message) async {
    // get current user info
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final timeStamp = Timestamp.now();

    // create a new message
    final newMessage = MessageModel(
      senderId: currentUserId,
      senderEmail: currentUserEmail,
      receiverId: receiverId,
      message: message,
      timestamp: timeStamp,
    );

    // construt chatroom id from current user id and receiver id (sort them to ensure uniqe id for each)

    List<String> ids = [currentUserId, receiverId];
    ids.sort(); // sort ids (this make sure chatroom ids are same for any pair of users)
    String chatRoomId = ids.join("_");

    // add new message to db

    await _firestore
        .collection("CHAT_ROOMS")
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }

  // get messages
  Stream<QuerySnapshot> getMessages(String userId, String otherUserId) {
    // construct chat room id
    List<String> ids = [userId, otherUserId];
    ids.sort();
    final charRoomId = ids.join("_");

    return _firestore
        .collection("CHAT_ROOMS")
        .doc(charRoomId)
        .collection("messages")
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
