import 'package:primecustomer/data/model/local/base_object.dart';
import 'package:primecustomer/data/model/remote/customer.dart';
import 'package:primecustomer/data/model/remote/eFund_card_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'e_fund_request_model.freezed.dart';
part 'e_fund_request_model.g.dart';

@freezed
class EfundRequestModel extends BaseObject with _$EfundRequestModel {
  const factory EfundRequestModel({
    @Default(0) int id,
    @Default("") String message,
    @JsonKey(name: "state") @Default("") String status,
    @JsonKey(name: "total_amount") @Default("0.0") String totalAmount,
    @JsonKey(name: "created_at") @Default("") String createdAt,
    @Default(Customer()) Customer requester,
    @JsonKey(name: "potential_funders")
    @Default([])
        List<Customer> potentialFunders,
    @Default([]) List<Customer> funders,
    @Default([]) List<EfundCardModel> items,
  }) = _EfundRequestModel;

  factory EfundRequestModel.fromJson(Map<String, dynamic> json) =>
      _$EfundRequestModelFromJson(json);
}
