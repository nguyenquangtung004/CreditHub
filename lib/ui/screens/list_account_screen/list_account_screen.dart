import 'package:credit_hub_app/shared/app_route.dart';
import 'package:credit_hub_app/ui/widgets/list_account_screen/item_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../add_account/cubit/add_account_cubit.dart'; // Import Cubit

class ListAccountScreen extends StatefulWidget {
  const ListAccountScreen({super.key});

  @override
  State<ListAccountScreen> createState() => _ListAccountScreenState();
}

class _ListAccountScreenState extends State<ListAccountScreen> {
  int? selectedIndex; // Lưu trữ mục được chọn

  @override
  void initState() {
    super.initState();
    // Gọi Cubit để lấy danh sách tài khoản khi màn hình được tạo
    context.read<AddAccountCubit>().fetchAccountBank(1, 10);
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
      body: BlocBuilder<AddAccountCubit, AddAccountState>(
        builder: (context, state) {
          if (state is AddAccountLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedDataBankAccount) {
            final accountList = state.accountBank;

            if (accountList.isEmpty) {
              return const Center(child: Text("Không có tài khoản ngân hàng nào."));
            }

            return Stack(
              children: [
                ListView.separated(
                  itemCount: accountList.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 5), // Khoảng cách 5px giữa các mục
                  itemBuilder: (context, index) {
                    final account = accountList[index];
                    return Slidable(
                      key: ValueKey(account.bankId),
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(), // ⚡ THAY DrawerMotion() bằng ScrollMotion()
                        children: [
                          // Nút chỉnh sửa
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
                          // Nút xóa
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
                        imageBank: Image.network(account.imageAccountBank?? "Không xác đinh đc ảnh", fit: BoxFit.cover),
                        textName: account.bankOwner ?? 'Không xác định được tên khách',
                        textBank: account.bankName ??'Không xác định được ngân hàng',
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
          } else if (state is AddAccountError) {
            return Center(child: Text(state.message));
          }

          return const Center(child: Text("Không có dữ liệu."));
        },
      ),
    );
  }
}
