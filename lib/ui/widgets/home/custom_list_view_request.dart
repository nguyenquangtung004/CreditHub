import 'package:flutter/material.dart';
import '../../../core/constant/app_color.dart';
import '../history/custom_item_history.dart';

class CustomListViewRequest extends StatelessWidget {
  const CustomListViewRequest({super.key});

  @override
  Widget build(BuildContext context) {
    // Danh sách dữ liệu giả lập
    final List<Map<String, dynamic>> fakeData = [
      {
        "textstatus": "Chờ quyết toán",
        "lotNumber": "000392",
        "dateRequest": "22/07/2021 07:20:11",
        "lotPrice": "21.500.000 đ",
        "imageBill":
            "https://i.pinimg.com/736x/13/50/cb/1350cb38b529d86ed65b0601744afed2.jpg"
      },
      {
        "textstatus": "Đã quyết toán",
        "lotNumber": "000393",
        "dateRequest": "23/07/2021 08:30:45",
        "lotPrice": "15.000.000 đ",
        "imageBill":
            "https://i.pinimg.com/236x/47/3e/eb/473eeb47fa7cba44898469d248cd9f58.jpg"
      },
      {
        "textstatus": "Không quyết toán",
        "lotNumber": "000394",
        "dateRequest": "24/07/2021 10:15:22",
        "lotPrice": "18.700.000 đ",
        "imageBill":
            "https://i.pinimg.com/236x/47/3e/eb/473eeb47fa7cba44898469d248cd9f58.jpg"
      },
      {
        "textstatus": "Chờ quyết toán",
        "lotNumber": "000395",
        "dateRequest": "25/07/2021 12:45:00",
        "lotPrice": "25.000.000 đ",
        "imageBill":
            "https://i.pinimg.com/236x/47/3e/eb/473eeb47fa7cba44898469d248cd9f58.jpg"
      },
      {
        "textstatus": "Đã quyết toán",
        "lotNumber": "000396",
        "dateRequest": "26/07/2021 14:10:15",
        "lotPrice": "12.000.000 đ",
        "imageBill":
            "https://i.pinimg.com/236x/47/3e/eb/473eeb47fa7cba44898469d248cd9f58.jpg"
      },
      {
        "textstatus": "Không quyết toán",
        "lotNumber": "000397",
        "dateRequest": "27/07/2021 16:00:00",
        "lotPrice": "10.500.000 đ",
        "imageBill":
            "https://i.pinimg.com/236x/47/3e/eb/473eeb47fa7cba44898469d248cd9f58.jpg"
      },
    ];

    
    // Giới hạn chỉ hiển thị 5 mục
    final limitedData = fakeData.take(5).toList();

    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: limitedData.length,
        itemBuilder: (context, index) {
          final item = limitedData[index];
          final String textStatus = item["textstatus"];
          // Lấy gradient tương ứng từ statusGradients
          final LinearGradient gradientColor = statusGradients[textStatus] ??
              LinearGradient(
                colors: [Colors.grey, Colors.grey.shade700],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              );
      
          return CustomItemHistory(
            textstatus: item["textstatus"],
            lotNumber: item["lotNumber"],
            dateRequest: item["dateRequest"],
            lotPrice: item["lotPrice"],
            gradientColor: gradientColor,
            imageBill: item["imageBill"],
          );
        },
      ),
    );
  }
}
