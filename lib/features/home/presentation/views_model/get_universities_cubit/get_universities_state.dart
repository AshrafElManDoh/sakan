part of 'get_universities_cubit.dart';

@immutable
sealed class GetUniversitiesState {}

final class GetUniversitiesInitial extends GetUniversitiesState {}
final class GetUniversitiesLoading extends GetUniversitiesState {}
final class GetUniversitiesSuccess extends GetUniversitiesState {
  final List<UniversityModel> universities ;

  GetUniversitiesSuccess({required this.universities}); 
}
final class GetUniversitiesFailure extends GetUniversitiesState {
  final String errmsg;

  GetUniversitiesFailure({required this.errmsg});
}
