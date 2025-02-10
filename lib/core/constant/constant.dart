import 'package:flutter/material.dart';

/* -------------------------------- SizedBox -------------------------------- */
// SizedBox với chiều cao
SizedBox h(double height) {
  return SizedBox(height: height);
}


// SizedBox với chiều rộng
SizedBox w(double width) {
  return SizedBox(width: width);
}


// SizedBox với cả chiều cao và chiều rộng
SizedBox sizedBox({double height = 0, double width = 0}) {
  return SizedBox(
    height: height,
    width: width,
  );
}

/* --------------------------------- Images --------------------------------- */
const String imagesLogo = 'assets/images/image_welcome.png';
const String imagesInfrastructure = 'assets/images/images_infrastructure.png';
const String images02 = 'assets/images/images02.png';
const String itemProfile01 = 'assets/images/item_profile_01.png';
const String itemProfile02 = 'assets/images/item_profile_02.png';
const String background_profile = 'assets/images/background_profile.png';
const String itemProfile03 = 'assets/images/item_profile_03.png';



// ANCHOR: Định nghĩa các enum để quản lý trạng thái và cấu hình ứng dụng

// SECTION: Trạng thái hiển thị của một thành phần UI
enum AppVisibility {
  gone, // NOTE: Trạng thái "ẩn hoàn toàn" (không chiếm không gian trên giao diện)
  visible, // NOTE: Trạng thái "hiển thị"
  invisible // NOTE: Trạng thái "ẩn nhưng vẫn chiếm không gian trên giao diện"
}

// SECTION: Hướng của giao diện hoặc thành phần UI
enum AppOrientation {
  horizontal, // NOTE: Hướng ngang
  vertical // NOTE: Hướng dọc
}

// SECTION: Trạng thái văn bản
enum AppTextState {
  normal, // NOTE: Văn bản bình thường
  bold // NOTE: Văn bản đậm
}

// SECTION: Kích thước văn bản
enum AppTextSize {
  small, // NOTE: Kích thước nhỏ
  middle, // NOTE: Kích thước trung bình
  large // NOTE: Kích thước lớn
}

// SECTION: Ngôn ngữ ứng dụng
enum AppLanguage {
  vi, // NOTE: Ngôn ngữ tiếng Việt
  en // NOTE: Ngôn ngữ tiếng Anh
}

// SECTION: Trạng thái của đơn hàng
enum OrderState {
  waiting, // NOTE: Đơn hàng đang chờ xử lý
  confirmed, // NOTE: Đơn hàng đã được xác nhận
  delivering, // NOTE: Đơn hàng đang được giao
  delivered, // NOTE: Đơn hàng đã được giao thành công
  cancelled, // NOTE: Đơn hàng đã bị hủy
  returned // NOTE: Đơn hàng đã được trả lại
}

// SECTION: Loại thông báo trong ứng dụng
enum NotificationType {
  order, // NOTE: Thông báo liên quan đến đơn hàng
  news, // NOTE: Thông báo tin tức
  rank // NOTE: Thông báo xếp hạng người dùng
}

// ANCHOR: Extension để chuyển đổi giá trị của enum `AppLanguage` thành chuỗi ngắn gọn
extension AppLanguageExt on AppLanguage {
  String toShortString() {
    return toString().split('.').last; // NOTE: Chuyển đổi tên enum thành chuỗi và lấy phần sau dấu chấm
  }
}

// ANCHOR: Lớp `ResponseStatus` chứa các mã trạng thái phản hồi từ server
class ResponseStatus {
  static int success = 0; // DONE: Mã trạng thái thành công
}

// ANCHOR: Lớp `GlobalManager` quản lý các đối tượng toàn cục trong ứng dụng
class GlobalManager {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>(); 
  // LINK: `navigatorKey` được sử dụng để điều hướng giữa các màn hình trong ứng dụng
}

// SECTION: Hằng số `defaultLimit` quy định giới hạn mặc định cho các danh sách hoặc dữ liệu phân trang
const int defaultLimit = 10; // NOTE: Giới hạn số lượng phần tử mặc định là 10
