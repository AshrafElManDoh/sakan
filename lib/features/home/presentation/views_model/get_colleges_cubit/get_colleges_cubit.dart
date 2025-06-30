import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sakan/features/home/data/models/college_model/college_model.dart';
import 'package:sakan/features/home/data/repos/home_repo.dart';

part 'get_colleges_state.dart';

class GetCollegesCubit extends Cubit<GetCollegesState> {
  GetCollegesCubit(this.homeRepo) : super(GetCollegesInitial());
  final HomeRepo homeRepo;
  List<CollegeModel> allColleges = [];
  Future<void> getColleges({required int universityId}) async {
    emit(GetCollegesLoading());
    var response = await homeRepo.getColleges(universityID: universityId);
    response.fold((failure) {
      emit(GetCollegesFailure(errmsg: failure.errmsg));
    }, (colleges) {
      allColleges = colleges;
      emit(GetCollegesSuccess(colleges: colleges));
    });
  }

  void filterColleges({required String query}) {
    final filtered = allColleges
        .where(
          (college) =>
              college.name!.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
    emit(GetCollegesSuccess(colleges: filtered));
  }
}
