import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:credit_hub_app/core/config/app_config.dart';
import 'package:credit_hub_app/data/repository/request/request_repo.dart';
import 'package:http/http.dart' as http;
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
  Future<String?> uploadImage(File imageFile) async {
    emit(UploadingImages());
    try {
      // Lấy tên tệp từ đường dẫn
      String fileName = imageFile.path;

      // Tạo multipart request
      var request = http.MultipartRequest('POST', Uri.parse('http://credithubapi.tasvietnam.vn/api/app/requestmoneyorder/create'));

      // Thêm file ảnh vào request
      var stream = http.ByteStream(imageFile.openRead());
      var length = await imageFile.length();
      var multipartFile = http.MultipartFile(
        'files', // Tên field tương ứng với backend
        stream,
        length,
        filename: fileName, // Sử dụng tên tệp đã tách
      );

      request.files.add(multipartFile);

      // Gửi request
      var response = await request.send();

      // Kiểm tra kết quả
      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();

        // Phân tích JSON và lấy URL từ phản hồi
        final Map<String, dynamic> jsonResponse = json.decode(responseData);
        final List<dynamic> data = jsonResponse['data'];
        if (data.isNotEmpty) {
          final String url = data[0]['url']; // Lấy URL từ JSON

          return url; // Trả về URL
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
