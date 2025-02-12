import 'package:credit_hub_app/data/model/home/request/request_history.dart';

import '../../_base/base_reponse.dart';
import '../../model/home/apiresponse/api_response.dart';
import '../../model/pagination/pagination_response.dart';
import '../../model/pagination_params.dart';

abstract class RequestRepo {
  Future<BaseResponse<PaginationResponse<RequestHistory>>> fetchRequestList({
    required PaginationParams params
  });
}
