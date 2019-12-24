import 'package:cloud_firestore/cloud_firestore.dart';

class MessageService{
   final _firestore = Firestore.instance;

  void saveMessages(
  { String collectionName, Map<String, dynamic> objValues}){
    this._firestore
      .collection(collectionName)
      .add(objValues);
  }

  Future<QuerySnapshot> getMessages() async {
    return await this._firestore
      .collection("messages")
      .getDocuments();
  }

}