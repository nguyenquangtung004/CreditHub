import 'package:credit_hub_app/ui/widgets/history/custom_date_picker.dart';
import 'package:credit_hub_app/ui/widgets/history/custom_list_item_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constant/app_string.dart';
import '../../widgets/history/custom_tab_bar.dart';
import 'cubit/request_cubit.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;
  bool _isFetchingMore = false; // Tránh gọi API liên tục khi cuộn xuống

  final List<String> statusList = [
    "Tất cả",
    "Chờ quyết toán",
    "Không quyết toán",
    "Đã quyết toán"
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _scrollController = ScrollController();

    /// ✅ Gọi Cubit để tải danh sách ban đầu
    context.read<RequestCubit>().fetchRequestList(1, 10);

    /// Lắng nghe thay đổi tab để tải dữ liệu theo trạng thái
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        context.read<RequestCubit>().fetchRequestList(1, 10);
      }
    });

    /// ✅ Thêm lắng nghe sự kiện cuộn để tải dữ liệu trang tiếp theo
    _scrollController.addListener(_onScroll);
  }

  /// 📌 Hàm kiểm tra cuộn đến cuối danh sách để tải thêm dữ liệu
  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent * 0.8 &&
        !_isFetchingMore) {
      final state = context.read<RequestCubit>().state;

      if (state is RequestSuccess) {
        // ✅ Kiểm tra xem có còn dữ liệu để tải không
        bool hasMoreData = state.data.data.length < state.data.totalElements; // Sửa lỗi điều kiện
        
        if (hasMoreData) {
          _isFetchingMore = true; // ✅ Đánh dấu đang tải dữ liệu
          context.read<RequestCubit>().fetchRequestList(
            state.data.pageNo + 1,
            state.data.pageSize,
          ).then((_) {
            _isFetchingMore = false; // ✅ Đặt lại để có thể tải tiếp
          });
        }
      }
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          textHistory,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt_sharp),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return CustomCalendarWidget(
                    onDateRangeSelected: (selectedDates) {
                      if (selectedDates.isNotEmpty) {
                        print('Start Date: ${selectedDates.first}');
                        print('End Date: ${selectedDates.last}');
                      } else {
                        print('Selection reset');
                      }
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            // Search bar
            Container(
              height: 52,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),

            // Tab bar
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: CustomTabBar(tabController: _tabController),
            ),

            // Danh sách hiển thị bên dưới tab bar
            Expanded(
              
              child: BlocBuilder<RequestCubit, RequestState>(
                builder: (context, state) {
                  if (state is RequestLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is RequestSuccess) {
                    return ListView.builder(
                      controller: _scrollController,
                      itemCount: state.data.data.length + 1,
                      itemBuilder: (context, index) {
                        if (index == state.data.data.length) {
                          // 🔥 Nếu đã tải hết dữ liệu, không hiển thị spinner
                          if (state.data.data.length >= state.data.totalElements) {
                            return const SizedBox();
                          }

                          return const Center(child: CircularProgressIndicator());
                        }
                        return CustomListItemHistory(
                            historyItem:
                                state.data.data[index]); // ✅ Hiển thị từng item
                      },
                    );
                  } else if (state is RequestFailure) {
                    return Center(child: Text(state.error));
                  } else {
                    return const Center(child: Text("Không có dữ liệu"));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
