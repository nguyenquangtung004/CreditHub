
import '../../model/home/apiresponse/api_response.dart';


abstract class DataRepository {
  Future<ApiResponse> fetchHomeInfo();
}
