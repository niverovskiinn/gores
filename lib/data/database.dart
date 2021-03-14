import 'package:cloud_firestore/cloud_firestore.dart';

import 'models/profile.dart';

class Database {
  static const users = "users";

  Database._();

  static final Database _instance = Database._();

  static Database get instance => _instance;

  final _db = FirebaseFirestore.instance;

  Future<void> createProfile(Profile profile) async {
    await _db.collection(users).doc(profile.id).set(profile.toJson());
  }

  Future<Profile> getProfile(String id) async {
    final doc = await _db.collection(users).doc(id).get();
    return Profile.fromJson(doc.data()!);
  }
}
