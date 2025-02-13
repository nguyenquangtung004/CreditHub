import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:credit_hub_app/data/repository/request/request_repo.dart';
import 'package:credit_hub_app/data/model/add_without/add_without.dart';

part 'add_withdrawal_request_state.dart';

class AddWithdrawalRequestCubit extends Cubit<AddWithdrawalRequestState> {
  final RequestRepo requestRepo;

  AddWithdrawalRequestCubit({required this.requestRepo}) : super(Initial());

  /// ✅ **Gửi yêu cầu rút tiền**
  Future<void> addWithdrawalRequest({
    required AddWithout requestItem,
    List<File>? imageFiles,
  }) async {
    emit(Loading());

    try {
      List<String> imageUrls = [];

      // 📌 **Nếu có ảnh, tải lên trước khi gửi yêu cầu**
      if (imageFiles != null && imageFiles.isNotEmpty) {
        emit(UploadingImages()); // 🔥 Trạng thái riêng cho tải ảnh
        imageUrls = await requestRepo.uploadMultipleImages(imageFiles);
      }

      // ✅ **Tạo request với danh sách đường dẫn ảnh**
      final updatedRequest =
          requestItem.copyWith(image_link: imageUrls.isNotEmpty ? imageUrls.first : "");

      // 📌 **Gửi request lên API**
      final response = await requestRepo.addRequestItem(updatedRequest);

      if (response.data == true) {
        emit(Success());
      } else {
        emit(Failure("Thêm yêu cầu thất bại"));
      }
    } catch (e) {
      emit(Failure("Lỗi: ${e.toString()}"));
    }
  }

  /// ✅ **Hàm upload ảnh riêng biệt**
  Future<List<String>> uploadImages(List<File> files) async {
    try {
      emit(UploadingImages()); // ✅ Hiển thị trạng thái đang tải ảnh
      return await requestRepo.uploadMultipleImages(files);
    } catch (e) {
      emit(ImageUploadFailure("Lỗi upload ảnh: ${e.toString()}"));
      return [];
    }
  }
}
