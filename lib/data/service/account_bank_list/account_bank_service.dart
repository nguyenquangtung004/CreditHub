import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:credit_hub_app/data/model/pagination_params.dart';

import '../../_base/base_reponse.dart';
import '../../model/account/account.dart';
import '../../model/pagination/pagination_response.dart';

part 'account_bank_service.g.dart';

@RestApi()
abstract class AccountBankService {
  factory AccountBankService (Dio dio,{String? baseUrl}) = _AccountBankService;
  @POST('app/bankaccount/list')
   Future<HttpResponse<BaseResponse<PaginationResponse<AccountBank>>>> fetchAccountBankList(
      @Body() PaginationParams params,
  );
  
}