import 'package:credit_hub_app/shared/app_route.dart';
import 'package:credit_hub_app/ui/widgets/list_account_screen/item_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import 'cubit/list_account_cubit_cubit.dart';
import 'cubit/list_account_cubit_state.dart';

class ListAccountScreen extends StatefulWidget {
  const ListAccountScreen({super.key});

  @override
  State<ListAccountScreen> createState() => _ListAccountScreenState();
}

class _ListAccountScreenState extends State<ListAccountScreen> {
  int? selectedIndex;
  late ScrollController _scrollController;
  int _currentPage = 1;
  // final int _pageSize = 10;
  bool _isLoadingMore = false; // ✅ Tránh tải dữ liệu nhiều lần

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    // Gọi API lần đầu
    context.read<ListAccountCubit>().fetchAccountBank(isRefresh: true);

    // Lắng nghe sự kiện cuộn để tải thêm dữ liệu khi vuốt lên
    _scrollController.addListener(_onScroll);
  }

  /// ✅ Xử lý tải thêm dữ liệu khi vuốt lên
  void _onScroll() {
    final cubit = context.read<ListAccountCubit>();

    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 100) {
      if (cubit.state is ListAccountSuc && !_isLoadingMore) {
        final state = cubit.state as ListAccountSuc;

        // ✅ Kiểm tra nếu chưa tải hết trang thì mới gọi API tiếp
        if (_currentPage < state.data.totalPage) {
          setState(() {
            _isLoadingMore = true;
          });

          _currentPage++;
          cubit.fetchAccountBank().then((_) {
            setState(() {
              _isLoadingMore = false; // ✅ Ngừng hiển thị loading khi xong
            });
          });
        }
      }
    }
  }

  /// ✅ Xử lý tải lại danh sách khi vuốt xuống
  Future<void> _onRefresh() async {
    setState(() {
      _currentPage = 1; // ✅ Reset lại số trang về 1
    });

    await context.read<ListAccountCubit>().fetchAccountBank(isRefresh: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        title: const Text(
          'Danh sách tài khoản',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: BlocBuilder<ListAccountCubit, AccountListBankState>(
        builder: (context, state) {
          if (state is ListAccountLoading && _currentPage == 1) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ListAccountSuc) {
            final accountList = state.data.data;

            if (accountList.isEmpty) {
              return const Center(child: Text("Không có tài khoản ngân hàng nào."));
            }

            return RefreshIndicator(
              onRefresh: _onRefresh, // ✅ Kéo xuống để làm mới
              child: Stack(
                children: [
                  ListView.separated(
                    controller: _scrollController,
                    itemCount: accountList.length + (_isLoadingMore ? 1 : 0),
                    separatorBuilder: (context, index) => const SizedBox(height: 5),
                    itemBuilder: (context, index) {
                      if (index == accountList.length) {
                        return _isLoadingMore
                            ? const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CircularProgressIndicator(), // ✅ Hiển thị loading khi tải thêm dữ liệu
                                ),
                              )
                            : const SizedBox.shrink();
                      }

                      final account = accountList[index];
                      return Slidable(
                        key: ValueKey(account.bankId),
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              borderRadius: BorderRadius.circular(10),
                              onPressed: (context) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Chỉnh sửa: ${account.bankOwner}')),
                                );
                              },
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              icon: Icons.edit,
                              label: 'Sửa',
                            ),
                            SlidableAction(
                              borderRadius: BorderRadius.circular(10),
                              onPressed: (context) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Xóa: ${account.bankOwner}')),
                                );
                              },
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Xóa',
                            ),
                          ],
                        ),
                        child: ItemAccount(
                          imageBank: Image.network(account.imageAccountBank ?? "Không xác định được ảnh", fit: BoxFit.cover),
                          textName: account.bankOwner ?? 'Không xác định được tên khách',
                          textBank: account.bankName ?? 'Không xác định được ngân hàng',
                          textNumberBank: account.bankAccount ?? 'Không xác định được số tài khoản',
                          isSelected: selectedIndex == index,
                          onSelect: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                        ),
                      );
                    },
                  ),
                  Positioned(
                    right: 30,
                    bottom: 30,
                    child: FloatingActionButton(
                      backgroundColor: Colors.red,
                      onPressed: () {
                        Get.toNamed(AppRoute.addAccount.name);
                      },
                      child: const Icon(Icons.add),
                    ),
                  )
                ],
              ),
            );
          } else if (state is ListAccountError) {
            return Center(child: Text(state.error));
          }

          return const Center(child: Text("Không có dữ liệu."));
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
