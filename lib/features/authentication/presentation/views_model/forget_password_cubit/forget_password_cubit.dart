import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sakan/features/authentication/data/repos/auth_repo.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.authRepo) : super(ForgetPasswordInitial());
  final AuthRepo authRepo;

  Future<void> forgetPassword({required String email}) async {
    emit(ForgetPasswordLoading());
    var response = await authRepo.forgetPassword(email: email);

    response.fold((failure) {
      emit(
        ForgetPasswordFailure(errmsg: failure.errmsg),
      );
    }, (success) {
      emit(
        ForgetPasswordSuccess(msg: "Verification code was sent successfully"),
      );
    });
  }
}
