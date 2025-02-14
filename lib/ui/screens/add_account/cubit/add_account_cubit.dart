import 'package:bloc/bloc.dart';
import 'package:credit_hub_app/data/model/bank/bank_model.dart';
import '../../../../data/_base/base_reponse.dart';
import '../../../../data/repository/account_list/account_list_repo.dart';

part 'add_account_state.dart';

class AddAccountCubit extends Cubit<AddAccountState> {
  final AccountListRepo accountListRepo;

  AddAccountCubit({required this.accountListRepo}) : super(AddAccountInitial());

  Future<void> fetchBank() async {
    emit(AddAccountLoading());
    try {
      final BaseResponse<List<BankModel>> response = await accountListRepo.fetchBank();

      if (response.data != null) {
            print("✅ API trả về danh sách ngân hàng: ${response.data!.length}");
        emit(BankLoaded(banks: response.data!)); // ✅ Đảm bảo dữ liệu không null
      } else {
        emit(BankError(message: 'Không có dữ liệu ngân hàng.'));
      }
    } catch (e) {
      emit(BankError(message: "Lỗi khi tải danh sách ngân hàng: $e"));
    }
  }
}
