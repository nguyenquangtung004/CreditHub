
import '../../model/home/data/data.dart';
import '../../service/home/home_service.dart';
import 'home_rep.dart';

class DataRepositoryImpl implements DataRepository {
  final HomeService homeService;

  DataRepositoryImpl({required this.homeService});

  @override
  Future<Data> fetchHomeInfo() async {
    try {
      final response = await homeService.getHomeInfo();
      return response.data.data; // Lấy dữ liệu từ API response
    } catch (e) {
      throw Exception("Lỗi khi lấy dữ liệu Home: $e");
    }
  }
}
