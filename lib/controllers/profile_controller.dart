import 'package:get/get.dart';
import 'package:gores/data/models/profile.dart';

class ProfileController extends GetxController {
  final _profile = Rx<Profile>();

  Profile get profile => _profile.value;

  set profile(Profile profile) => _profile.value = profile;

  clear() => _profile.nil();
}
