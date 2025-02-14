import 'package:credit_hub_app/data/_base/base_reponse.dart';
import 'package:credit_hub_app/data/model/bank/bank_model.dart';
import 'package:credit_hub_app/data/repository/account_list/account_list_repo.dart';
import 'package:credit_hub_app/data/service/account_list/account_service_api.dart';

class AccountListRepoImpl implements AccountListRepo {
  final AccountServiceApi accountServiceApi;

  AccountListRepoImpl({required this.accountServiceApi});

  @override
  Future< BaseResponse<List<BankModel>>> fetchBank() async {
    try {
      return await accountServiceApi.fetchBank(); // ✅ Gọi API từ AccountServiceApi
    } catch (e) {
      throw Exception("Lỗi khi lấy danh sách ngân hàng: $e");
    }
  }
}
