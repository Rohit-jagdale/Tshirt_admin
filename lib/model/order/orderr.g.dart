// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderr.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Orderr _$OrderrFromJson(Map<String, dynamic> json) => Orderr(
      id: json['id'] as String?,
      address: json['address'] as String?,
      customer: json['customer'] as String?,
      dateTime: json['dateTime'] as String?,
      item: json['item'] as String?,
      phone: (json['phone'] as num?)?.toDouble(),
      price: (json['price'] as num?)?.toDouble(),
      transactionId: json['transactionId'] as String?,
    );

Map<String, dynamic> _$OrderrToJson(Orderr instance) => <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'customer': instance.customer,
      'dateTime': instance.dateTime,
      'item': instance.item,
      'phone': instance.phone,
      'price': instance.price,
      'transactionId': instance.transactionId,
    };
