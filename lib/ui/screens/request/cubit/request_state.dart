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

  const RequestSuccess(this.data);

  @override
  List<Object> get props => [data];
}

/// ✅ **Trạng thái lỗi**
class RequestFailure extends RequestState {
  final String error;

  const RequestFailure(this.error);

  @override
  List<Object> get props => [error];
}
