import 'package:credit_hub_app/core/constant/constant.dart';
import 'package:credit_hub_app/ui/widgets/home/custom_item_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/_base/bloc/base_bloc_consumer.dart';
import '../../../data/model/home/apiresponse/api_response.dart';
import '../../widgets/sign_in/custom_button_sign_in.dart';
import '../../widgets/home/custom_chart.dart';
import '../../../core/constant/app_string.dart';
import '../../../core/constant/app_color.dart';
import 'cubit/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _lastOffset = 0.0;
  bool _showButtons = true;

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollUpdateNotification) {
            setState(() {
              if (scrollNotification.metrics.pixels > _lastOffset) {
                _showButtons = false;
              } else if (scrollNotification.metrics.pixels <= 50) {
                _showButtons = true;
              }
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
                bloc: homeCubit,
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    );
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: 150,
                                        height: 71,
                                        child: CustomButtonSignIn(
                                          text01: "${state.totalRequest}",
                                          text02: pendingSettlementRequest,
                                          onPressed: () =>
                                              {print(state.totalRequest)},
                                          color01: Colors.red,
                                          color02: Colors.black,
                                          backgroundColor: Colors.white,
                                        ),
                                      ),
                                      w(12)
,                                      Container(
                                        width: 158,
                                        height: 72,
                                        child: CustomButtonSignIn(
                                          text01:
                                              "${state.totalMoney.toStringAsFixed(0)}",
                                          text02: pendingSettlementAmount,
                                          onPressed: () =>
                                              {print(state.totalMoney)},
                                          color01: const Color.fromRGBO(
                                              255, 187, 36, 1),
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
                                child: const CustomChartLine(),
                              ),
                            ],
                          ),
                        ),
                      ],
                      body:
                          CustomListViewRequest(lstRequests: state.lstRequests),
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
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      appName,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: Colors.white,
                      ),
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

// WIDGET: CustomListViewRequest (Gộp từ custom_list_view_request.dart)
class CustomListViewRequest extends StatelessWidget {
  final List<RequestItem> lstRequests;

  const CustomListViewRequest({Key? key, required this.lstRequests})
      : super(key: key);

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

          final LinearGradient gradientColor =
              statusGradients[item.statusName] ??
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
