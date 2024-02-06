part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthLoginRequested extends AuthEvent {
  final String email, pass;

  AuthLoginRequested({required this.email, required this.pass});
}
