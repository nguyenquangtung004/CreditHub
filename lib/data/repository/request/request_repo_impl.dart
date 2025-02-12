import 'package:credit_hub_app/data/_base/base_reponse.dart';
import 'package:credit_hub_app/data/model/home/request/request_history.dart';
import 'package:credit_hub_app/data/model/pagination/pagination_response.dart';
import 'package:credit_hub_app/data/model/pagination_params.dart';
import 'package:credit_hub_app/data/repository/request/request_repo.dart';
import 'package:credit_hub_app/data/service/request/request_service.dart';

class RequestRepoImpl implements RequestRepo {
  final RequestService requestService;

  RequestRepoImpl({required this.requestService});

  @override
  Future<BaseResponse<PaginationResponse<RequestHistory>>> fetchRequestList({required PaginationParams params}) async {
    try {
      final httpResponse = await requestService.fetchDanhSachApi(params);

      if (httpResponse.response.statusCode == 200) {
        return httpResponse.data; // ✅ Không cần ép kiểu nếu API đã parse sẵn
      } else {
        throw Exception('API Error: ${httpResponse.response.statusCode}');
      }
    } catch (e) {
      throw Exception('Lỗi khi fetch request list: $e');
    }
  }
}

