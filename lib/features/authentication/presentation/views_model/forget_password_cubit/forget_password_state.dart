part of 'forget_password_cubit.dart';

@immutable
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordSuccess extends ForgetPasswordState {
  final String msg;

  ForgetPasswordSuccess({required this.msg});
}

final class ForgetPasswordLoading extends ForgetPasswordState {}

final class ForgetPasswordFailure extends ForgetPasswordState {
  final String errmsg;

  ForgetPasswordFailure({required this.errmsg});
}
