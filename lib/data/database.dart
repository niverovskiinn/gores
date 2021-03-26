import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gores/data/models/reservation.dart';
import 'package:gores/data/models/restaurant.dart';

import 'models/profile.dart';

class Database {
  static const users = "users";
  static const restaurants = "restaurants";
  static const id = "id";
  static const reservations = "reservations";
  static const date = "date";
  static const restId = "restId";

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

  Future<void> addRestaurant(String userId, Restaurant restaurant) async {
    if (restaurant.id == null) return;
    final batch = _db.batch();
    batch.set(
        _db.collection(restaurants).doc(restaurant.id), restaurant.toJson());
    batch.update(_db.collection(users).doc(userId), {
      restaurants: FieldValue.arrayUnion([restaurant.id])
    });
    await batch.commit();
  }

  Future<void> addAdminRestaurants(String userId, List<String> restIds) async {
    await _db
        .collection(users)
        .doc(userId)
        .update({restaurants: FieldValue.arrayUnion(restIds)});
  }

  Future<void> updateRestaurant(String id, Restaurant restaurant) async {
    await _db.collection(restaurants).doc(id).update(restaurant.toJson());
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

  Future<Stream<List<Restaurant?>>> getRestaurantsStream() async {
    final restaurantsSnapshot = _db.collection(restaurants).snapshots();
    return restaurantsSnapshot.map((e) {
      return e.docs.map((element) {
        return element.exists ? Restaurant.fromJson(element.data()!) : null;
      }).toList();
    });
  }

  Future<Stream<List<Reservation>>> getReservationsStream(
      String reservRestId, Date reservDate) async {
    final reservationsSnapshot = _db
        .collection(reservations)
        .where(date, isEqualTo: reservDate)
        .where(restId, isEqualTo: reservRestId)
        .snapshots();
    return reservationsSnapshot.map((e) {
      return e.docs
          .where((e) => e.exists)
          .map((element) => Reservation.fromJson(element.data()!))
          .toList();
    });
  }

  Future<void> addReservation(Reservation reservation) async {
    await _db.collection(reservations).add(reservation.toJson());
  }
}
