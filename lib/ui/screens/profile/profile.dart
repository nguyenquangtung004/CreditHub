import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/auth/user/user.dart';
import '../../../shared/app_manager.dart';
import '../../widgets/home/custom_background.dart';
import '../../widgets/home/list_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel>(
      future: context.read<AppManager>().getUserInfo(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator()); // Hiển thị khi đang tải dữ liệu
        }

        final user = snapshot.data!;

        return Scaffold(
          body: Container(
            color: Colors.grey.withOpacity(0.1),
            child: Stack(
              children: [
                const Column(
                  children: [customBackground()],
                ),
                Positioned(
                  top: 170,
                  left: 20,
                  right: 20,
                  child: Container(
                    width: 325,
                    height: 87,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(right: 20.0, left: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            user.name.isNotEmpty ? user.name : "Người dùng",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            user.username.isNotEmpty ? user.username : "Không có mã đại lý",
                            style: const TextStyle(
                              color: Color.fromRGBO(126, 126, 126, 1),
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  top: 280,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: listButton(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


