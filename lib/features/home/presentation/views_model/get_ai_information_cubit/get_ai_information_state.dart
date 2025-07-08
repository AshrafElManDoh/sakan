part of 'get_ai_information_cubit.dart';

@immutable
sealed class GetAiInformationState {}

final class GetAiInformationInitial extends GetAiInformationState {}

final class GetAiInformationLoading extends GetAiInformationState {}

final class GetAiInformationSuccess extends GetAiInformationState {
  final AiResponseModel aiResponseModel;

  GetAiInformationSuccess({required this.aiResponseModel});
}

final class GetAiInformationFailure extends GetAiInformationState {
  final String errmsg;

  GetAiInformationFailure({required this.errmsg});
}
