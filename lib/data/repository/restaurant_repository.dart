import 'package:either_dart/either.dart';
import 'package:get/utils.dart';
import 'package:gores/base/lang/en_US.dart';
import 'package:gores/data/models/default_error.dart';
import 'package:gores/data/models/restaurant.dart';

import '../database.dart';
import 'auth_repository.dart';

class RestaurantRepository {
  final _db = Database.instance;
  final AuthRepository _authRepository;

  RestaurantRepository(this._authRepository);

  Future<Either<DefaultError, Stream<List<Restaurant?>>>>
      getRestaurants() async {
    try {
      if (_authRepository.isLoggedIn())
        return Right(await _db.getRestaurantsStream());
    } catch (e) {
      return Left(DefaultError(message: e.toString()));
    }
    return Left(DefaultError(message: unauthorized.tr));
  }
}
