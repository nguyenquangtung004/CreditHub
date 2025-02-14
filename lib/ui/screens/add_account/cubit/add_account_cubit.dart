import 'package:bloc/bloc.dart';
import 'package:credit_hub_app/data/model/bank/bank_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_account_state.dart';

class AddAccountCubit extends Cubit<AddAccountState> {
  AddAccountCubit() : super(AddAccountInitial());
}
