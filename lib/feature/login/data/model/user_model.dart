import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({
    required this.accessToken,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      accessToken: json['accessToken'] as String? ?? '',
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      email: json['email'] as String? ?? '',
    );
  }

  const UserModel.empty()
    : accessToken = '',
      firstName = '',
      lastName = '',
      email = '';

  final String accessToken;
  final String firstName;
  final String lastName;
  final String email;

  @override
  List<Object?> get props => [accessToken, firstName, lastName, email];
}
