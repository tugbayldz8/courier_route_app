import 'package:equatable/equatable.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:sezin_soft/feature/home/model/location_model.dart';
import 'package:sezin_soft/product/constants/enums/status.dart';

final class LocationPageModel extends Equatable {
  final Status? status;
  final List<LocationModel>? locationModelList;
  final List<Marker>? markers;
  final Position? position;
  final String? currentAddress;
  final PolylineLayer? polylines;
  final List<LatLng>? points;

  const LocationPageModel({
    this.status,
    this.locationModelList,
    this.markers,
    this.position,
    this.currentAddress,
    this.polylines,
    this.points,
  });

  LocationPageModel copyWith({
    Status? status,
    List<LocationModel>? locationModelList,
    List<Marker>? markers,
    Position? position,
    String? currentAddress,
    PolylineLayer? polylines,
    List<LatLng>? points,
  }) {
    return LocationPageModel(
      status: status ?? this.status,
      locationModelList: locationModelList ?? this.locationModelList,
      markers: markers ?? this.markers,
      position: position ?? this.position,
      currentAddress: currentAddress ?? this.currentAddress,
      polylines: polylines ?? this.polylines,
      points: points??this.points,
    );
  }

  @override
  List<Object?> get props => [
        status,
        locationModelList,
        markers,
        position,
        currentAddress,
        polylines,
        points,
      ];
}
