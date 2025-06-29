part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final String msg;

  RegisterSuccess({required this.msg});
}

final class RegisterFailure extends RegisterState {
  final String errmsg;

  RegisterFailure({required this.errmsg});
}

final class RegisterLoading extends RegisterState {}
