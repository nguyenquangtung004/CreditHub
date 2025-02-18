import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../add_account_barrel.dart';

part 'add_account_state.dart';

class AddAccountCubit extends Cubit<AddAccountState> {
  /* ------------------------------ Phần khởi tạo ----------------------------- */
  final AccountListRepo accountListRepo;
  String selectedBankText = "Techcombank"; // ✅ Tên ngân hàng mặc định
  int? selectedBankId; // ✅ ID ngân hàng đã chọn

  AddAccountCubit({required this.accountListRepo}) : super(AddAccountInitial());

  /* --------------------- Lấy danh sách ngân hàng từ api --------------------- */
  Future<void> fetchBank() async {
    emit(AddAccountLoading());
    try {
      print("Step 1: Gửi yêu cầu lấy danh sách ngân hàng...");
      final BaseResponse<List<BankModel>> response =
          await accountListRepo.fetchBank();
      print("Step 2: API phản hồi: ${response.toJson}");

      if (response.data != null && response.data!.isNotEmpty) {
        print(
            "Step 3: ✅ API trả về danh sách ngân hàng: ${response.data!.length}");
        emit(BankLoaded(banks: response.data!));
      } else {
        print("Step 3: ⚠️ Không có dữ liệu ngân hàng.");
        emit(BankError(message: 'Không có dữ liệu ngân hàng.'));
      }
    } catch (e) {
      print("❌ Lỗi khi tải danh sách ngân hàng: $e");
      emit(BankError(message: "Lỗi khi tải danh sách ngân hàng: $e"));
    }
  }
  /* ----------------------- Tạo tài khoản ngân hàng mới ---------------------- */
  Future<void> createBankAccount({
    required int bankId,
    required String bankAccount,
    required String bankOwner,
  }) async {
    if (bankId == 0 || bankAccount.isEmpty || bankOwner.isEmpty) {
      emit(AddAccountError(
          message: "Vui lòng nhập đầy đủ thông tin tài khoản!"));
      return;
    }

    final requestData = {
      "bank_id": bankId,
      "bank_account": bankAccount,
      "bank_owner": bankOwner,
    };

    try {
      final response = await accountListRepo.addAccountBank(requestData);

      if (response.status == 200) {
        emit(AddAccountSuccess(
            message: "Tài khoản ngân hàng đã được thêm thành công!"));
      } else {
        emit(AddAccountError(message: response.message ?? "Có lỗi xảy ra!"));
      }
    } catch (e) {
      emit(AddAccountError(message: "Lỗi khi thêm tài khoản!"));
    }
  }
}
