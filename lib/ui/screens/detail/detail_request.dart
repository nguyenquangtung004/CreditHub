import 'package:credit_hub_app/core/constant/constant.dart';
import 'package:credit_hub_app/shared/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:credit_hub_app/ui/screens/request/cubit/request_cubit.dart';
import 'package:get/get.dart';

import '../../widgets/detail_request/custom_card_detail.dart';
import '../../widgets/detail_request/custom_time_line.dart';

class DetailRequestScreen extends StatelessWidget {
  final int requestId;

  const DetailRequestScreen({super.key, required this.requestId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RequestCubit(RepositoryProvider.of(context))..fetchRequestDetail(requestId),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Chi tiết yêu cầu",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black, size: 24),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: BlocBuilder<RequestCubit, RequestState>(
          builder: (context, state) {
            if (state is RequestLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is RequestFailure) {
              return Center(child: Text(state.error));
            } else if (state is RequestDetailSuccess) {
              final requestDetail = state.requestDetail;

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomCardDetailBill(
                        textstatus: requestDetail.statusNameHistory,
                        lotNumber: requestDetail.lotNoHistory.toString(),
                        dateRequest: requestDetail.dateRequestHistory,
                        lotPrice: requestDetail.moneyRequestHistory.toString(),
                      ),
                      h(10),
                      const Text(
                        "Chi tiết yêu cầu",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      h(10),
                      Container(
                        width: double.infinity,
                        height: 312,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            "http://credithubapi.tasvietnam.vn/download/credithub/${requestDetail.imageLinkHistory}",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      h(20),
                      CustomTimeline(textstatus: requestDetail.statusNameHistory),
                      h(13),
                      // if (requestDetail.statusNameHistory == "Không quyết toán")
                        Center(
                          child: Container(
                            width: 270,
                            height: 65,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.toNamed(AppRoute.addWithdrawalRequest.name);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: const Color(0xFFFF4A4A),
                                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.5),
                                ),
                              ),
                              child: const Text(
                                "Yêu cầu lại",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
