
class MyUserEntity {
  String userId;
  String email; 
  String phoneNumber;
  bool hasActive;

  MyUserEntity({
    required this.userId,
    required this.email,
    required this.phoneNumber,
    required this.hasActive
  });

  Map<String, Object?> toJson() {
    return {
      'userId': userId,
      'email': email,
      'phoneNumber': phoneNumber,
      'hasActive': hasActive
    };
  }
  static MyUserEntity fromJson(Map<String, Object?> json) {
    return MyUserEntity(
      userId: json['userId'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      hasActive: json['hasActive'] as bool
    );
  }
} 