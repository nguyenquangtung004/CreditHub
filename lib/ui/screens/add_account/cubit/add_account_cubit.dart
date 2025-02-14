import 'package:bloc/bloc.dart';
import 'package:credit_hub_app/data/model/account/account.dart';
import 'package:credit_hub_app/data/model/bank/bank_model.dart';
import 'package:credit_hub_app/data/model/pagination/pagination_response.dart';
import 'package:credit_hub_app/data/model/pagination_params.dart';
import '../../../../data/_base/base_reponse.dart';
import '../../../../data/repository/account_list/account_list_repo.dart';

part 'add_account_state.dart';

class AddAccountCubit extends Cubit<AddAccountState> {
  final AccountListRepo accountListRepo;

  AddAccountCubit({required this.accountListRepo}) : super(AddAccountInitial());

  /// ✅ Lấy danh sách ngân hàng
  Future<void> fetchBank() async {
    emit(AddAccountLoading());
    try {
      print("📡 Gửi yêu cầu lấy danh sách ngân hàng...");
      final BaseResponse<List<BankModel>> response = await accountListRepo.fetchBank();
      print("📥 API phản hồi: ${response.toJson}");

      if (response.data != null && response.data!.isNotEmpty) {
        print("✅ API trả về danh sách ngân hàng: ${response.data!.length}");
        emit(BankLoaded(banks: response.data!)); // ✅ Trả về danh sách ngân hàng
      } else {
        print("⚠️ Không có dữ liệu ngân hàng.");
        emit(BankError(message: 'Không có dữ liệu ngân hàng.'));
      }
    } catch (e) {
      print("❌ Lỗi khi tải danh sách ngân hàng: $e");
      emit(BankError(message: "Lỗi khi tải danh sách ngân hàng: $e"));
    }
  }

  /// ✅ Thêm tài khoản ngân hàng
  Future<void> createBankAccount({
    required int bankId,
    required String bankAccount,
    required String bankOwner,
  }) async {
    if (bankId == 0 || bankAccount.isEmpty || bankOwner.isEmpty) {
      print("⚠️ Thông tin nhập chưa đầy đủ.");
      emit(AddAccountError(message: "Vui lòng nhập đầy đủ thông tin tài khoản!"));
      return;
    }

    final requestData = {
      "bank_id": bankId,
      "bank_account": bankAccount,
      "bank_owner": bankOwner,
    };

    print("📡 Gửi yêu cầu tạo tài khoản ngân hàng: $requestData");

    try {
      final response = await accountListRepo.addAccountBank(requestData);
      print("📥 API phản hồi: ${response.toJson}");

      if (response.status == 200) {
        print("✅ Thêm tài khoản thành công!");
        emit(AddAccountSuccess(message: "Tài khoản ngân hàng đã được thêm thành công!"));
      } else {
        print("❌ Lỗi API khi tạo tài khoản: ${response.message}");
        emit(AddAccountError(message: response.message ?? "Có lỗi xảy ra từ API!"));
      }
    } catch (e) {
      print("❌ Exception khi thêm tài khoản: $e");
      emit(AddAccountError(message: "Không thể thêm tài khoản! Lỗi: $e"));
    }
  }

  /// ✅ Lấy danh sách tài khoản ngân hàng
  Future<void> fetchAccountBank(int pageNo, int pageSize) async {
    emit(AddAccountLoading());
    try {
      print("📡 Gửi yêu cầu lấy danh sách tài khoản ngân hàng...");
      await Future.delayed(Duration(seconds: 2)); // Mô phỏng delay API

      final params = PaginationParams(pageNo: pageNo, pageSize: pageSize);
      print("🔎 Tham số request: pageNo=$pageNo, pageSize=$pageSize");

      final BaseResponse<PaginationResponse<AccountBank>> response =
          await accountListRepo.fetchAccountBank(params: params);

      print("📥 API phản hồi: ${response.toJson}");

      if (response.status == 200 && response.data != null) {
        final List<AccountBank> newData = response.data!.data;
        print("✅ API trả về ${newData.length} tài khoản.");

        List<AccountBank> updatedList;

        if (state is! LoadedDataBankAccount || pageNo == 1) {
          updatedList = newData; // Nếu là page đầu tiên hoặc chưa có dữ liệu thì gán mới
        } else {
          updatedList = [
            ...(state as LoadedDataBankAccount).accountBank,
            ...newData
          ]; // Nếu có sẵn dữ liệu, append thêm dữ liệu mới
        }

        print("📌 Tổng số tài khoản sau khi cập nhật: ${updatedList.length}");
        emit(LoadedDataBankAccount(accountBank: updatedList)); // ✅ Emit state đúng
      } else {
        print("⚠️ API không trả về dữ liệu hợp lệ.");
        emit(AddAccountError(message: 'API không trả về dữ liệu hợp lệ.'));
      }
    } catch (e) {
      print("❌ Exception khi fetch tài khoản ngân hàng: $e");
      emit(AddAccountError(message: "Lỗi khi lấy danh sách tài khoản: $e"));
    }
  }
}
