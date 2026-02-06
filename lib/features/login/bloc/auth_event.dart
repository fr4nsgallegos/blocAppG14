import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class LoginBubmitted extends AuthEvent {
  final String email;
  final String password;

  const LoginBubmitted({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
