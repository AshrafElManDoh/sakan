import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sakan/features/home/data/models/ai_response_model/ai_response_model.dart';
import 'package:sakan/features/home/data/repos/home_repo.dart';

part 'get_ai_information_state.dart';

class GetAiInformationCubit extends Cubit<GetAiInformationState> {
  GetAiInformationCubit(this.homeRepo) : super(GetAiInformationInitial());
  final HomeRepo homeRepo;

  getResponse({required String roomLink}) async {
    emit(GetAiInformationLoading());
    var response = await homeRepo.getAiResponse(roomLink: roomLink);
    response.fold(
      (failure) {
        emit(GetAiInformationFailure(errmsg: failure.errmsg));
      },
      (respone) {
        emit(GetAiInformationSuccess(aiResponseModel: respone));
      },
    );
  }
}
