import 'package:credit_hub_app/ui/widgets/history/custom_date_picker.dart';
import 'package:credit_hub_app/ui/widgets/history/custom_list_item_history.dart';
import 'package:flutter/material.dart';

import '../../core/constant/app_string.dart';
import '../widgets/history/custom_tab_bar.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
    @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          textHistory,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt_sharp),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true, // Cho phép điều chỉnh chiều cao modal
                builder: (context) {
                  return CustomCalendarWidget(
                    onDateRangeSelected: (selectedDates) {
                      if (selectedDates.isNotEmpty) {
                        print('Start Date: ${selectedDates.first}');
                        print('End Date: ${selectedDates.last}');
                      } else {
                        print('Selection reset');
                      }
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            // Search bar
            Container(
              height: 52,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),
    
            // Tab bar
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: CustomTabBar(tabController: _tabController),
            ),
    
            // Danh sách hiển thị bên dưới tab bar
            Expanded(
              child: TabBarView(  
                 controller: _tabController,
                children: [
                 CustomListItemHistory(textStatus: "Tất cả",),
                 CustomListItemHistory(textStatus: "Chờ quyết toán",),
                 CustomListItemHistory(textStatus: "Không quyết toán",),
                 CustomListItemHistory(textStatus: "Đã quyết toán",)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

