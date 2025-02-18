import 'package:bloc/bloc.dart';
import 'package:credit_hub_app/data/model/account/account.dart';
import 'package:credit_hub_app/data/model/pagination/pagination_response.dart';
import 'package:credit_hub_app/data/model/pagination_params.dart';
import 'package:credit_hub_app/data/repository/account/account_repo.dart';

import 'list_account_cubit_state.dart';

class ListAccountCubit extends Cubit<AccountListBankState> {
  final AccountRepo accountRepo;
  bool _isFetchingMore = false; // ✅ Ngăn gọi API liên tục khi cuộn
  int _currentPage = 1; // ✅ Theo dõi trang hiện tại
  final int _pageSize = 10; // ✅ Số lượng item mỗi trang

  ListAccountCubit({required this.accountRepo}) : super(ListAccountInitial());

  /// ✅ Lấy danh sách tài khoản ngân hàng (Hỗ trợ phân trang)
  Future<void> fetchAccountBank({bool isRefresh = false}) async {
    if (_isFetchingMore) return; // ✅ Ngăn gọi API nhiều lần
    _isFetchingMore = true;

    if (isRefresh) {
      _currentPage = 1; // ✅ Reset về trang 1 khi làm mới
      emit(ListAccountLoading());
    }

    try {
      final params = PaginationParams(pageNo: _currentPage, pageSize: _pageSize);
      final response = await accountRepo.fetchAccountBank(params: params);

      if (response.data != null) {
        final newData = response.data!.data;

        // ✅ Ngừng gọi API nếu không còn dữ liệu để tải
        if (newData.isEmpty) {
          _isFetchingMore = false;
          return;
        }

        // ✅ Giữ dữ liệu cũ và thêm dữ liệu mới vào danh sách
        List<AccountBank> updatedList = (state is ListAccountSuc && _currentPage > 1)
            ? [...(state as ListAccountSuc).data.data, ...newData]
            : newData;

        emit(ListAccountSuc(
          PaginationResponse<AccountBank>(
            totalElements: response.data!.totalElements,
            totalPage: response.data!.totalPage,
            pageNo: _currentPage,
            pageSize: _pageSize,
            data: updatedList,
          ),
        ));

        _currentPage++; // ✅ Tăng số trang nếu tải thành công
      } else {
        emit(ListAccountError("API không trả về dữ liệu hợp lệ."));
      }
    } catch (e) {
      emit(ListAccountError("Lỗi khi tải danh sách tài khoản: $e"));
    } finally {
      _isFetchingMore = false; // ✅ Cho phép tiếp tục gọi API khi cuộn
    }
  }
}
