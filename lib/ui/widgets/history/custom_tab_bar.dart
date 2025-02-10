import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  final TabController tabController;

  const CustomTabBar({super.key, required this.tabController});

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  final List<String> _tabs = [
    'Tất cả',
    'Chờ quyết toán',
    'Không quyết toán',
    'Đã quyết toán',
  ];

  @override
  void initState() {
    super.initState();
    widget.tabController.addListener(_updateSelectedIndex);
  }

  @override
  void dispose() {
    widget.tabController.removeListener(_updateSelectedIndex);
    super.dispose();
  }

  void _updateSelectedIndex() {
    if (mounted) {
      setState(() {}); // Cập nhật giao diện khi TabController thay đổi
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(_tabs.length, (index) {
          final bool isSelected = widget.tabController.index == index;

          return GestureDetector(
            onTap: () {
              widget.tabController.animateTo(index); // Chuyển tab ngay lập tức
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: isSelected ? Colors.red : Colors.grey[300],
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                _tabs[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
