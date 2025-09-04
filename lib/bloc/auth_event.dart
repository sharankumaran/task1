part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthLoginRequested extends AuthEvent {
  final String email;
  final String password;

  AuthLoginRequested({required this.email, required this.password});
}

final class AuthRegisterRequest extends AuthEvent {
  final String name;
  final String email;
  final String password;
  AuthRegisterRequest({
    required this.name,
    required this.email,
    required this.password,
  });
}
