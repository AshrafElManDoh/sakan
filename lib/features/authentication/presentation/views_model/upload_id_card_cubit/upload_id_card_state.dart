part of 'upload_id_card_cubit.dart';

@immutable
sealed class UploadIdCardState {}

final class UploadIdCardInitial extends UploadIdCardState {}

final class UploadIdCardLoading extends UploadIdCardState {}

final class UploadIdCardProcessImage extends UploadIdCardState {
  final String msg ;

  UploadIdCardProcessImage({required this.msg});
}

final class UploadIdCardSuccess extends UploadIdCardState {
  final IdCardModel id;

  UploadIdCardSuccess({required this.id});
}

final class UploadIdCardFailure extends UploadIdCardState {
  final String errmsg;

  UploadIdCardFailure({required this.errmsg});
}
