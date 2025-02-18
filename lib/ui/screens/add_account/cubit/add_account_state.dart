part of 'add_account_cubit.dart';

/// Trạng thái chung của AddAccountCubit
abstract class AddAccountState {}

/// Trạng thái ban đầu của màn hình
class AddAccountInitial extends AddAccountState {}

/// Khi đang gọi API lấy danh sách ngân hàng
class BankLoading extends AddAccountState {}

/// Khi API lấy ngân hàng trả về thành công
class BankLoaded extends AddAccountState {
  final List<BankModel> banks;
  BankLoaded({required this.banks});
}

/// Khi có lỗi xảy ra trong quá trình lấy danh sách ngân hàng
class BankError extends AddAccountState {
  final String message;
  BankError({required this.message});
}

/// Khi người dùng click thêm mới và API thêm tài khoản đang xử lý
class AddAccountLoading extends AddAccountState {}

/// Khi API thêm tài khoản thực thi thành công
class AddAccountSuccess extends AddAccountState {
  final String message;
  AddAccountSuccess({required this.message});
}

/// Khi API thêm tài khoản gặp lỗi
class AddAccountError extends AddAccountState {
  final String message;
  AddAccountError({required this.message});
}

class LoadingDataBankAccount extends AddAccountState {
}

class LoadedDataBankAccount extends AddAccountState {
  final List<AccountBank> accountBank;
  LoadedDataBankAccount({required this.accountBank});
  
}
