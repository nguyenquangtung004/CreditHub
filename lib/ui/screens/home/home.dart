import 'package:credit_hub_app/core/constant/constant.dart';
import 'package:credit_hub_app/ui/widgets/sign_in/custom_button_sign_in.dart';
import 'package:credit_hub_app/ui/widgets/home/custom_chart.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/app_string.dart';
import '../../widgets/home/custom_list_view_request.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _lastOffset = 0.0; // Lưu trạng thái cuộn trước đó
  bool _showButtons = true; // Kiểm soát hiển thị nút

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollUpdateNotification) {
            setState(() {
              if (scrollNotification.metrics.pixels > _lastOffset) {
                // Vuốt xuống → Ẩn nút
                _showButtons = false;
              } else if (scrollNotification.metrics.pixels <= 50) {
                // Vuốt lên → Hiện lại khi lên đỉnh
                _showButtons = true;
              }
              _lastOffset = scrollNotification.metrics.pixels;
            });
          }
          return false;
        },
        child: Stack(
          children: [
            // Giữ headerHome cố định trên màn hình
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Column(
                children:
                    headerHome, // Gọi hàm headerHome để hiển thị phần nền và tiêu đề
              ),
            ),

            // Nội dung có thể cuộn
            Positioned(
              top: 180, // Bắt đầu cuộn từ sau header
              left: 0,
              right: 0,
              bottom: 0,
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        // Nút bấm sẽ ẩn khi cuộn xuống và hiện khi vuốt lên
                        AnimatedOpacity(
                          opacity:
                              _showButtons ? 1.0 : 0.0, // Kiểm soát hiển thị
                          duration: const Duration(milliseconds: 300),
                          child: Container(
                            height: 90,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 150,
                                  height: 71,
                                  child: CustomButtonSignIn(
                                    text01: "70",
                                    text02: pendingSettlementRequest,
                                    onPressed: () => {print("70")},
                                    color01:
                                        const Color.fromRGBO(255, 74, 74, 1),
                                    color02: Colors.black,
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                                w(12),
                                Container(
                                  width: 158,
                                  height: 72,
                                  child: CustomButtonSignIn(
                                    text01: "332.248.000",
                                    text02: pendingSettlementAmount,
                                    onPressed: () => {print("70")},
                                    color01:
                                        const Color.fromRGBO(255, 187, 36, 1),
                                    color02: Colors.black,
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        h(10),
                        const Center(
                          child: Text(
                            salesOverTime,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ),

                        Container(
                          height: 220,
                          color: Colors.white,
                          width: double.infinity,
                          child: CustomChartLine(),
                        ),
                      ],
                    ),
                  ),
                ],
                body: CustomListViewRequest(), // Danh sách sẽ cuộn được
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> get headerHome {
    return [
      Stack(
        children: [
          Container(
            height: 230,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFF4A4A),
                  Color(0xFFFF754A),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Opacity(
            opacity: 0.7,
            child: Image.asset(
              imagesInfrastructure,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
         
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titleHome,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Colors.white),
                    ),
                    Text(
                      appName,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Colors.white),
                    ),
                  ],
                ),
                Image(image: AssetImage(images02), height: 107, width: 142)
              ],
            ),
          ),
        ],
      ),
    ];
  }
}
