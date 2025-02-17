import 'package:credit_hub_app/data/_base/base_reponse.dart';
import 'package:credit_hub_app/data/model/account/account.dart';
import 'package:credit_hub_app/data/model/pagination/pagination_response.dart';
import 'package:credit_hub_app/data/model/pagination_params.dart';
import 'package:credit_hub_app/data/repository/account/account_repo.dart';
import 'package:credit_hub_app/data/service/account_bank_list/account_bank_service.dart';

class AccountBankImpl implements AccountRepo {
  final AccountBankService accountService;
  AccountBankImpl({required this.accountService});

  @override
  Future<BaseResponse<PaginationResponse<AccountBank>>> fetchAccountBank({
    required PaginationParams params,
  }) async {
    try {
      final httpResponse = await accountService.fetchAccountBankList(params);
      if (httpResponse.response.statusCode == 200) {
        return httpResponse.data;
      } else {
        throw Exception('API Error: ${httpResponse.response.statusCode}');
      }
    } catch (e) {
      throw Exception('Lỗi khi fetch request list: $e');
    }
  }
}
