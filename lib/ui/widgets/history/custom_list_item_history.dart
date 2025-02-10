import 'package:credit_hub_app/core/constant/app_color.dart';
import 'package:credit_hub_app/ui/widgets/history/custom_item_history.dart';
import 'package:flutter/material.dart';

class CustomListItemHistory extends StatelessWidget {
  final List<Map<String, String>> _itemHistoryData = const [
    {
      "textstatus": "Chờ quyết toán",
      "lotNumber": "000392",
      "textdateRequest": "22/07/2021 07:20:11",
      "lotPrice": "21.500.000 đ",
      "imageBill":
          "https://i.pinimg.com/736x/13/50/cb/1350cb38b529d86ed65b0601744afed2.jpg"
    },
    {
      "textstatus": "Đã quyết toán",
      "lotNumber": "000393",
      "textdateRequest": "23/07/2021 08:30:45",
      "lotPrice": "15.000.000 đ",
      "imageBill":
          "https://i.pinimg.com/236x/47/3e/eb/473eeb47fa7cba44898469d248cd9f58.jpg"
    },
    {
      "textstatus": "Không quyết toán",
      "lotNumber": "000394",
      "textdateRequest": "24/07/2021 10:15:22",
      "lotPrice": "18.700.000 đ",
      "imageBill":
          "https://i.pinimg.com/236x/47/3e/eb/473eeb47fa7cba44898469d248cd9f58.jpg"
    },
    {
      "textstatus": "Chờ quyết toán",
      "lotNumber": "000395",
      "textdateRequest": "25/07/2021 12:45:00",
      "lotPrice": "25.000.000 đ",
      "imageBill":
          "https://i.pinimg.com/236x/47/3e/eb/473eeb47fa7cba44898469d248cd9f58.jpg"
    },
  ];
  final String textStatus;

  const CustomListItemHistory({super.key, required this.textStatus});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredItems = textStatus == "Tất cả"
        ? _itemHistoryData
        : _itemHistoryData
            .where((item) => item["textstatus"] == textStatus)
            .toList();
    // 🔥 Nếu danh sách rỗng, hiển thị thông báo "Không có dữ liệu"
    if (filteredItems.isEmpty) {
      return Center(
        child: Text(
          "Không có dữ liệu",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      );
    }
    return ListView.builder(
      itemCount: filteredItems.length,
      itemBuilder: (context, index) {
        final item = filteredItems[index];
        final String textStatus = item["textstatus"]!;
        final LinearGradient gradientColor1 = statusGradients[textStatus] ??
            LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.grey, Colors.grey.shade700],
            );
        return CustomItemHistory(
          textstatus: item["textstatus"]!,
          lotNumber: item["lotNumber"]!,
          dateRequest: item["textdateRequest"]!,
          lotPrice: item["lotPrice"]!,
          gradientColor: gradientColor1, 
          imageBill: item["imageBill"]!,
        );
      },
    );
  }
}
