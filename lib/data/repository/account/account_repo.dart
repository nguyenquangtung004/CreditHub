import 'package:credit_hub_app/data/_base/base_reponse.dart';
import 'package:credit_hub_app/data/model/account/account.dart';
import 'package:credit_hub_app/data/model/pagination_params.dart';

import '../../model/pagination/pagination_response.dart';

abstract class AccountRepo {
  Future<BaseResponse<PaginationResponse<AccountBank>>> fetchAccountBank({
    required PaginationParams params,
  });
}
