import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/src/models/user.dart';
import 'user_repo.dart';

class FirebaseUserRepo implements UserRepository {
  final FirebaseAuth _firebaseAuth;
  String? _verificationId;
  
  FirebaseUserRepo({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Future<MyUser?> signInWithPhoneNumber(String phoneNumber) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _firebaseAuth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        throw e;
      },
      codeSent: (String verificationId, int? resendToken) {
        _verificationId = verificationId; 
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  // Các phương thức khác giữ nguyên

  @override
  Stream<MyUser?> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      // return firebaseUser != null ? MyUser.fromEntity(MyUserEntity.fromJson(firebaseUser)) : null;
    });
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
  
  @override
  Future<void> verifyOTP(String verificationId, String smsCode) async {
    final PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    await _firebaseAuth.signInWithCredential(credential);
  }
}