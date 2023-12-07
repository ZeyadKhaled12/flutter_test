import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String name;
  final String email;
  final String countryCode;
  final String phone;
  final String token;
  final String id;

  const UserModel(
      {required this.name,
      required this.email,
      required this.countryCode,
      required this.phone,
      required this.token,
      required this.id});

  factory UserModel.fromJson(Map<String, dynamic> json, {String? token}) =>
      UserModel(
          name: json['name'],
          email: json['email'],
          countryCode: json['country_code'],
          phone: json['phone'],
          token: token ?? json['token'],
          id: json['id']);

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'country_code': countryCode,
        'phone': phone,
        'token': token,
        'id': id
      };

  @override
  List<Object?> get props => [name, email, countryCode, phone, token, id];
}
