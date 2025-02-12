import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:credit_hub_app/data/_base/base_reponse.dart';
import 'package:credit_hub_app/data/model/home/apiresponse/api_response.dart';
import 'package:credit_hub_app/data/model/pagination/pagination_response.dart';
import 'package:credit_hub_app/data/model/pagination_params.dart';
import 'package:credit_hub_app/data/repository/request/request_repo.dart';

part 'request_state.dart';

class RequestCubit extends Cubit<RequestState> {
  final RequestRepo requestRepo;

  RequestCubit(this.requestRepo) : super(RequestInitial());

  /// ✅ **Hàm fetch danh sách RequestItem với phân trang**
  Future<void> fetchRequestList(int pageNo, int pageSize) async {
    emit(RequestLoading());

    try {
      /// Gửi tham số phân trang
      final params = PaginationParams(pageNo: pageNo, pageSize: pageSize);
      final BaseResponse<PaginationResponse<RequestItem>> response =
          await requestRepo.fetchRequestList(params: params);

      /// ✅ Kiểm tra `data` có null không trước khi emit
      if (response.data != null) {
        emit(RequestSuccess(response.data!)); // ✅ Dùng `!` vì đã kiểm tra `null`
      } else {
        emit(RequestFailure("Dữ liệu từ API bị null"));
      }
    } catch (e) {
      emit(RequestFailure(e.toString()));
    }
  }
}
