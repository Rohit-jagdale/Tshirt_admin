import 'package:json_annotation/json_annotation.dart';
part 'orderr.g.dart';

@JsonSerializable()
class Orderr {

  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "address")
  String? address;

  @JsonKey(name: "customer")
  String? customer;

  @JsonKey(name: "dateTime")
  String? dateTime;

  @JsonKey(name: "item")
  String? item;

  @JsonKey(name: "phone")
  double? phone;

  @JsonKey(name: "price")
  double? price;

  @JsonKey(name: "transactionId")
  String? transactionId;

  Orderr({
    this.id,
    this.address,
    this.customer,
    this.dateTime,
    this.item,
    this.phone,
    this.price,
    this.transactionId,
  });

  factory Orderr.fromJson(Map<String, dynamic> json) => _$OrderrFromJson(json);
  Map<String, dynamic> toJson() => _$OrderrToJson(this);
}