part of 'add_withdrawal_request_cubit.dart';

/// ✅ `sealed class` thay thế `freezed`
sealed class AddWithdrawalRequestState {
  const AddWithdrawalRequestState();
}

/// ✅ Trạng thái ban đầu
class Initial extends AddWithdrawalRequestState {}

/// ✅ Trạng thái đang tải yêu cầu rút tiền
class Loading extends AddWithdrawalRequestState {}

/// ✅ Trạng thái đang tải ảnh lên server
class UploadingImages extends AddWithdrawalRequestState {}

/// ✅ Trạng thái thành công
class Success extends AddWithdrawalRequestState {}

/// ✅ Trạng thái thất bại khi gửi yêu cầu rút tiền
class Failure extends AddWithdrawalRequestState {
  final String error;
  Failure(this.error);
}

/// ✅ Trạng thái thất bại khi tải ảnh lên server
class ImageUploadFailure extends AddWithdrawalRequestState {
  final String error;
  ImageUploadFailure(this.error);
}
