import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sakan/features/home/data/models/apartment_model/apartment_model.dart';
import 'package:sakan/features/search/data/repos/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;

  List<ApartmentModel> allApartments = [];
  Future<void> search({required String value}) async {
    emit(SearchLoading());
    var response = await searchRepo.searchApartment();
    response.fold(
      (failure) {
        emit(SearchFailure(errmsg: failure.errmsg));
      },
      (apartments) {
        allApartments = apartments;
        emit(SearchSuccess(apartments: apartments));
      },
    );
  }

  filteredApartments({required String value}) {
    final filtered = allApartments
        .where(
          (apartment) =>
              apartment.titledto!.toLowerCase().contains(value.toLowerCase()),
        )
        .toList();
        emit(SearchSuccess(apartments: filtered));
  }
}
