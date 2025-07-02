import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sakan/features/home/data/models/apartment_model/apartment_model.dart';
import 'package:sakan/features/home/data/repos/home_repo.dart';

part 'get_apartments_state.dart';

class GetApartmentsCubit extends Cubit<GetApartmentsState> {
  GetApartmentsCubit(this.homeRepo) : super(GetApartmentsInitial());

  final HomeRepo homeRepo;

  Future<void> getApartment() async {
    emit(GetApartmentsLoading());
    var response = await homeRepo.getApartments();
    response.fold(
      (failure) {
        emit(GetApartmentsFailure(errmsg: failure.errmsg));
      },
      (apartments) {
        emit(GetApartmentsSuccess(listOfApartment: apartments));
      },
    );
  }
}
