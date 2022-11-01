import 'package:mothers_foundation_ngo/models/models.dart';

abstract class BaseUserRepository {
  Future<User> getUserWithId({required String userId});
  Future<void> updateUser({required User user});
  Future<void> setUser({required User user});
  Future<bool> searchUserbyPhone(
      {required String query, required bool newAccount});
  Future<bool> searchUserbyUsername({required String query});
}
