import 'package:credit_hub_app/data/_base/base_reponse.dart';
import 'package:credit_hub_app/data/model/bank/bank_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../model/account/account.dart';
import '../../model/pagination/pagination_response.dart';
import '../../model/pagination_params.dart';
part 'account_service.g.dart';

@RestApi()
abstract class AccountService {
  factory AccountService(Dio dio, {String? baseUrl}) = _AccountService;

  @GET('/dropdown/bank')
  Future<HttpResponse<BaseResponse<List<BankModel>>>> fetchDanhSachBankApi();

  @POST('/app/bankaccount/create')
  Future<HttpResponse<BaseResponse<bool>>> addAccountBank(
    @Body() Map<String, dynamic> accountData, // ✅ Chỉ khai báo một lần
  );

  @POST('app/bankaccount/list')
  Future<HttpResponse<BaseResponse<PaginationResponse<AccountBank>>>> fetchDanhSachAccountApi(
    @Body() PaginationParams params,
  );
}
