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
  int? selectedIndex; // Lưu trữ mục được chọn
  late ScrollController _scrollController;
  int _currentPage = 1;
  final int _pageSize = 10;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    
    // Gọi API lần đầu khi màn hình được tạo
    context.read<ListAccountCubit>().fetchAccountBank(_currentPage, _pageSize);

    // Lắng nghe sự kiện cuộn để tải thêm dữ liệu khi vuốt lên
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 100) {
      // Gọi API khi vuốt lên gần cuối danh sách
      final cubit = context.read<ListAccountCubit>();
      if (cubit.state is ListAccountSuc) {
        final state = cubit.state as ListAccountSuc;
        if (_currentPage < state.data.totalPage) {
          _currentPage++;
          cubit.fetchAccountBank(_currentPage, _pageSize);
        }
      }
    }
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

            return Stack(
              children: [
                ListView.separated(
                  controller: _scrollController,
                  itemCount: accountList.length + 1, // Thêm 1 để hiển thị loading khi phân trang
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 5), // Khoảng cách 5px giữa các mục
                  itemBuilder: (context, index) {
                    if (index == accountList.length) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(), // Hiển thị khi tải thêm dữ liệu
                        ),
                      );
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

