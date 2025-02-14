import 'package:credit_hub_app/data/_base/base_remote_source.dart';
import 'package:credit_hub_app/data/_base/base_reponse.dart';
import 'package:credit_hub_app/data/model/bank/bank_model.dart';
import 'package:credit_hub_app/data/repository/account_list/account_list_repo.dart';
import 'package:credit_hub_app/data/service/account_list/account_service.dart';

class AccountServiceApi extends BaseRemoteSource implements AccountListRepo {
  final AccountService service;
  AccountServiceApi({required this.service});
  @override
  Future<BaseResponse<BankModel>> fetchBank() async{
   try {
      final response = await callApiWithErrorParser(service.fetchDanhSachBankApi());

      if (response.response.statusCode == 200) {
        return response.data; // ✅ Trả về BaseResponse<BankModel>
      } else {
        throw Exception("Lỗi HTTP: ${response.response.statusCode}");
      }
    } catch (e) {
      throw Exception("Lỗi khi gọi API fetchBank: $e");
    }
  }
  }
  