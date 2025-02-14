import 'package:credit_hub_app/data/_base/base_remote_source.dart';
import 'package:credit_hub_app/data/_base/base_reponse.dart';
import 'package:credit_hub_app/data/model/bank/bank_model.dart';
import 'package:credit_hub_app/data/repository/account_list/account_list_repo.dart';
import 'package:credit_hub_app/data/service/account_list/account_service.dart';
import 'package:retrofit/retrofit.dart';

class AccountServiceApi extends BaseRemoteSource implements AccountListRepo {
  final AccountService service;
  AccountServiceApi({required this.service});
  @override
Future<BaseResponse<List<BankModel>>> fetchBank() async {
  try {
    // Gọi API và nhận HttpResponse<BaseResponse<List<BankModel>>>
    final HttpResponse<BaseResponse<List<BankModel>>> httpResponse =
        await callApiWithErrorParser(service.fetchDanhSachBankApi());

    // Lấy BaseResponse<List<BankModel>> từ HttpResponse
    final BaseResponse<List<BankModel>> response = httpResponse.data;

    if (httpResponse.response.statusCode == 200) {
      return response; // ✅ Trả về đúng kiểu BaseResponse<List<BankModel>>
    } else {
      throw Exception("Lỗi HTTP: ${httpResponse.response.statusCode}");
    }
  } catch (e) {
    throw Exception("Lỗi khi gọi API fetchBank: $e");
  }
}
}
  