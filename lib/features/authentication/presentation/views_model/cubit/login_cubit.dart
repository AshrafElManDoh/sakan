import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sakan/features/authentication/data/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo ;

  Future<void> login({required String email,required String password})async{
    emit(LoginLoading());
    var response=await authRepo.login(email: email, password: password);
    response.fold((failure){
      emit(LoginFailure(errmsg: failure.errmsg));
    }, (success){
      emit(LoginSuccess(msg: "Logged in successfully"));
    });
  }
}
