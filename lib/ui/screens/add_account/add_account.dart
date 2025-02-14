import 'dart:ui';
import 'package:credit_hub_app/core/button/app_button.dart';
import 'package:credit_hub_app/core/components/text_field/app_text_field.dart';
import 'package:credit_hub_app/core/constant/app_string.dart';
import 'package:credit_hub_app/core/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/add_account/custom_dropdown_button.dart';

class AddAccountScreen extends StatefulWidget {
  const AddAccountScreen({super.key});

  @override
  State<AddAccountScreen> createState() => _AddAccountScreenState();
}

class _AddAccountScreenState extends State<AddAccountScreen> {
  final TextEditingController accountController = TextEditingController();
  final TextEditingController nameAccountController = TextEditingController();

  // Danh sách ngân hàng mẫu
  final List<Map<String, String>> bankData = [
    {
      "name": "VPbank",
      "subName": "VPbank",
      "logo": "https://upload.wikimedia.org/...",
    },
    {
      "name": "VIETCOMBANK",
      "subName": "NH Ngoại Thương",
      "logo": "https://upload.wikimedia.org/...",
    },
    {
      "name": "VIETINBANK",
      "subName": "NH Công Thương VN",
      "logo": "https://upload.wikimedia.org/...",
    },
    {
      "name": "BIDV",
      "subName": "NH Đầu Tư & Phát Triển",
      "logo": "https://upload.wikimedia.org/...",
    },
    {
      "name": "TECHCOMBANK",
      "subName": "Techcombank",
      "logo": "https://upload.wikimedia.org/...",
    },
    {
      "name": "MBBANK",
      "subName": "MBbank",
      "logo": "https://upload.wikimedia.org/...",
    },
  ];

  // Giá trị ngân hàng đang chọn
  String selectedBankText = "Techcombank";

  // Mở Bottom Sheet
  void _showBankSelectionSheet(BuildContext context) async {
    final selected = await showModalBottomSheet<String>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return BankSelectionSheet(
          banks: bankData,
          selectedBank: selectedBankText,
        );
      },
    );

    // Nếu người dùng chọn ngân hàng => cập nhật state
    if (selected != null && selected.isNotEmpty) {
      setState(() {
        selectedBankText = selected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: const Text(
          titleTextAdd, // "Thêm số tài khoản nhận tiền"
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Số tài khoản
              RichText(
                text: TextSpan(
                  text: titleNumberAccount, // "Số tài khoản"
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: richTextTitle01, // " *"
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              h(9),
              CustomTextField(
                label: labelAddAccount, // "Nhập số tài khoản"
                controller: accountController,
              ),
              h(22),

              // Tên tài khoản
              RichText(
                text: TextSpan(
                  text: titleNameAccount, // "Tên tài khoản"
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: richTextTitle01, // " *"
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              h(9),
              CustomTextField(
                label: labelNameAccount,
                controller: nameAccountController,
              ),
              h(22),

              // Ngân hàng
              RichText(
                text: TextSpan(
                  text: titlebank, // "Ngân hàng"
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: richTextTitle01, // " *"
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              h(9),

              // CustomDropdownButton "giả" -> bấm 1 lần là mở bottom sheet
              CustomDropdownButton(
                currentValue: selectedBankText,
                onTap: () => _showBankSelectionSheet(context),
              ),

              h(22),
              // Nút "Thêm Mới"
              SizedBox(
                width: double.infinity,
                child: AppButton(
                  label: "Thêm Mới",
                  onPressed: () {
                    // TODO: xử lý thêm mới
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Bottom sheet hiển thị danh sách ngân hàng + tìm kiếm
class BankSelectionSheet extends StatefulWidget {
  final List<Map<String, String>> banks;
  final String selectedBank;

  const BankSelectionSheet({
    Key? key,
    required this.banks,
    required this.selectedBank,
  }) : super(key: key);

  @override
  State<BankSelectionSheet> createState() => _BankSelectionSheetState();
}

class _BankSelectionSheetState extends State<BankSelectionSheet> {
  final TextEditingController _searchCtrl = TextEditingController();
  late List<Map<String, String>> filteredBanks;

  @override
  void initState() {
    super.initState();
    filteredBanks = widget.banks;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Thanh kéo
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),

          // Ô tìm kiếm
          TextField(
            controller: _searchCtrl,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: "Tìm kiếm ngân hàng",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onChanged: (value) {
              setState(() {
                final search = value.toLowerCase();
                filteredBanks = widget.banks.where((bank) {
                  final name = (bank["name"] ?? "").toLowerCase();
                  final subName = (bank["subName"] ?? "").toLowerCase();
                  return name.contains(search) || subName.contains(search);
                }).toList();
              });
            },
          ),
          const SizedBox(height: 10),

          // Danh sách ngân hàng
          Expanded(
            child: filteredBanks.isEmpty
                ? const Center(child: Text("Không tìm thấy ngân hàng!"))
                : ListView.builder(
                    itemCount: filteredBanks.length,
                    itemBuilder: (context, index) {
                      final bank = filteredBanks[index];
                      final bankName = bank["name"] ?? "";
                      final bankSub = bank["subName"] ?? "";
                      final bankLogo = bank["logo"] ?? "";
                      final isSelected = (bankName == widget.selectedBank);

                      return ListTile(
                        leading: bankLogo.isNotEmpty
                            ? Image.network(
                                bankLogo,
                                width: 40,
                                height: 40,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.error),
                              )
                            : const Icon(Icons.account_balance),
                        title: Text(bankName),
                        subtitle: Text(bankSub),
                        trailing: isSelected
                            ? const Icon(Icons.check_circle, color: Colors.blue)
                            : null,
                        onTap: () {
                          Navigator.pop(context, bankName);
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
