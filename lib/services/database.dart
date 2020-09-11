import "package:cloud_firestore/cloud_firestore.dart";

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

//  collection reference
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection("brews");

  Future updateUserData(
    String name,
    String sugars,
    int strength,
  ) async {
    return await brewCollection.doc(uid).set({
      "name": name,
      "sugars": sugars,
      "strength": strength,
    });
  }

  // Get brews Stream
  Stream<QuerySnapshot> get brews {
    return brewCollection.snapshots();
  }
}
