import 'package:bloc/bloc.dart';
import 'package:credit_hub_app/data/model/account/account.dart';
import 'package:credit_hub_app/data/model/pagination/pagination_response.dart';
import 'package:credit_hub_app/data/model/pagination_params.dart';
import 'package:credit_hub_app/data/repository/account/account_repo.dart';

import 'list_account_cubit_state.dart';

class ListAccountCubit extends Cubit<AccountListBankState> {
  final AccountRepo accountRepo;
  bool _isFetchingMore = false; // ✅ Ngăn gọi API liên tục khi cuộn

  ListAccountCubit({required this.accountRepo}) : super(ListAccountInitial());

  /// ✅ Lấy danh sách tài khoản ngân hàng (Hỗ trợ phân trang)
  Future<void> fetchAccountBank(int pageNo, int pageSize) async {
    if (_isFetchingMore) return; // ✅ Tránh gọi API nhiều lần
    _isFetchingMore = true;

    // ✅ Hiển thị loading chỉ khi gọi API lần đầu (pageNo = 1)
    if (pageNo == 1) {
      emit(ListAccountLoading());
    }

    try {
      final params = PaginationParams(pageNo: pageNo, pageSize: pageSize);
      final response = await accountRepo.fetchAccountBank(params: params);

      if (response.data != null) {
        final newData = response.data!.data;
        final updatedList = (state is ListAccountSuc && pageNo > 1)
            ? [...(state as ListAccountSuc).data.data, ...newData] // ✅ Ghép dữ liệu mới vào danh sách cũ
            : newData; // ✅ Nếu page 1, lấy danh sách mới

        emit(ListAccountSuc(
          PaginationResponse<AccountBank>(
            totalElements: response.data!.totalElements,
            totalPage: response.data!.totalPage,
            pageNo: pageNo,
            pageSize: pageSize,
            data: updatedList,
          ),
        ));
      }
    } catch (e) {
    } finally {
      _isFetchingMore = false; // ✅ Cho phép tiếp tục gọi API khi cuộn
    }
  }
}
