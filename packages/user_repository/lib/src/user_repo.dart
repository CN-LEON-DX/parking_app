import 'package:user_repository/src/models/user.dart';

abstract class UserRepository {
  Stream<MyUser?> get user;
  
  Future<MyUser?> signInWithPhoneNumber(String phoneNumber);
  Future<void> verifyOTP(String verificationId, String smsCodeUser);
}