
import 'package:credit_hub_app/data/model/home/apiresponse/api_response.dart';

import '../../service/home/home_service.dart';
import 'home_rep.dart';

class DataRepositoryImpl implements DataRepository {
  final HomeService homeService;

  DataRepositoryImpl({required this.homeService});

  @override
  Future<ApiResponse> fetchHomeInfo() async {
    try {
      final response = await homeService.getHomeInfo();
      return response.data; // Lấy dữ liệu từ API response
    } catch (e) {
      throw Exception("Lỗi khi lấy dữ liệu Home: $e");
    }
  }
}
