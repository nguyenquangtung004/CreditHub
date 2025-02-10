import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/constant.dart';

class CustomCalendarWidget extends StatelessWidget {
  final Function(List<DateTime?>) onDateRangeSelected;

  const CustomCalendarWidget({Key? key, required this.onDateRangeSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DateTime?> selectedDates = [];

    // Cấu hình cho CalendarDatePicker2
    final config = CalendarDatePicker2Config(
      calendarType: CalendarDatePicker2Type.range, // Chế độ chọn phạm vi ngày
      selectedDayHighlightColor: const Color(0xFFFF4A4A), // Màu nền ngày được chọn
      selectedDayTextStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      todayTextStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      controlsTextStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      firstDayOfWeek: 0, // Bắt đầu từ Chủ Nhật
      centerAlignModePicker: true, // Căn giữa mode picker
      weekdayLabelTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      disableModePicker: true, // Vô hiệu hóa mode picker
    );

    return FractionallySizedBox(
      heightFactor: 0.64, // Chiều cao chiếm 64% màn hình
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          
          CalendarDatePicker2(
            config: config,
            value: selectedDates, // Giá trị ngày được chọn
            onValueChanged: (dates) {
              selectedDates = dates; // Cập nhật giá trị ngày được chọn
            },
          ),
          
          h(5), // Khoảng cách giữa date picker và nút "Lọc"
          Container(
            margin: EdgeInsets.only( left: 20.0,right: 20.0,bottom: 1.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Đóng modal
                onDateRangeSelected(selectedDates); // Gọi callback với phạm vi ngày đã chọn
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF4A4A), // Màu nền nút
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(48), // Bo tròn góc nút
                ),
                padding: const EdgeInsets.symmetric(vertical: 16), // Padding dọc
                minimumSize: const Size(double.infinity, 48), // Chiều rộng và cao tối thiểu
              ),
              child: const Text(
                'Lọc', // Văn bản trên nút
                style: TextStyle(
                  color: Color(0xFFF2F2F2), // Màu chữ
                  fontSize: 16, // Kích thước font chữ
                ),
              ),
            ),
          ),
          h(10),
          Container(
            margin: EdgeInsets.only( left: 20.0,right: 20.0,bottom: 1.0),
            child: TextButton(
              onPressed: () {
                Navigator.pop(context); // Đóng modal
                onDateRangeSelected([]); // Reset phạm vi ngày
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey.withOpacity(0.1), // Màu nền nút
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(48), // Bo tròn góc nút
                ),
                padding: const EdgeInsets.symmetric(vertical: 16), // Padding dọc
                minimumSize: const Size(double.infinity, 48), // Chiều rộng và cao tối thiểu
              ),
              child: const Text(
                'Reset', // Văn bản trên nút
                style: TextStyle(
                  color: Colors.black, // Màu chữ
                  fontSize: 16, // Kích thước font chữ
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}