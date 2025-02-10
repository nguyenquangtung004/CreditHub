import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../data/model/home/apiresponse/api_response.dart';
import '../../../../data/repository/home/home_rep.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final DataRepository dataRepository;

  HomeCubit({required this.dataRepository}) : super(HomeInitial());

  Future<void> fetchHomeData() async {
    emit(HomeLoading());
    try {
      final apiResponse = await dataRepository.fetchHomeInfo(); // ✅ `apiResponse` là `ApiResponse`
      final data = apiResponse.data; // ✅ Lấy `data` từ `ApiResponse`

      emit(HomeLoaded(
        totalRequest: data.totalRequest, // ✅ `totalRequest` có trong `Data`
        totalMoney: data.totalMoney,
        lstRequests: data.lstRequests,
      ));
    } catch (e) {
      emit(HomeError("Lỗi khi tải dữ liệu: $e"));
    }
  }
}
