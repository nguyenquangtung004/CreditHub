import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:credit_hub_app/ui/screens/add_withdrawal_request/add_withdrawal_request_barrel.dart';

part 'add_withdrawal_request_state.dart';

class AddWithdrawalRequestCubit extends Cubit<AddWithdrawalRequestState> {
  final RequestRepo requestRepo;

  AddWithdrawalRequestCubit({required this.requestRepo}) : super(Initial());
  /* -------------------------- Gửi yêu cầu rút tiền -------------------------- */
  Future<void> addWithdrawalRequest({required AddWithout requestItem}) async {
    emit(Loading()); // ✅ Đánh dấu trạng thái Loading khi bắt đầu

    try {
      print("📌 [START] Đang gửi yêu cầu rút tiền...");
      print("📌 Request Data: ${jsonEncode(requestItem.toJson())}");

      final response = await requestRepo.addRequestItem(requestItem);

      print("📌 [API RESPONSE] Status Code: ${response.status}");
      print("📌 [API RESPONSE] Data: ${response.data}");

      // ✅ Kiểm tra phản hồi từ API
      if (response.status == 200) {
        print("✅ [SUCCESS] Yêu cầu rút tiền thành công!");
        emit(Success());
      } else {
        print("❌ [FAILURE] Lỗi API: ${response.status} - ${response.data}");
        emit(Failure("Lỗi API: ${response.status} - ${response.data}"));
      }
    } catch (e) {
      print("❌ [ERROR] Lỗi khi gửi yêu cầu: $e");
      emit(Failure("Lỗi khi gửi yêu cầu: $e"));
    }
  }

  Future<String?> uploadImage(File imageFile) async {
    emit(UploadingImages()); // ✅ Đánh dấu trạng thái Uploading khi bắt đầu
    try {
      print("📌 [START] Đang tải ảnh lên server...");
      print("📌 File Path: ${imageFile.path}");

      String fileName = imageFile.path.split('/').last;
      print("📌 File Name: $fileName");

      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://credithubapi.tasvietnam.vn/api/upload/uploadfile'),
      );

      var stream = http.ByteStream(imageFile.openRead());
      var length = await imageFile.length();

      var multipartFile = http.MultipartFile(
        'files', // ✅ Tên field trùng với backend
        stream,
        length,
        filename: fileName,
      );

      request.files.add(multipartFile);

      // ✅ Gửi request
      var response = await request.send();

      print("📌 [API RESPONSE] Status Code: ${response.statusCode}");

      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        print("📌 [API RESPONSE] Raw Data: $responseData");

        // ✅ Phân tích JSON phản hồi
        final Map<String, dynamic> jsonResponse = json.decode(responseData);
        final List<dynamic> data = jsonResponse['data'];

        if (data.isNotEmpty) {
          final String url = data[0]['url'];
          print("✅ [SUCCESS] Ảnh đã tải lên thành công. URL: $url");
          return url;
        } else {
          print("❌ [ERROR] API không trả về URL hợp lệ.");
          return null;
        }
      } else {
        print("❌ [ERROR] API trả về lỗi: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("❌ [ERROR] Lỗi khi tải ảnh lên: $e");
      return null;
    }
  }
}
