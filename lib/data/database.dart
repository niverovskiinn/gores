import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gores/data/models/restaurant.dart';

import 'models/profile.dart';

class Database {
  static const users = "users";
  static const restaurants = "restaurants";
  static const id = "id";

  Database._();

  static final Database _instance = Database._();

  static Database get instance => _instance;

  final _db = FirebaseFirestore.instance;

  Future<void> createProfile(Profile profile) async {
    await _db.collection(users).doc(profile.id).set(profile.toJson());
  }

  Future<Profile?> getProfile(String id) async {
    final doc = await _db.collection(users).doc(id).get();
    final data = doc.data();
    return data != null ? Profile.fromJson(data) : null;
  }

  Future<void> addRestaurant(Restaurant restaurant) async {
    await _db.collection(restaurants).add(restaurant.toJson());
  }

  Future<List<Restaurant>> getRestaurants() async {
    final doc = await _db.collection(restaurants).get();
    final docs = doc.docs;
    final res = <Restaurant>[];
    docs.forEach((e) {
      if (e.exists) {
        res.add(Restaurant.fromJson(e.data()!));
      }
    });
    return res;
  }

  Future<Stream<List<Restaurant?>>> getAdminRestaurants(String adminId) async {
    final admin = await _db.collection(users).doc(adminId).get();
    final restIds = admin.data()?[restaurants] as List;
    print("restIds  $restIds");
    final restaurantsSnapshot =
        _db.collection(restaurants).where(id, whereIn: restIds).snapshots();
    return restaurantsSnapshot.map((e) {
      return e.docs.map((element) {
        return element.exists ? Restaurant.fromJson(element.data()!) : null;
      }).toList();
    });
  }
}
