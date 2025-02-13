import 'package:credit_hub_app/core/constant/app_color.dart';
import 'package:credit_hub_app/data/model/home/request/request_history.dart';
import 'package:credit_hub_app/ui/widgets/history/custom_item_history.dart';
import 'package:flutter/material.dart';

class CustomListItemHistory extends StatelessWidget {
  final RequestHistory historyItem; // ✅ Chỉ nhận 1 item thay vì danh sách
  const CustomListItemHistory({super.key, required this.historyItem});

  @override
  Widget build(BuildContext context) {
    // 🌟 Xác định màu dựa vào trạng thái
    final LinearGradient gradientColor1 = statusGradients[historyItem.statusNameHistory] ??
        const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Colors.grey, Colors.grey],
        );

    return CustomItemHistory(
      id: historyItem.id, 
      textstatus: historyItem.statusNameHistory, // 🌟 Lấy từ API
      lotNumber: historyItem.lotNoHistory, // 🌟 Lấy từ API
      dateRequest: historyItem.dateRequestHistory, // 🌟 Lấy từ API
      lotPrice: "${historyItem.moneyRequestHistory} đ", // 🌟 Lấy từ API
      gradientColor: gradientColor1,
      imageBill: historyItem.imageLinkHistory ?? "https://via.placeholder.com/150", // 🌟 Ảnh mặc định nếu null
    );
  }
}
