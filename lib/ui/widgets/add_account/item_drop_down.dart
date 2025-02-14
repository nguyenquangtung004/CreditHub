import 'package:flutter/material.dart';

class BankSelectionSheet extends StatefulWidget {
  final List<Map<String, String>> banks;
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
  late List<Map<String, String>> filteredBanks;
  final TextEditingController _searchCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredBanks = widget.banks; // ban đầu = toàn bộ
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // Chiều cao tuỳ ý, ví dụ 400
      height: 500,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Thanh "kéo" hoặc nút đóng (tuỳ thiết kế)
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          // TextField tìm kiếm
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
                  final name = bank["name"]?.toLowerCase() ?? "";
                  final subName = bank["subName"]?.toLowerCase() ?? "";
                  return name.contains(value.toLowerCase()) ||
                         subName.contains(value.toLowerCase());
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
                    // Khi chọn ngân hàng => pop với giá trị bankName
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
