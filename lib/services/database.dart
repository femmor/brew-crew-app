import 'package:brew_crew/models/brew.dart';
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

  // Get brewlist from the snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Brew(
        name: doc.data()["name"] ?? "",
        sugars: doc.data()["sugars"] ?? "0",
        strength: doc.data()["strength"] ?? 0,
      );
    }).toList();
  }

  // Get brews Stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }
}
