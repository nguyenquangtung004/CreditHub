import '../../_base/base_reponse.dart';
import '../../model/home/apiresponse/api_response.dart';
import '../../model/pagination/pagination_response.dart';
import '../../model/pagination_params.dart';

abstract class RequestRepo {
  Future<BaseResponse<PaginationResponse<RequestItem>>> fetchRequestList({
    required PaginationParams params
  });
}
