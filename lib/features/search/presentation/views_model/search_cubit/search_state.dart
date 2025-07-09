part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<ApartmentModel> apartments;

  SearchSuccess({required this.apartments});
}

final class SearchFailure extends SearchState {
  final String errmsg;

  SearchFailure({required this.errmsg});
}

final class SearchLoading extends SearchState {}

final class SearchView extends SearchState {}
