import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/model/home/requestitem.dart/request_item.dart';
import '../../../../data/repository/home/home_rep.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final DataRepository dataRepository;

  HomeCubit({required this.dataRepository}) : super(HomeInitial());

  Future<void> fetchHomeData() async {
    emit(HomeLoading());
    try {
      final data = await dataRepository.fetchHomeInfo();

      emit(HomeLoaded(
        totalRequest: data.totalRequest,
        totalMoney: data.totalMoney,
        lstRequests: data.lstRequests,
      ));
    } catch (e) {
      emit(HomeError("Lỗi khi tải dữ liệu: $e"));
    }
  }
}
