import 'package:primecustomer/data/model/local/base_object.dart';
import 'package:primecustomer/data/model/remote/address_model.dart';
import 'package:primecustomer/data/model/remote/customer.dart';
import 'package:primecustomer/data/model/remote/merchant_details.dart';
import 'package:primecustomer/data/model/remote/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'orders_model.freezed.dart';
part 'orders_model.g.dart';

@freezed
class OrderModel extends BaseObject with _$OrderModel {
  const factory OrderModel({
    @Default(0) int id,
    @Default(0) int quantity,
    @Default('') String reference,
    @JsonKey(name: 'net_amount') @Default(0) double netAmount,
    @JsonKey(name: 'gross_amount') @Default(0) double grossAmount,
    @JsonKey(name: 'unit_amount') @Default(0) double unitAmount,
    @JsonKey(name: 'total_discount') @Default(0) double totalDiscount,
    @Default(false) bool selected,
    @JsonKey(name: 'delivery_status') @Default('') String deliveryStatus,
    @JsonKey(name: 'payment_status') @Default('') String paymentStatus,
    @JsonKey(name: 'created_at') @Default('') String createdAt,
    @JsonKey(name: 'updated_at') @Default('') String updatedAt,
    @JsonKey(name: 'delivery_option') @Default('') String deliveryOption,
    @Default(Customer()) Customer customer,
    @JsonKey(name: 'store_information')
    @Default(MerchantDetails())
    MerchantDetails client,
    @JsonKey(name: 'delivery_address')
    @Default(AddressModel())
    AddressModel deliveryAddress,
    @Default(ProductModel()) ProductModel product,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}
