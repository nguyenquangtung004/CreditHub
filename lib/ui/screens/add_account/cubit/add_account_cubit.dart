import 'package:bloc/bloc.dart';
import 'package:credit_hub_app/data/model/bank/bank_model.dart';
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
      final BaseResponse<List<BankModel>> response = await accountListRepo.fetchBank();

      if (response.data != null && response.data!.isNotEmpty) {
        print("✅ API trả về danh sách ngân hàng: ${response.data!.length}");
        emit(BankLoaded(banks: response.data!)); // ✅ Trả về danh sách ngân hàng
      } else {
        emit(BankError(message: 'Không có dữ liệu ngân hàng.'));
      }
    } catch (e) {
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
      emit(AddAccountError(message: "Vui lòng nhập đầy đủ thông tin tài khoản!"));
      return;
    }

    final requestData = {
      "bank_id": bankId,
      "bank_account": bankAccount,
      "bank_owner": bankOwner,
    };

    print("📡 Gửi API /bankaccount/create với dữ liệu: $requestData");

    try {
      final response = await accountListRepo.addAccountBank(requestData);

      if (response.status == 200) {
        print("✅ Thêm tài khoản thành công!");
        emit(AddAccountSuccess(message: "Tài khoản ngân hàng đã được thêm thành công!"));
      } else {
        print("❌ Lỗi API: ${response.message}");
        emit(AddAccountError(message: response.message ?? "Có lỗi xảy ra từ API!"));
      }
    } catch (e) {
      print("❌ Exception: $e");
      emit(AddAccountError(message: "Không thể thêm tài khoản! Lỗi: $e"));
    }
  }
}
