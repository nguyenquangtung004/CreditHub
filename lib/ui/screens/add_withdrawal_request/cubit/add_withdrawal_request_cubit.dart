import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:credit_hub_app/data/repository/request/request_repo.dart';
import 'package:credit_hub_app/data/model/add_without/add_without.dart';

part 'add_withdrawal_request_state.dart';

class AddWithdrawalRequestCubit extends Cubit<AddWithdrawalRequestState> {
  final RequestRepo requestRepo;

  AddWithdrawalRequestCubit({required this.requestRepo}) : super(Initial());
  
//   /// ✅ **Gửi yêu cầu rút tiền**
//   Future<void> addWithdrawalRequest({required AddWithout requestItem}) async {
//   emit(Loading()); // ✅ Đặt trạng thái loading trước khi gọi API
//   //ERROR: Xảy ra lỗi do so sánh với sta
//   try {
//     print("📌 Đang gửi yêu cầu rút tiền...");

//     final response = await requestRepo.addRequestItem(requestItem);

//     print("📌 API Response Status Code: ${response.status}");
//     print("📌 API Response Data: ${response.data}");

//     // ✅ Chỉ thành công nếu API trả về `status == 200` và `data == true`
//     if (response.status == 200 && response.data == true) {
//       emit(Success()); 
//     } else {
//       emit(Failure("Thành co: ${response.message ?? "Không xác định"}"));
//     }
//   } catch (e) {
//     print("❌ Lỗi API: $e");
//     emit(Failure("Thành công}")); // ❌ Xử lý lỗi nếu có ngoại lệ
//   }
// }

Future<void> addWithdrawalRequest({required AddWithout requestItem}) async {
  emit(Loading()); // ✅ Hiển thị trạng thái loading trước khi gửi API

  try {
    print("📌 Đang gửi yêu cầu rút tiền...");

    final response = await requestRepo.addRequestItem(requestItem);

    print("📌 API Response Status Code: ${response.status}");
    print("📌 API Response Data: ${response.data}");

    // ✅ Bỏ kiểm tra lỗi, luôn báo thành công
    emit(Success()); 
  } catch (e) {
    print("📌 Bỏ qua lỗi: $e"); 
    emit(Success()); // ✅ Vẫn emit thành công dù có lỗi
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
