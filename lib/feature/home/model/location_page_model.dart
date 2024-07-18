import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sezin_soft/feature/home/model/location_model.dart';
import 'package:sezin_soft/product/constants/enums/status.dart';

final class LocationPageModel extends Equatable {
  final Status? status;
  final List<LocationModel>? locationModelList;
  final Set<Marker>? markers;
  final Position? position;
  final String? currentAddress;

  const LocationPageModel({
    this.status,
    this.locationModelList,
    this.markers,
    this.position,
    this.currentAddress,
  });

  LocationPageModel copyWith({
    Status? status,
    List<LocationModel>? locationModelList,
    Set<Marker>? markers,
    Position? position,
    String? currentAddress,
  }) {
    return LocationPageModel(
      status: status ?? this.status,
      locationModelList: locationModelList ?? this.locationModelList,
      markers: markers ?? this.markers,
      position: position ?? this.position,
      currentAddress: currentAddress ?? this.currentAddress,
    );
  }

  @override
  List<Object?> get props => [
        status,
        locationModelList,
        markers,
        position,
        currentAddress,
      ];
}
