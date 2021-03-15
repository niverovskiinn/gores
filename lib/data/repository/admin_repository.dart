import 'package:gores/data/database.dart';
import 'package:gores/data/models/restaurant.dart';
import 'package:gores/data/repository/auth_repository.dart';

class AdminRepository {
  final _db = Database.instance;
  final AuthRepository _authRepository;

  AdminRepository(this._authRepository);

  Future<Stream<List<Restaurant?>>> getRestaurants() async {
    if (_authRepository.isLoggedIn())
      return await _db.getAdminRestaurants(_authRepository.currentUser!.uid);
    return Stream.empty();
  }
}
