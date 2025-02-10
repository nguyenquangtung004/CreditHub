import 'package:credit_hub_app/shared/app_route.dart';
import 'package:credit_hub_app/ui/widgets/list_account_screen/item_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class ListAccountScreen extends StatefulWidget {
  const ListAccountScreen({super.key});

  @override
  State<ListAccountScreen> createState() => _ListAccountScreenState();
}

class _ListAccountScreenState extends State<ListAccountScreen> {
  int? selectedIndex; // Lưu trữ mục được chọn
  List<Map<String, dynamic>> getFakeData() {
    return [
      {
        'imageBank': Image.network(
            'https://sandbox.vnpayment.vn/apis/assets/images/bank/abbank_logo.png',
            fit: BoxFit.cover),
        'name': 'Pham Duc Thinh',
        'bank': 'VPbank',
        'number': '2020****85',
        'isSelected': true,
      },
      {
        'imageBank': Image.network(
            'https://sandbox.vnpayment.vn/apis/assets/images/bank/abbank_logo.png',
            fit: BoxFit.cover),
        'name': 'Nguyen Van A',
        'bank': 'Techcombank',
        'number': '1023****12',
        'isSelected': false,
      },
      {
        'imageBank': Image.network(
            'https://sandbox.vnpayment.vn/apis/assets/images/bank/abbank_logo.png',
            fit: BoxFit.cover),
        'name': 'Tran Thi B',
        'bank': 'MBBank',
        'number': '3045****78',
        'isSelected': false,
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final fakeData = getFakeData();
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
      body: Stack(
        children: [
          ListView.separated(
            itemCount: fakeData.length,
            separatorBuilder: (context, index) =>
                const SizedBox(height: 5), // Khoảng cách 5px giữa các mục
            itemBuilder: (context, index) {
              final account = fakeData[index];
              return Slidable(
                key: ValueKey(account['number']),
                endActionPane: ActionPane(
                  motion:
                      const ScrollMotion(), // ⚡ THAY DrawerMotion() bằng ScrollMotion()
                  children: [
                    // Nút chỉnh sửa
                    SlidableAction(
                      borderRadius: BorderRadius.circular(10),
                      onPressed: (context) {
                        // Xử lý sự kiện chỉnh sửa
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Chỉnh sửa: ${account['name']}')),
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
                        // Xử lý sự kiện xóa
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Xóa: ${account['name']}')),
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
                  imageBank: account['imageBank'],
                  textName: account['name'],
                  textBank: account['bank'],
                  textNumberBank: account['number'],
                  isSelected: selectedIndex == index,
                  onSelect: () {
                    setState(() {
                      selectedIndex =
                          index; // Cập nhật trạng thái mục được chọn
                    });
                  },
                ),
              );
            },
          ),
          Positioned(
            right: 30,
            bottom: 30,
            child: Container(
              child: FloatingActionButton(
                backgroundColor: Colors.red,
                onPressed: () {
                  Get.toNamed(AppRoute.addAccount.name);
                },
                child: Icon(Icons.add),
              ),
            ),
          )
        ],
      ),
    );
  }
}
