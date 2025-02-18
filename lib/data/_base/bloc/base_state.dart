// ANCHOR: Import thư viện cần thiết
import 'package:json_annotation/json_annotation.dart'; // LINK: Hỗ trợ serialize/deserialize JSON

// ANCHOR: Khai báo phần được sinh tự động bởi `json_serializable`
part 'base_state.g.dart'; // LINK: File này sẽ được tạo tự động khi chạy `flutter pub run build_runner build`

// ANCHOR: Định nghĩa enum `BaseStatus` để đại diện cho các trạng thái phổ biến
enum BaseStatus { 
  initial, // NOTE: Trạng thái khởi tạo (chưa làm gì)
  loading, // NOTE: Đang tải dữ liệu
  success, // NOTE: Xử lý thành công
  failure  // NOTE: Có lỗi xảy ra
}

// ANCHOR: Lớp `BaseState<T>` là một lớp generic để đại diện cho trạng thái chung của ứng dụng
@JsonSerializable(genericArgumentFactories: true) // LINK: Annotation hỗ trợ serialization/deserialization với kiểu generic
class BaseState<T> {
  
  @JsonKey(name: 'status') // LINK: Ánh xạ với trường `status` trong JSON
  BaseStatus status; // SECTION: Trạng thái hiện tại của state

  @JsonKey(name: 'message') // LINK: Ánh xạ với trường `message` trong JSON
  String message; // SECTION: Thông điệp liên quan đến trạng thái (ví dụ: lỗi API)

  // SECTION: Constructor để khởi tạo `BaseState`
  BaseState({this.status = BaseStatus.initial, this.message = ''});

  // ANCHOR: Phương thức `copyWith` để tạo bản sao của `BaseState` với giá trị mới
  BaseState copyWith({BaseStatus? status, String? message}) {
    return BaseState(
      status: status ?? this.status, // NOTE: Nếu `status` không được truyền vào, giữ nguyên giá trị cũ
      message: message ?? this.message, // NOTE: Nếu `message` không được truyền vào, giữ nguyên giá trị cũ
    );
  }

  // ANCHOR: Factory constructor để chuyển đổi từ JSON thành `BaseState`
  factory BaseState.fromJson(
    Map<String, dynamic> json, // LINK: Dữ liệu JSON đầu vào
    T Function(Object? json) fromJsonT, // LINK: Hàm chuyển đổi dữ liệu generic `T` từ JSON
  ) => _$BaseStateFromJson(json, fromJsonT); // LINK: Gọi hàm được sinh tự động bởi `json_serializable`

  // SECTION: Phương thức để chuyển đổi `BaseState` thành JSON
  Map<String, dynamic> toJson(Object Function(T? value) toJsonT) =>
      _$BaseStateToJson(this, toJsonT); // LINK: Gọi hàm được sinh tự động bởi `json_serializable`
}
