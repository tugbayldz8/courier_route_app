// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marker_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarkerModel _$MarkerModelFromJson(Map<String, dynamic> json) => MarkerModel(
      markerId: (json['markerId'] as num?)?.toInt(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MarkerModelToJson(MarkerModel instance) =>
    <String, dynamic>{
      'markerId': instance.markerId,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
