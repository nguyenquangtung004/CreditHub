// ANCHOR: Import các thư viện cần thiết
import 'package:credit_hub_app/data/_base/bloc/base_state.dart';
import 'package:flutter/material.dart'; // LINK: Thư viện chính của Flutter
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/components/dialog/app_dialog.dart';
import '../../../core/components/loading/app_loading.dart'; // LINK: Hỗ trợ quản lý trạng thái với BLoC

// ANCHOR: Lớp `BaseBlocConsumer` là một widget tùy chỉnh để lắng nghe và xây dựng giao diện dựa trên trạng thái của BLoC
class BaseBlocConsumer<C extends Cubit<S>, S> extends StatelessWidget {
  final C bloc; // NOTE: Đối tượng BLoC hoặc Cubit quản lý trạng thái
  final Widget Function(BuildContext context, S state) builder; // NOTE: Builder để xây dựng giao diện dựa trên trạng thái BLoC
  final void Function(BuildContext context, S state)? listener; // NOTE: Listener để xử lý sự kiện khi trạng thái thay đổi (tùy chọn)

  // SECTION: Constructor của `BaseBlocConsumer`
  const BaseBlocConsumer({
    required this.bloc,
    required this.builder,
    this.listener, // STUB: Listener là tùy chọn
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<C, S>(
      bloc: bloc, // LINK: Gắn BLoC/Cubit vào `BlocConsumer`
      
      // SECTION: Listener xử lý trạng thái khi có thay đổi
      listener: (context, state) {
        if (state is BaseState && state.status == BaseStatus.loading) {
          AppLoading.show(); // NOTE: Hiển thị loading indicator khi trạng thái là "loading"
        } else {
          AppLoading.dismiss(); // NOTE: Ẩn loading indicator khi trạng thái không còn là "loading"
        }

        if (state is BaseState && state.status == BaseStatus.failure) {
          AppDialog.show(context, msg: state.message); // ERROR: Hiển thị dialog lỗi khi trạng thái là "failure"
        }

        // LINK: Gọi listener tùy chọn nếu có
        listener?.call(context, state);
      },

      // SECTION: Xây dựng giao diện dựa trên trạng thái hiện tại
      builder: builder, 
    );
  }
}
