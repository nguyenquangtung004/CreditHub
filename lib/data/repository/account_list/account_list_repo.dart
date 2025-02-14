import 'package:credit_hub_app/data/_base/base_reponse.dart';
import 'package:credit_hub_app/data/model/bank/bank_model.dart';

abstract class AccountListRepo {
    Future< BaseResponse<List<BankModel>>> fetchBank ();
   Future<BaseResponse<bool>> addAccountBank(Map<String, dynamic> accountData);
}