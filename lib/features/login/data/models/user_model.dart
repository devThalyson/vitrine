import 'package:login/features/login/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.email, required super.name});

  static UserModel fromMap({required Map<String, dynamic> map}) {
    return UserModel(email: map['email'], name: map['name']);
  }
}
