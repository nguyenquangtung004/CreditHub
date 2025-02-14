// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountBankImpl _$$AccountBankImplFromJson(Map<String, dynamic> json) =>
    _$AccountBankImpl(
      imageAccountBank: json['icons'] as String? ?? '',
      bankId: (json['bank_id'] as num?)?.toInt() ?? 0,
      bankAccount: json['bank_account'] as String? ?? '',
      bankName: json['bank_name'] as String? ?? '',
      bankOwner: json['bank_owner'] as String? ?? '',
    );

Map<String, dynamic> _$$AccountBankImplToJson(_$AccountBankImpl instance) =>
    <String, dynamic>{
      'icons': instance.imageAccountBank,
      'bank_id': instance.bankId,
      'bank_account': instance.bankAccount,
      'bank_name': instance.bankName,
      'bank_owner': instance.bankOwner,
    };
