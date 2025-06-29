part of 'reset_password_cubit.dart';

@immutable
sealed class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}

final class ResetPasswordSuccess extends ResetPasswordState {
  final String msg;

  ResetPasswordSuccess({required this.msg});
}

final class ResetPasswordLoading extends ResetPasswordState {}

final class ResetPasswordFailure extends ResetPasswordState {
  final String errmsg;

  ResetPasswordFailure({required this.errmsg});
}
