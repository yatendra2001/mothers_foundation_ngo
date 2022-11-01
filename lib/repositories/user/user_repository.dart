import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mothers_foundation_ngo/config/paths.dart';
import 'package:mothers_foundation_ngo/models/models.dart';
import 'package:mothers_foundation_ngo/repositories/repositories.dart';
import 'package:mothers_foundation_ngo/utils/session_helper.dart';
import 'package:mothers_foundation_ngo/widgets/widgets.dart';

class UserRepository extends BaseUserRepository {
  final FirebaseFirestore _firebaseFirestore;

  UserRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<User> getUserWithId({required String userId}) async {
    final doc =
        await _firebaseFirestore.collection(Paths.users).doc(userId).get();
    return doc.exists ? User.fromDocument(doc) : User.empty;
  }

  @override
  Future<void> updateUser({required User user}) async {
    await _firebaseFirestore
        .collection(Paths.users)
        .doc(user.id)
        .update(user.toDocument());
  }

  @override
  Future<void> setUser({required User user}) async {
    await _firebaseFirestore
        .collection(Paths.users)
        .doc(user.id)
        .set(user.toDocument());
  }

  @override
  Future<bool> searchUserbyPhone(
      {required String query, required bool newAccount}) async {
    try {
      return await _firebaseFirestore
          .collection(Paths.users)
          .where("phoneNumber", isEqualTo: query)
          .snapshots()
          .isEmpty;
    } on FirebaseException catch (err) {
      if (err.code == 'permission-denied') {
        flutterToast(
            msg: newAccount ? 'New Account' : 'Account does not exists',
            position: ToastGravity.CENTER);
      } else {
        flutterToast(msg: 'An Error occured', position: ToastGravity.CENTER);
      }
    } catch (err) {
      flutterToast(msg: 'An Error occured', position: ToastGravity.CENTER);
    }
    return true;
  }

  @override
  Future<bool> searchUserbyUsername({required String query}) async {
    try {
      final QuerySnapshot users = await _firebaseFirestore
          .collection(Paths.users)
          .where(Paths.usernameLower, isEqualTo: query.toLowerCase())
          .get();
      return users.size == 0;
    } on FirebaseException catch (err) {
      log(err.message!);
    } catch (e) {
      log(e.toString());
    }
    return false;
  }
}
