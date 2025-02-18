import 'package:credit_hub_app/ui/screens/add_withdrawal_request/add_withdrawal_request.dart';
import 'package:credit_hub_app/ui/screens/request/history.dart';
import 'package:credit_hub_app/ui/screens/home/home.dart';
import 'package:credit_hub_app/ui/screens/notfication.dart';
import 'package:credit_hub_app/ui/screens/profile/profile.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigator extends StatefulWidget {
  const CustomBottomNavigator({super.key});

  @override
  State<CustomBottomNavigator> createState() => _CustomBottomNavigatorState();
}

class _CustomBottomNavigatorState extends State<CustomBottomNavigator> {
   int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    HistoryScreen(),
    AddWithDrawalRequestScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
       body: _pages[_currentIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: const Icon(Icons.add, 
        color: Colors.white),
        onPressed: () {
          setState(() {
            _currentIndex = 2; // Chuyển đến mục "Thêm mới" khi nhấn nút
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: ClipRRect(
        borderRadius:  const BorderRadius.only(
          topLeft: Radius.circular(20.0), // Bo góc trái
          topRight: Radius.circular(20.0), // Bo góc phải
        ),
        
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Trang chủ",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: "Lịch sử",
            ),
            BottomNavigationBarItem(
              icon: SizedBox.shrink(), 
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "Thông báo",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Tài khoản",
            ),
          ],
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }
}