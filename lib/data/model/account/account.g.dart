// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountBankImpl _$$AccountBankImplFromJson(Map<String, dynamic> json) =>
    _$AccountBankImpl(
      bankId: (json['bank_id'] as num?)?.toInt() ?? 0,
      bankAccount: json['bank_account'] as String? ?? '',
      bankOwner: json['bank_owner'] as String? ?? '',
    );

Map<String, dynamic> _$$AccountBankImplToJson(_$AccountBankImpl instance) =>
    <String, dynamic>{
      'bank_id': instance.bankId,
      'bank_account': instance.bankAccount,
      'bank_owner': instance.bankOwner,
    };
