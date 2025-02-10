// Import các thư viện cần thiết
import 'dart:io'; // Thư viện cung cấp thông tin về nền tảng (Android/iOS).
import 'package:device_info_plus/device_info_plus.dart'; // Package để lấy thông tin thiết bị.
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Package để đọc biến môi trường từ file `.env`.

// Lớp AppConfig quản lý các cấu hình ứng dụng như môi trường, địa chỉ máy chủ, proxy và thông tin thiết bị.
class AppConfig {
  // Đọc các biến môi trường từ file `.env` và lưu vào các biến tĩnh.
  static final String? _evn = dotenv.env['EVN']; // Môi trường hiện tại (UAT/PROD).
  static final String? _hostUAT = dotenv.env['HOST_UAT']; // Địa chỉ máy chủ cho môi trường UAT.
  static final String? _hostProd = dotenv.env['HOST_PROD']; // Địa chỉ máy chủ cho môi trường PROD.
  static final String? _proxy = dotenv.env['PROXY']; // Proxy để xử lý các yêu cầu mạng.

  // Getter trả về giá trị proxy, nếu null thì trả về chuỗi rỗng.
  static String get proxy => _proxy ?? '';

  // Getter trả về địa chỉ máy chủ UAT, nếu null thì trả về chuỗi rỗng.
  static String get hostUAT => _hostUAT ?? '';

  // Getter trả về địa chỉ máy chủ PROD, nếu null thì trả về chuỗi rỗng.
  static String get hostProd => _hostProd ?? '';

  // Getter trả về môi trường hiện tại, nếu null thì mặc định là 'PROD'.
  static String get evn => _evn ?? 'PROD';

  // Kiểm tra xem môi trường hiện tại có phải là UAT hay không.
  static bool get isUAT => _evn == 'UAT';

  // Trả về địa chỉ máy chủ dựa trên môi trường hiện tại.
  // Nếu là UAT, trả về `hostUAT`; nếu không, trả về `hostProd`.
  static String get url => isUAT ? hostUAT : hostProd;

  // Hàm bất đồng bộ để lấy ID thiết bị.
  static Future<String> getDeviceId() async {
    var deviceInfo = DeviceInfoPlugin(); // Khởi tạo plugin để lấy thông tin thiết bị.

    // Kiểm tra nền tảng đang chạy ứng dụng.
    if (Platform.isAndroid) {
      // Nếu là Android, lấy thông tin thiết bị Android.
      AndroidDeviceInfo androidDevice = await deviceInfo.androidInfo;
      return androidDevice.id; // Trả về ID của thiết bị Android.
    } else if (Platform.isIOS) {
      // Nếu là iOS, lấy thông tin thiết bị iOS.
      IosDeviceInfo iosDevice = await deviceInfo.iosInfo;
      return iosDevice.identifierForVendor ?? ''; // Trả về ID của thiết bị iOS hoặc chuỗi rỗng nếu không có.
    }

    // Nếu không xác định được nền tảng, trả về chuỗi rỗng.
    return '';
  }
}