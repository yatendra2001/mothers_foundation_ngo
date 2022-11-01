import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:mothers_foundation_ngo/models/models.dart';
import 'package:mothers_foundation_ngo/repositories/repositories.dart';
import 'package:mothers_foundation_ngo/utils/session_helper.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;
  LoginCubit(
      {required AuthRepository authRepository,
      required UserRepository userRepository})
      : _authRepository = authRepository,
        _userRepository = userRepository,
        super(LoginState.initial());

  String phone = '';
  void sendOtpOnPhone({required String phone}) async {
    if (state.status == LoginStatus.submitting) return;
    emit(state.copyWith(status: LoginStatus.submitting));
    try {
      final isOtpSent = await _authRepository.sendOTP(phone: phone);
      SessionHelper.phone = phone;
      debugPrint("Send otp complete: $phone  $isOtpSent");
      emit(state.copyWith(status: LoginStatus.otpSent));
    } on Failure catch (err) {
      emit(state.copyWith(failure: err, status: LoginStatus.error));
    }
  }

  void verifyOtp({required String otp, Map<String, dynamic>? json}) async {
    try {
      emit(state.copyWith(status: LoginStatus.otpVerifying));
      final userCredential =
          await _authRepository.verifyOTP(otp: otp, json: json);
      debugPrint("UserCredentials:  $userCredential");
      debugPrint("User uid: ${userCredential.user?.uid}");
      debugPrint(
          "Current User uid: ${auth.FirebaseAuth.instance.currentUser!.uid}");
      SessionHelper.uid = userCredential.user?.uid;
      SessionHelper.phone = userCredential.user?.phoneNumber;
      emit(state.copyWith(status: LoginStatus.success));
    } catch (err) {
      emit(state.copyWith(
          failure: const Failure(message: "Unable to verify otp"),
          status: LoginStatus.error));
    }
  }

  Future<bool> checkNumber(String phone, {bool newAccount = false}) async {
    return await _userRepository.searchUserbyPhone(
        query: "+91" + phone, newAccount: newAccount);
  }

  void checkUsername(String username) async {
    try {
      if (username.length < 4) {
        emit(state.copyWith(usernameStatus: UsernameStatus.usernameExists));
      } else {
        final check =
            await _userRepository.searchUserbyUsername(query: username);
        if (check == false) {
          emit(state.copyWith(usernameStatus: UsernameStatus.usernameExists));
        } else if (check == true) {
          emit(
              state.copyWith(usernameStatus: UsernameStatus.usernameAvailable));
        }
      }
    } on Failure catch (err) {
      emit(state.copyWith(failure: err, status: LoginStatus.error));
    }
  }

  void logoutRequested() {
    emit(state.copyWith(status: LoginStatus.initial));
  }
}
