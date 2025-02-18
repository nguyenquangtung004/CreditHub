import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_string.dart';
import '../../../data/repository/request/request_repo.dart';
import '../../widgets/history/custom_tab_bar.dart';
import '../../widgets/history/custom_date_picker.dart';
import '../../widgets/history/custom_list_item_history.dart';
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
  bool _isFetchingMore = false;

  /// ✅ Lấy `RequestCubit` từ GetX
  RequestCubit get _cubit => Get.find<RequestCubit>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _scrollController = ScrollController();

    try {
      if (!Get.isRegistered<RequestCubit>()) {
        log("📌 Đăng ký RequestCubit...");
        Get.put(RequestCubit(Get.find<RequestRepo>()));
      }
      _cubit.fetchRequestList(1, 10); // ✅ GỌI API NGAY KHI KHỞI TẠO
    } catch (e) {
      log("❌ Lỗi khi đăng ký RequestCubit: $e");
    }

    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        _cubit.fetchRequestList(1, 10);
      }
    });

    _scrollController.addListener(_onScroll);
  }

  /// 📌 Hàm kiểm tra cuộn đến cuối danh sách để tải thêm dữ liệu
  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent * 0.8 &&
        !_isFetchingMore) {
      final state = _cubit.state;

      if (state is RequestSuccess) {
        bool hasMoreData = state.data.data.length < state.data.totalElements;
        
        if (hasMoreData) {
          _isFetchingMore = true;
          _cubit.fetchRequestList(state.data.pageNo + 1, state.data.pageSize).then((_) {
            _isFetchingMore = false;
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
      body: BlocListener<RequestCubit, RequestState>(
        bloc: _cubit,
        listener: (context, state) {
          if (state is RequestFailure) {
            Get.snackbar("Lỗi", state.error, backgroundColor: Colors.red);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              _buildSearchBar(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: CustomTabBar(tabController: _tabController),
              ),
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
                            if (state.data.data.length >= state.data.totalElements) {
                              return const SizedBox();
                            }
                            return const Center(child: CircularProgressIndicator());
                          }
                          return CustomListItemHistory(
                            historyItem: state.data.data[index],
                          );
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
      ),
    );
  }

  /// ✅ Widget ô tìm kiếm
  Widget _buildSearchBar() {
    return Container(
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
    );
  }
}
