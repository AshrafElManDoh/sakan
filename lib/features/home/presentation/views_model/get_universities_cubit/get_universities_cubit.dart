import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sakan/features/home/data/models/university_model/university_model.dart';
import 'package:sakan/features/home/data/repos/home_repo.dart';

part 'get_universities_state.dart';

class GetUniversitiesCubit extends Cubit<GetUniversitiesState> {
  GetUniversitiesCubit(this.homeRepo) : super(GetUniversitiesInitial());
  final HomeRepo homeRepo;

  List<UniversityModel> allUniversities = [];

  Future<void> getUniversities() async {
    emit(GetUniversitiesLoading());
    var response = await homeRepo.getUniversities();
    response.fold(
      (failure) {
        emit(GetUniversitiesFailure(errmsg: failure.errmsg));
      },
      (universities) {
        allUniversities = universities;
        emit(GetUniversitiesSuccess(universities: universities));
      },
    );
  }

  void filterUniversities({required String query}) {
    final filtered = allUniversities
        .where((university) =>
            university.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();
        emit(GetUniversitiesSuccess(universities: filtered));
  }
}
