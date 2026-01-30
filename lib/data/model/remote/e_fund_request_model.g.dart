// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'e_fund_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EfundRequestModelImpl _$$EfundRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$EfundRequestModelImpl(
  id: (json['id'] as num?)?.toInt() ?? 0,
  message: json['message'] as String? ?? "",
  status: json['state'] as String? ?? "",
  totalAmount: json['total_amount'] as String? ?? "0.0",
  createdAt: json['created_at'] as String? ?? "",
  requester: json['requester'] == null
      ? const Customer()
      : Customer.fromJson(json['requester'] as Map<String, dynamic>),
  potentialFunders:
      (json['potential_funders'] as List<dynamic>?)
          ?.map((e) => Customer.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  funders:
      (json['funders'] as List<dynamic>?)
          ?.map((e) => Customer.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => EfundCardModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$EfundRequestModelImplToJson(
  _$EfundRequestModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'message': instance.message,
  'state': instance.status,
  'total_amount': instance.totalAmount,
  'created_at': instance.createdAt,
  'requester': instance.requester,
  'potential_funders': instance.potentialFunders,
  'funders': instance.funders,
  'items': instance.items,
};
