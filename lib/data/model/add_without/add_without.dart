import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_without.freezed.dart'; 
part 'add_without.g.dart'; 

@freezed
class AddWithout with _$AddWithout {
  const factory AddWithout({
    @Default('') final String lot_no,
    @Default(0.0) final double money_request,
    @Default('') final String? image_link
    
  }) = _AddWithout;

  factory AddWithout.fromJson(Map<String, dynamic> json) => _$AddWithoutFromJson(json);
}