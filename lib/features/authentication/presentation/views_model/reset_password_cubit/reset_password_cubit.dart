import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sakan/features/authentication/data/repos/auth_repo.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.authRepo) : super(ResetPasswordInitial());
  final AuthRepo authRepo;

  Future<void> resetPassword(
      {required String email,
      required String verificationCode,
      required String newPassword,
      required String confirmPassword}) async {
    emit(ResetPasswordLoading());
    var response = await authRepo.resetPassword(
      email: email,
      verificationCode: verificationCode,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
    );

    response.fold((failure) {
      emit(
        ResetPasswordFailure(errmsg: failure.errmsg),
      );
    }, (success) {
      emit(
        ResetPasswordSuccess(msg: "Password has been reset successfully"),
      );
    });
  }
}
