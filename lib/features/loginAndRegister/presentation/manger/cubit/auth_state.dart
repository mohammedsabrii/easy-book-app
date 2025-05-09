part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class LogInAuthInitial extends AuthState {}

final class LogInAuthLoading extends AuthState {}

final class LogInAuthSuccess extends AuthState {}

final class LogInAuthFaliuer extends AuthState {
  final String erorrMassage;
  LogInAuthFaliuer({required this.erorrMassage});
}

final class RegisterAuthInitial extends AuthState {}

final class RegisterAuthLoading extends AuthState {}

final class RegisterAuthSuccess extends AuthState {}

final class RegisterAuthFaliuer extends AuthState {
  final String erorrMassage;

  RegisterAuthFaliuer({required this.erorrMassage});
}
