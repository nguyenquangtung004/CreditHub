part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final int totalRequest;
  final double totalMoney;
  final List<RequestItem> lstRequests;

  HomeLoaded({
    required this.totalRequest,
    required this.totalMoney,
    required this.lstRequests,
  });

  @override
  List<Object?> get props => [totalRequest, totalMoney, lstRequests];
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);

  @override
  List<Object?> get props => [message];
}
