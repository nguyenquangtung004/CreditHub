import 'dart:developer';
import 'package:credit_hub_app/core/constant/constant.dart';
import 'package:credit_hub_app/data/repository/home/home_rep.dart';
import 'package:credit_hub_app/ui/widgets/home/custom_item_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../data/_base/bloc/base_bloc_consumer.dart';
import '../../../data/model/home/apiresponse/api_response.dart';
import '../../widgets/home/custom_chart.dart';
import '../../../core/constant/app_string.dart';
import '../../../core/constant/app_color.dart';
import '../../widgets/sign_in/custom_button_sign_in.dart';
import 'cubit/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _lastOffset = 0.0;
  bool _showButtons = true;

  /// ✅ Lấy HomeCubit từ GetX
  HomeCubit get _cubit => Get.find<HomeCubit>();

  @override
  void initState() {
    super.initState();
   try {
    if (!Get.isRegistered<HomeCubit>()) {
      log("📌 Đăng ký HomeCubit...");
      Get.put(HomeCubit(dataRepository: Get.find<DataRepository>()));
    }
    _cubit.fetchHomeData(); // ✅ GỌI FETCH DỮ LIỆU NGAY KHI CUBIT ĐƯỢC KHỞI TẠO
  } catch (e) {
    log("❌ Lỗi khi đăng ký HomeCubit: $e");
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<HomeCubit, HomeState>(
        bloc: _cubit,
        listener: (context, state) {
          if (state is HomeLoading) {
            log("📌 Đang tải dữ liệu từ API...");
          } else if (state is HomeError) {
            Get.snackbar("Lỗi", state.message, backgroundColor: Colors.red);
          }
        },
        child: NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            if (scrollNotification is ScrollUpdateNotification) {
              setState(() {
                _showButtons =
                    scrollNotification.metrics.pixels <= 50 || scrollNotification.metrics.pixels < _lastOffset;
                _lastOffset = scrollNotification.metrics.pixels;
              });
            }
            return false;
          },
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Column(children: headerHome),
              ),

              // Nội dung chính
              Positioned(
                top: 180,
                left: 0,
                right: 0,
                bottom: 0,
                child: BaseBlocConsumer<HomeCubit, HomeState>(
                  bloc: _cubit,
                  builder: (context, state) {
                    if (state is HomeLoading) {
                      return const Center(child: CircularProgressIndicator(color: Colors.red));
                    } else if (state is HomeLoaded) {
                      return NestedScrollView(
                        headerSliverBuilder: (context, innerBoxIsScrolled) => [
                          SliverToBoxAdapter(
                            child: Column(
                              children: [
                                AnimatedOpacity(
                                  opacity: _showButtons ? 1.0 : 0.0,
                                  duration: const Duration(milliseconds: 300),
                                  child: Container(
                                    height: 90,
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        _buildInfoCard(
                                          "${state.totalRequest}",
                                          pendingSettlementRequest,
                                          Colors.red,
                                        ),
                                        w(12),
                                        _buildInfoCard(
                                          "${state.totalMoney.toStringAsFixed(0)}",
                                          pendingSettlementAmount,
                                          const Color.fromRGBO(255, 187, 36, 1),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                h(10),
                                const Center(
                                  child: Text(
                                    salesOverTime,
                                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Colors.black),
                                  ),
                                ),
                                Container(
                                  height: 220,
                                  color: Colors.white,
                                  width: double.infinity,
                                  child: const CustomChartLine(),
                                ),
                              ],
                            ),
                          ),
                        ],
                        body: CustomListViewRequest(lstRequests: state.lstRequests),
                      );
                    } else if (state is HomeError) {
                      return Center(child: Text("Lỗi: ${state.message}"));
                    } else {
                      return const Center(child: Text("Nhấn để tải dữ liệu!"));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// ✅ Widget hiển thị tổng số yêu cầu hoặc số tiền chờ quyết toán
  Widget _buildInfoCard(String value, String label, Color color) {
    return Container(
      width: 150,
      height: 71,
      child: CustomButtonSignIn(
        text01: value,
        text02: label,
        onPressed: () => {print(value)},
        color01: color,
        color02: Colors.black,
        backgroundColor: Colors.white,
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
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFF4A4A), Color(0xFFFF754A)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Opacity(
            opacity: 0.7,
            child: Image.asset(
              "assets/images/images_infrastructure.png",
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
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Colors.white),
                    ),
                    Text(
                      appName,
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24, color: Colors.white),
                    ),
                  ],
                ),
                Image(image: AssetImage(images02), height: 107, width: 142),
              ],
            ),
          ),
        ],
      ),
    ];
  }
}

/// ✅ Danh sách yêu cầu quyết toán
class CustomListViewRequest extends StatelessWidget {
  final List<RequestItem> lstRequests;

  const CustomListViewRequest({Key? key, required this.lstRequests}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 17,
        centerTitle: true,
        title: const Text(
          recentRequests,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: lstRequests.length,
        itemBuilder: (context, index) {
          final item = lstRequests[index];

          final LinearGradient gradientColor = statusGradients[item.statusName] ??
              LinearGradient(
                colors: [Colors.grey, Colors.grey.shade700],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              );

          return CustomItemHome(
            textstatus: item.statusName,
            lotNumber: item.lotNo,
            dateRequest: item.dateRequest,
            lotPrice: "${item.moneyRequest.toStringAsFixed(0)} đ",
            gradientColor: gradientColor,
          );
        },
      ),
    );
  }
}
