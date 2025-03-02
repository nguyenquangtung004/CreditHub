import 'package:bloc/bloc.dart';
import 'package:credit_hub_app/data/model/home/request/request_history.dart';
import 'package:equatable/equatable.dart';
import 'package:credit_hub_app/data/_base/base_reponse.dart';
import 'package:credit_hub_app/data/model/pagination/pagination_response.dart';
import 'package:credit_hub_app/data/model/pagination_params.dart';
import 'package:credit_hub_app/data/repository/request/request_repo.dart';

part 'request_state.dart';

class RequestCubit extends Cubit<RequestState> {
  final RequestRepo requestRepo;
  bool _isFetchingMore = false;

  RequestCubit(this.requestRepo) : super(RequestInitial());

  /// ✅ **Hàm fetch danh sách RequestItem với phân trang**
  Future<void> fetchRequestList(int pageNo, int pageSize,
      {bool isNewApi = false}) async {
    if (_isFetchingMore) return; // ✅ Tránh gọi API nhiều lần cùng lúc
    _isFetchingMore = true;

    // ✅ Nếu là API mới hoặc lần đầu gọi, hiển thị loading
    if (isNewApi || pageNo == 1) {
      emit(RequestLoading());
    }

    try {
      print("📌 Gọi API với pageNo: $pageNo, pageSize: $pageSize");
      await Future.delayed(Duration(seconds: 1));
      final params = PaginationParams(pageNo: pageNo, pageSize: pageSize);
      final BaseResponse<PaginationResponse<RequestHistory>> response =
          await requestRepo.fetchRequestList(params: params);

      if (response.data != null) {
        final newData = response.data!.data;

        // 🔥 Lấy danh sách ID từ `newData`
        List<int> requestIds = newData.map((item) => item.id).toList();

        List<RequestHistory> updatedList = newData;

        if (isNewApi || state is! RequestSuccess || pageNo == 1) {
          updatedList = newData;
        } else {
          updatedList = [
            ...(state as RequestSuccess).data.data,
            ...newData
          ]; // ✅ Hợp nhất danh sách
        }

        emit(RequestSuccess(
          PaginationResponse<RequestHistory>(
            totalElements: response.data!.totalElements,
            totalPage: response.data!.totalPage,
            pageNo: pageNo,
            pageSize: pageSize,
            data: updatedList,
          ),
          requestIds, // ✅ Truyền requestIds vào state
        ));
      } else {
        emit(RequestFailure("Dữ liệu từ API bị null"));
      }
    } catch (e) {
      emit(RequestFailure("Lỗi khi tải dữ liệu: $e"));
    } finally {
      _isFetchingMore = false; // ✅ Đặt lại để tiếp tục gọi API khi cuộn
    }
  }

  /// ✅ **Hàm fetch chi tiết RequestItem bằng requestId**
  Future<void> fetchRequestDetail(int requestId) async {
    try {
      emit(RequestLoading());

      final response = await requestRepo.fetchRequestDetail(requestId);

      if (response.data != null) {
        emit(RequestDetailSuccess(response.data!));
      } else {
        emit(RequestFailure("Không tìm thấy chi tiết yêu cầu"));
      }
    } catch (e) {
      emit(RequestFailure("Lỗi: ${e.toString()}"));
    }
  }
}
