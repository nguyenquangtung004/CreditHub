import 'package:credit_hub_app/core/constant/app_color.dart';
import 'package:credit_hub_app/data/model/home/apiresponse/api_response.dart';
import 'package:credit_hub_app/ui/widgets/history/custom_item_history.dart';
import 'package:flutter/material.dart';

class CustomListItemHistory extends StatelessWidget {
  final List<RequestItem> historyList;
  final String textStatus;

  const CustomListItemHistory({super.key, required this.historyList, required this.textStatus});

  @override
  Widget build(BuildContext context) {
    // 🔥 Nếu danh sách rỗng, hiển thị thông báo "Không có dữ liệu"
    if (historyList.isEmpty) {
      return const Center(
        child: Text(
          "Không có dữ liệu",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      itemCount: historyList.length,
      itemBuilder: (context, index) {
        final item = historyList[index];

        // 🌟 Xác định màu dựa vào trạng thái
        final LinearGradient gradientColor1 = statusGradients[item.statusName] ??
            const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.grey, Colors.grey],
            );

        return CustomItemHistory(
          textstatus: item.statusName, // 🌟 Lấy từ API
          lotNumber: item.lotNo, // 🌟 Lấy từ API
          dateRequest: item.dateRequest, // 🌟 Lấy từ API
          lotPrice: "${item.moneyRequest} đ", // 🌟 Lấy từ API
          gradientColor: gradientColor1, 
          imageBill: item.image_link ?? "https://via.placeholder.com/150", // 🌟 Nếu không có ảnh, dùng ảnh mặc định
        );
      },
    );
  }
}
