import 'package:equatable/equatable.dart';

class UpdatePasswordModel extends Equatable {
  final String newPassword;
  final String passwordConfirm;
  final String currentPassword;
  final String token;

  const UpdatePasswordModel(
      {required this.newPassword,
      required this.passwordConfirm,
      required this.currentPassword,
      required this.token});

  Map<String, dynamic> toJson() => {
        'password': newPassword,
        'password_confirm': passwordConfirm,
        'current_password': currentPassword
      };

  @override
  List<Object?> get props => [newPassword, passwordConfirm, currentPassword];
}
