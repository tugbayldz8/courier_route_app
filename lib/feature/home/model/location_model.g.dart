// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) =>
    LocationModel(
      id: (json['id'] as num?)?.toInt(),
      markerModel: json['markerModel'] == null
          ? null
          : MarkerModel.fromJson(json['markerModel'] as Map<String, dynamic>),
      title: json['title'] as String?,
      address: json['address'] as String?,
      fullName: json['fullName'] as String?,
      phone: json['phone'] as String?,
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$LocationModelToJson(LocationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'markerModel': instance.markerModel,
      'title': instance.title,
      'address': instance.address,
      'fullName': instance.fullName,
      'phone': instance.phone,
      'status': instance.status,
    };
