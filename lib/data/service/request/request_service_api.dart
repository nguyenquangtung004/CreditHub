import 'package:credit_hub_app/data/repository/request/request_repo.dart';
import 'package:credit_hub_app/data/service/request/request_service.dart';

import '../../_base/base_remote_source.dart';
import '../../_base/base_reponse.dart';
import '../../model/home/apiresponse/api_response.dart';
import '../../model/pagination/pagination_response.dart';
import '../../model/pagination_params.dart';

class RequestServiceApi extends BaseRemoteSource implements RequestRepo {
  final RequestService service;

  RequestServiceApi({required this.service});
  @override
  Future<BaseResponse<PaginationResponse<RequestItem>>> fetchRequestList({required PaginationParams params}) {
    final response = callApiWithErrorParser(service.fetchDanhSachApi(params)).then(
      (httpResponse) {
        return httpResponse.data; // Trả về dữ liệu từ phản hồi HTTP.
      },
    );
    return response;
  }
}
