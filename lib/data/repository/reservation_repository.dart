import 'package:either_dart/either.dart';
import 'package:get/utils.dart';
import 'package:gores/base/lang/en_US.dart';
import 'package:gores/data/models/default_error.dart';
import 'package:gores/data/models/reservation.dart';

import '../database.dart';
import 'auth_repository.dart';

class ReservationRepository {
  final _db = Database.instance;
  final AuthRepository _authRepository;

  ReservationRepository(this._authRepository);

  Future<Either<DefaultError, Stream<List<Reservation>>>> getReservations(
      String restId, Date date) async {
    try {
      if (_authRepository.isLoggedIn())
        return Right(await _db.getReservationsStream(restId, date));
    } catch (e) {
      return Left(DefaultError(message: e.toString()));
    }
    return Left(DefaultError(message: unauthorized.tr));
  }

  Future<Either<DefaultError, void>> addReservation(
      Reservation reservation) async {
    try {
      if (_authRepository.isLoggedIn())
        return Right(await _db.addReservation(reservation));
    } catch (e) {
      return Left(DefaultError(message: e.toString()));
    }
    return Left(DefaultError(message: unauthorized.tr));
  }
}
