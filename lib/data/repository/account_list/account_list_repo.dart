import 'package:credit_hub_app/data/_base/base_reponse.dart';
import 'package:credit_hub_app/data/model/account/account.dart';
import 'package:credit_hub_app/data/model/bank/bank_model.dart';
import 'package:credit_hub_app/data/model/pagination/pagination_response.dart';

import '../../model/pagination_params.dart';

abstract class AccountListRepo {
  Future< BaseResponse<List<BankModel>>> fetchBank ();
  Future<BaseResponse<bool>> addAccountBank(Map<String, dynamic> accountData);
  Future<BaseResponse<PaginationResponse<AccountBank>>> fetchAccountBank(
     {required PaginationParams params,}
  );
}