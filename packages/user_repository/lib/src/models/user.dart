
import '../entites/entites.dart';
class MyUser {
  String userId;
  String email; 
  String address;
  String phoneNumber;
  bool hasActive;

  MyUser({
    required this.userId,
    required this.email,
    required this.address,
    required this.phoneNumber,
    required this.hasActive
  });

// Note: Notifies about change to the user's sign-in state
  static final empty = MyUser(userId: '', email: '', phoneNumber: '', hasActive: false, address: '');

  MyUserEntity toEntity(){
    return MyUserEntity(
      userId: userId,
      email: email,
      phoneNumber: phoneNumber,
      hasActive: hasActive
    );
  }

  static MyUser fromEntity(MyUserEntity entity){
    return MyUser(
      userId: entity.userId,
       email: entity.email,
       phoneNumber: entity.phoneNumber, 
       hasActive: entity.hasActive, address: ''
    );
  }

  @override
  String toString() {
    return 'MyUser: $userId, $email, $phoneNumber, $hasActive';
  }
} 