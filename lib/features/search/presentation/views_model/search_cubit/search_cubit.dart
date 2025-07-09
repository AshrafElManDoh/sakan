import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sakan/features/home/data/models/apartment_model/apartment_model.dart';
import 'package:sakan/features/search/data/repos/search_repo.dart';

part 'search_state.dart';

enum PriceSortOrder { none, highToLow, lowToHigh }

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());

  final SearchRepo searchRepo;
  List<ApartmentModel> allApartments = [];
  bool showFilters = false;
  String currentSearch = '';
  PriceSortOrder currentSortOrder = PriceSortOrder.none;
  void toggleFilters() {
    showFilters = !showFilters;
    emit(ToggleFilterState());
    if (showFilters == false) {
      emit(SearchSuccess(apartments: allApartments));
    }
  }

  Future<void> search() async {
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

  void filteredApartments({required String value}) {
    currentSearch = value;
    if (showFilters) return;

    final filtered = allApartments
        .where((apartment) =>
            apartment.titledto!.toLowerCase().contains(value.toLowerCase()))
        .toList();
    emit(SearchSuccess(apartments: filtered));
  }

  void setPriceSortOrder(PriceSortOrder order) {
    currentSortOrder = order;
    emit(SortOrderChanged());
  }

  void applyFilters() {
    var filtered = allApartments
        .where((apartment) => apartment.titledto!
            .toLowerCase()
            .contains(currentSearch.toLowerCase()))
        .toList();
    if (currentSortOrder == PriceSortOrder.highToLow) {
      filtered.sort((a, b) =>
          (b.pricePerMonthdto ?? 0).compareTo(a.pricePerMonthdto ?? 0));
    } else if (currentSortOrder == PriceSortOrder.lowToHigh) {
      filtered.sort((a, b) =>
          (a.pricePerMonthdto ?? 0).compareTo(b.pricePerMonthdto ?? 0));
    }
    emit(SearchSuccess(apartments: filtered));
  }
}
