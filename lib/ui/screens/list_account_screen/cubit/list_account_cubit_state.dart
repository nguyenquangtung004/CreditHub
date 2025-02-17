import 'package:credit_hub_app/data/model/account/account.dart';
import 'package:credit_hub_app/data/model/pagination/pagination_response.dart';
import 'package:equatable/equatable.dart';

abstract class AccountListBankState extends Equatable {
  const AccountListBankState();

  @override
  List<Object> get props => [];
}

class ListAccountInitial extends AccountListBankState {}

class ListAccountLoading extends AccountListBankState {}

class ListAccountSuc extends AccountListBankState {
  final PaginationResponse<AccountBank> data;
  const ListAccountSuc(this.data);
}
class  ListAccountError extends AccountListBankState {
   final String error;

  const ListAccountError(this.error);

  @override
  List<Object> get props => [error];
}