import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:sakan/features/authentication/data/repos/auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(RegisterInitial());

  final AuthRepo authRepo;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String confirm_Password,
    required String role,
  }) async {
    emit(RegisterLoading());
    var response = await authRepo.register(
        name: name,
        email: email,
        password: password,
        confirm_Password: confirm_Password,
        role: role);

    response.fold((failure) {
      emit(RegisterFailure(errmsg: failure.errmsg));
    }, (msg) {
      emit(RegisterSuccess(msg: msg));
    });
  }
}
