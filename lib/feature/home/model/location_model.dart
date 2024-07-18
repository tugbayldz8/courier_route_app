import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sezin_soft/feature/home/model/marker_model.dart';

part 'location_model.g.dart';

@JsonSerializable()
final class LocationModel extends Equatable {
  final int? id;
  final MarkerModel? markerModel;
  final String? title;
  final String? address;
  final String? fullName;
  final String? phone;
  final bool? status;

  const LocationModel({
    this.id,
    this.markerModel,
    this.title,
    this.address,
    this.fullName,
    this.phone,
    this.status,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocationModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        markerModel,
        title,
        address,
        fullName,
        phone,
        status,
      ];

  LocationModel copyWith({
    int? id,
    MarkerModel? markerModel,
    String? title,
    String? address,
    String? fullName,
    String? phone,
    bool? status,
  }) {
    return LocationModel(
      id: id ?? this.id,
      markerModel: markerModel ?? this.markerModel,
      title: title ?? this.title,
      address: address ?? this.address,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      status: status ?? this.status,
    );
  }
}

// import 'package:equatable/equatable.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:sezin_soft/product/constants/enums/status.dart';

// final class LocationModel extends Equatable {
//   const LocationModel({
//     this.status,
//     this.latlong,
//     this.markers,
//     this.position,
//     this.address,
//   }); 

//   final LatLong? latlong;
//   final Status? status;
//   final Set<Marker>? markers;
//   final Position? position;
//   final String? address;


//   @override
//   List<Object?> get props => [
//         latlong,
//         status,
//         markers,
//         position,
//         address,
//       ];

//   LocationModel copyWith({
//     LatLong? latlong,
//     Status? status,
//     Set<Marker>? markers,
//     Position? position,
//     LocationModel? locationModel,
//     String? address,
//   }) {
//     return LocationModel(
//       latlong: latlong ?? this.latlong,
//       status: status ?? this.status,
//       markers: markers ?? this.markers,
//       position: position ?? this.position,
//       address: address ?? this.address,
//     );
//   }
// }

// final class LatLong {
//   LatLong({this.latitude, this.longitude});

//   final double? latitude;
//   final double? longitude;
// }
