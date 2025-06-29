part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final String msg;

  LoginSuccess({required this.msg});
}

final class LoginFailure extends LoginState {
  final String errmsg;

  LoginFailure({required this.errmsg});
}
