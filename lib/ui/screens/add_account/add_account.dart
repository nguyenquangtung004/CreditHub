import 'dart:ui';
import 'package:credit_hub_app/core/components/text_field/app_text_field.dart';
import 'package:credit_hub_app/core/constant/app_string.dart';
import 'package:credit_hub_app/core/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:credit_hub_app/ui/screens/add_account/cubit/add_account_cubit.dart';

import '../../../data/repository/account_list/account_list_repo.dart';
import '../../widgets/add_account/custom_dropdown_button.dart';
import '../../widgets/add_account/item_drop_down.dart';

class AddAccountScreen extends StatefulWidget {
  const AddAccountScreen({super.key});

  @override
  State<AddAccountScreen> createState() => _AddAccountScreenState();
}

class _AddAccountScreenState extends State<AddAccountScreen> {
  final TextEditingController accountController = TextEditingController();
  final TextEditingController nameAccountController = TextEditingController();

  // Giá trị ngân hàng đang chọn
  String selectedBankText = "Techcombank";

  int? selectedBankId; // ✅ Lưu ID của ngân hàng đã chọn

  void _showBankSelectionSheet(BuildContext context) async {
    print("Step 1: Mở BankSelectionSheet...");
    final addAccountCubit = context.read<AddAccountCubit>();

    if (addAccountCubit.state is! BankLoaded) {
      print("Step 2: Không có dữ liệu ngân hàng, gọi API...");
      await addAccountCubit.fetchBank();
    }

    final state = addAccountCubit.state;
    if (state is! BankLoaded) {
      print("⚠️ Vẫn không có dữ liệu sau khi gọi API!");
      return;
    }

    final banks = state.banks;
    print("✅ Danh sách ngân hàng trước khi mở BottomSheet: ${banks.length}");

    final selectedId = await showModalBottomSheet<int>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return BlocProvider.value(
          value: addAccountCubit,
          child: BankSelectionSheet(
            selectedBank: selectedBankText,
            banks: banks,
          ),
        );
      },
    );

    if (selectedId != null) {
      setState(() {
        selectedBankId = selectedId; // ✅ Lưu ID của ngân hàng đã chọn
        selectedBankText = banks
            .firstWhere((b) => b.idBank == selectedId)
            .nameBank; // ✅ Cập nhật tên ngân hàng
      });

      print("🏦 Ngân hàng đã chọn: $selectedBankText (ID: $selectedBankId)");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final accountListRepo =
            context.read<AccountListRepo>(); // ✅ Đảm bảo Provider tồn tại
        return AddAccountCubit(accountListRepo: accountListRepo);
      },
      child: Scaffold(
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
                  text: const TextSpan(
                    text: titleNumberAccount,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: richTextTitle01,
                        style: TextStyle(
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
                  label: labelAddAccount,
                  controller: accountController,
                ),
                h(22),

                // Tên tài khoản
                RichText(
                  text: const TextSpan(
                    text: titleNameAccount,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: richTextTitle01,
                        style: TextStyle(
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
                  text: const TextSpan(
                    text: titlebank, // "Ngân hàng"
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: richTextTitle01,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                h(9),
                CustomDropdownButton(
                  currentValue: selectedBankText,
                  onTap: () => _showBankSelectionSheet(context),
                ),
                
                
                h(144),
                /* ------------------------------ Nút thêm mới ------------------------------ */
                SizedBox(
                  width: double.infinity,
                  height: 65,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFF4A4A)),
                    onPressed: () {
                      if (selectedBankId == null ||
                          accountController.text.isEmpty ||
                          nameAccountController.text.isEmpty) {
                        Get.snackbar("Lỗi", "Vui lòng nhập đầy đủ thông tin!");
                        return;
                      }

                      context.read<AddAccountCubit>().createBankAccount(
                            bankId: selectedBankId!,
                            bankAccount: accountController.text,
                            bankOwner: nameAccountController.text,
                          );
                    },
                    child: const Text(
                      textAdd,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
