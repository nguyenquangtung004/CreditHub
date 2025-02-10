// Import thư viện cần thiết
import 'package:json_annotation/json_annotation.dart'; // Thư viện hỗ trợ tạo mã JSON serialization/deserialization.

// Phần này được sinh tự động bởi `json_serializable` khi chạy lệnh `build_runner`.
part 'base_reponse.g.dart';

// Lớp BaseResponse<T> là một lớp generic dùng để đại diện cho phản hồi từ API.
@JsonSerializable(genericArgumentFactories: true) // Annotation để hỗ trợ serialization/deserialization với kiểu generic.
class BaseResponse<T> {
  @JsonKey(name: 'status') // Ánh xạ trường `status` trong JSON với thuộc tính này.
  int? status; // Trạng thái phản hồi từ server (thường là mã lỗi hoặc mã thành công).

  @JsonKey(name: 'message') // Ánh xạ trường `message` trong JSON với thuộc tính này.
  String? message; // Thông điệp từ server (ví dụ: "Thành công" hoặc "Lỗi").

  @JsonKey(name: 'token') // Ánh xạ trường `token` trong JSON với thuộc tính này.
  String? token; // Token xác thực (nếu có).

  @JsonKey(name: 'data') // Ánh xạ trường `data` trong JSON với thuộc tính này.
  T? data; // Dữ liệu trả về từ server, kiểu dữ liệu phụ thuộc vào generic `T`.

  // Constructor để khởi tạo đối tượng BaseResponse.
  BaseResponse({
    this.status,
    this.message,
    this.token,
    this.data,
  });

  // Factory constructor để chuyển đổi JSON thành đối tượng BaseResponse.
  factory BaseResponse.fromJson(
    Map<String, dynamic> json, // Dữ liệu JSON đầu vào.
    T Function(Object? json) fromJsonT, // Hàm chuyển đổi dữ liệu generic `T` từ JSON.
  ) =>
      _$BaseResponseFromJson(json, fromJsonT); // Gọi hàm được sinh tự động bởi `json_serializable`.

  // Phương thức để chuyển đổi đối tượng BaseResponse thành JSON.
  Map<String, dynamic> toJson(Object Function(T? value) toJsonT) =>
      _$BaseResponseToJson(this, toJsonT); // Gọi hàm được sinh tự động bởi `json_serializable`.
}