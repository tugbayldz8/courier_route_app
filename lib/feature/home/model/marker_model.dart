import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'marker_model.g.dart';

@JsonSerializable()
final class MarkerModel extends Equatable {
  final int? markerId;
  final double? latitude;
  final double? longitude;

  const MarkerModel({
    this.markerId,
    this.latitude,
    this.longitude,
  });

  MarkerModel copyWith({
    int? markerId,
    double? latitude,
    double? longitude,
  }) {
    return MarkerModel(
      markerId: markerId ?? this.markerId,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  factory MarkerModel.fromJson(Map<String, dynamic> json) =>
      _$MarkerModelFromJson(json);
  Map<String, dynamic> toJson() => _$MarkerModelToJson(this);

  @override
  List<Object?> get props => [
        markerId,
        latitude,
        longitude,
      ];
}
