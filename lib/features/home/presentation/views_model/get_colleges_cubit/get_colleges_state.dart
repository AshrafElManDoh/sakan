part of 'get_colleges_cubit.dart';

@immutable
sealed class GetCollegesState {}

final class GetCollegesInitial extends GetCollegesState {}

final class GetCollegesLoading extends GetCollegesState {}

final class GetCollegesSuccess extends GetCollegesState {
  final List<CollegeModel> colleges;

  GetCollegesSuccess({required this.colleges});
}

final class GetCollegesFailure extends GetCollegesState {
  final String errmsg;

  GetCollegesFailure({required this.errmsg});
}
