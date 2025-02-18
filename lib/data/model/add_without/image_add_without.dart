import 'dart:io';
import 'package:dio/dio.dart';

class UploadFileRequest {
  final File file;

  UploadFileRequest({required this.file});

  /// ✅ Chuyển đổi sang `FormData` để gửi qua API
  Future<FormData> toFormData() async {
    return FormData.fromMap({
      "files": await MultipartFile.fromFile(file.path, filename: file.path.split('/').last),
    });
  }
}
