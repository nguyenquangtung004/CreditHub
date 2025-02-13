part of 'request_cubit.dart';

abstract class RequestState extends Equatable {
  const RequestState();

  @override
  List<Object> get props => [];
}

/// ✅ **Trạng thái ban đầu**
class RequestInitial extends RequestState {}

/// ✅ **Trạng thái đang tải dữ liệu**
class RequestLoading extends RequestState {}

/// ✅ **Trạng thái tải dữ liệu thành công**
class RequestSuccess extends RequestState {
  final PaginationResponse<RequestHistory> data;
  final List<int> requestIds; // 🔥 Thêm danh sách ID vào state
  const RequestSuccess(this.data, this.requestIds);

  @override
  List<Object> get props => [data, requestIds];
}

/// ✅ Trạng thái tải chi tiết yêu cầu thành công
class RequestDetailSuccess extends RequestState {
  final RequestHistory requestDetail; 

  const RequestDetailSuccess(this.requestDetail);

  @override
  List<Object> get props => [requestDetail];
}

/// ✅ **Trạng thái lỗi**
class RequestFailure extends RequestState {
  final String error;

  const RequestFailure(this.error);

  @override
  List<Object> get props => [error];
}
