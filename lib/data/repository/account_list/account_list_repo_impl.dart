import 'dart:convert';
import 'package:credit_hub_app/data/_base/base_reponse.dart';
import 'package:credit_hub_app/data/model/account/account.dart';
import 'package:credit_hub_app/data/model/bank/bank_model.dart';
import 'package:credit_hub_app/data/model/pagination/pagination_response.dart';
import 'package:credit_hub_app/data/model/pagination_params.dart';
import 'package:credit_hub_app/data/repository/account_list/account_list_repo.dart';
import 'package:credit_hub_app/data/service/account_list/account_service_api.dart';

class AccountListRepoImpl implements AccountListRepo {
  final AccountServiceApi accountServiceApi;

  AccountListRepoImpl({required this.accountServiceApi});

  /// ✅ Lấy danh sách ngân hàng
  @override
  Future<BaseResponse<List<BankModel>>> fetchBank() async {
    try {
      print("📡 [API REQUEST] Gửi yêu cầu lấy danh sách ngân hàng...");
      final response = await accountServiceApi.fetchBank(); 

      // ✅ Kiểm tra response trước khi log
      if (response.data != null) {
        print("📥 [API RESPONSE] fetchBank() -> ${jsonEncode(response.toJson(
          (list) => list?.map((item) => item?.toJson()).toList() ?? [],
        ))}");
      } else {
        print("⚠️ [WARNING] API trả về null cho danh sách ngân hàng.");
      }

      return response;
    } catch (e, stackTrace) {
      print("❌ [ERROR] fetchBank() -> Lỗi khi lấy danh sách ngân hàng: $e");
      print(stackTrace);
      throw Exception("Lỗi khi lấy danh sách ngân hàng: $e");
    }
  }

  /// ✅ Thêm tài khoản ngân hàng
  @override
  Future<BaseResponse<bool>> addAccountBank(Map<String, dynamic> accountData) async {
    try {
      print("📡 [API REQUEST] Gửi yêu cầu thêm tài khoản ngân hàng với dữ liệu: ${jsonEncode(accountData)}");
      final response = await accountServiceApi.addAccountBank(accountData);

      // ✅ Kiểm tra response trước khi log
      if (response.data != null) {
        print("📥 [API RESPONSE] addAccountBank() -> ${jsonEncode(response.toJson(
          (value) => value?.toString() ?? "null",
        ))}");
      } else {
        print("⚠️ [WARNING] API trả về null khi thêm tài khoản.");
      }

      return response;
    } catch (e, stackTrace) {
      print("❌ [ERROR] addAccountBank() -> Lỗi khi thêm tài khoản ngân hàng: $e");
      print(stackTrace);
      throw Exception("Lỗi khi thêm tài khoản ngân hàng: $e");
    }
  }

  /// ✅ Lấy danh sách tài khoản ngân hàng
  @override
  Future<BaseResponse<PaginationResponse<AccountBank>>> fetchAccountBank({
    required PaginationParams params,
  }) async {
    try {
      print("📡 [API REQUEST] Gửi yêu cầu lấy danh sách tài khoản ngân hàng...");
      print("🔎 [REQUEST PARAMS] pageNo=${params.pageNo}, pageSize=${params.pageSize}");

      final httpResponse = await accountServiceApi.fetchAccountBank(params: params);

      // ✅ Kiểm tra response trước khi log
      if (httpResponse.data != null) {
        print("📥 [API RESPONSE] fetchAccountBank() -> ${jsonEncode(httpResponse.toJson(
          (data) => data?.toJson((item) => item?.toJson()) ?? {},
        ))}");
      } else {
        print("⚠️ [WARNING] API trả về null cho danh sách tài khoản.");
      }

      if (httpResponse.data != null) {
        print("✅ [SUCCESS] API trả về danh sách tài khoản ngân hàng thành công!");
        return BaseResponse(
          status: httpResponse.status,
          message: httpResponse.message,
          data: httpResponse.data,
        );
      } else {
        print("⚠️ [WARNING] API trả về lỗi: ${httpResponse.status}");
        throw Exception('API Error: ${httpResponse.status}');
      }
    } catch (e, stackTrace) {
      print("❌ [ERROR] fetchAccountBank() -> Lỗi khi fetch request list: $e");
      print(stackTrace);
      throw Exception('Lỗi khi fetch request list: $e');
    }
  }
}
