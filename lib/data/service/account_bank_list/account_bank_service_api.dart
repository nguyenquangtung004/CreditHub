import 'package:credit_hub_app/data/_base/base_remote_source.dart';
import 'package:credit_hub_app/data/repository/account/account_repo.dart';

import '../../_base/base_reponse.dart';
import '../../model/account/account.dart';
import '../../model/pagination/pagination_response.dart';
import '../../model/pagination_params.dart';
import 'account_bank_service.dart';

class AcccountBankServiceApi extends BaseRemoteSource implements AccountRepo {
  final AccountBankService service;

  AcccountBankServiceApi({required this.service});
  @override
  Future<BaseResponse<PaginationResponse<AccountBank>>> fetchAccountBank({required PaginationParams params}) {
    return callApiWithErrorParser(service.fetchAccountBankList(params)).then(
      (httpResponse) => httpResponse.data,
    );
  }
  
}