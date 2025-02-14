import 'package:flutter/material.dart';
import '../../../data/model/bank/bank_model.dart';

class BankSelectionSheet extends StatefulWidget {
  final List<BankModel> banks;
  final String selectedBank; // ngân hàng đang được chọn (nếu có)

  const BankSelectionSheet({
    Key? key,
    required this.banks,
    required this.selectedBank,
  }) : super(key: key);

  @override
  State<BankSelectionSheet> createState() => _BankSelectionSheetState();
}

class _BankSelectionSheetState extends State<BankSelectionSheet> {
  late List<BankModel> filteredBanks;
  final TextEditingController _searchCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredBanks = widget.banks; // Khởi tạo danh sách ban đầu
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
                filteredBanks = widget.banks.where((bank) {
                  final name = bank.nameBank.toLowerCase();
                  final description = bank.descriptionBank.toLowerCase();
                  return name.contains(value.toLowerCase()) ||
                         description.contains(value.toLowerCase());
                }).toList();
              });
            },
          ),
          const SizedBox(height: 10),

          // Danh sách ngân hàng
          Expanded(
            child: ListView.builder(
              itemCount: filteredBanks.length,
              itemBuilder: (context, index) {
                final bank = filteredBanks[index];

                final isSelected = bank.nameBank == widget.selectedBank;

                return ListTile(
                  leading: bank.avatarBank.isNotEmpty
                      ? Image.network(
                          bank.avatarBank,
                          width: 40,
                          height: 40,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.error),
                        )
                      : const Icon(Icons.account_balance),
                  title: Text(bank.nameBank),
                  subtitle: Text(bank.descriptionBank),
                  trailing: isSelected
                      ? const Icon(Icons.check_circle, color: Colors.blue)
                      : null,
                  onTap: () {
                    // Khi chọn ngân hàng => pop với giá trị bank.name
                    Navigator.pop(context, bank.nameBank);
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
