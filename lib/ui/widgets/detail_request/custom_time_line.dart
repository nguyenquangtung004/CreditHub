import 'package:credit_hub_app/core/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class CustomTimeline extends StatelessWidget {
  final String textstatus; // Nhận trạng thái từ bên ngoài

  CustomTimeline({required this.textstatus});

  @override
  Widget build(BuildContext context) {
    // Danh sách đầy đủ các sự kiện
    final events = [
      "Gửi yêu cầu quyết toán",
      "Yêu cầu đang được xử lý",
      "Số tiền đang được quyết toán",
      "Số tiền đã quyết toán xong",
    ];

    final timestamps = [
      "22/07/2021 07:20:11",
      "22/07/2021 07:20:11",
      "22/07/2021 07:20:11",
      "22/07/2021 07:20:11",
    ];

    // Kiểm tra trạng thái để quyết định số bước hiển thị
    final isPending = textstatus == "Chờ quyết toán";
    final isNotProcessed = textstatus == "Không quyết toán";

    final displayedEvents = isPending
        ? events.sublist(0, 2)
        : isNotProcessed
            ? events.sublist(0, 3)
            : events;

    final displayedTimestamps = isPending
        ? timestamps.sublist(0, 2)
        : isNotProcessed
            ? timestamps.sublist(0, 3)
            : timestamps;

    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cột trái: Đường kẻ và chấm tròn
          Flexible(
            flex: 1,
            child: FixedTimeline.tileBuilder(
              direction: Axis.vertical,
              builder: TimelineTileBuilder.connected(
                connectorBuilder: (context, index, type) {
                  return SolidLineConnector(
                    color: index == displayedEvents.length - 1
                        ? Color(0xFFFF4A4A)
                        : Color(0xFFFDCECB),
                    thickness: 2.0,
                  );
                },
                indicatorBuilder: (context, index) {
                  return DotIndicator(
                    
                    color: index == displayedEvents.length - 1
                        ? Color(0xFFFF4A4A)
                        : Color(0xFFFDCECB),
                    size: 16.0,
                  );
                },
                contentsBuilder: (context, index) => SizedBox(
                  height: 55.0, // Đảm bảo kích thước tối thiểu để giữ kết nối
                ),
                itemCount: displayedEvents.length,
              ),
            ),
          ),
          w(14.0),
          // Cột phải: Nội dung
          Flexible(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(displayedEvents.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      bottom: 16.0), // Khoảng cách giữa các mục
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        displayedEvents[index],
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: index == displayedEvents.length - 1
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: index == displayedEvents.length - 1
                              ? Colors.red
                              : Colors.black,
                        ),
                      ),
                      // h(4.0),
                      Text(
                        displayedTimestamps[index],
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
