import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sezin_soft/feature/home/model/location_model.dart';
import 'package:sezin_soft/feature/home/model/location_page_model.dart';
import 'package:sezin_soft/product/constants/enums/status.dart';
import 'package:sezin_soft/product/core/models/latlong.dart';
import 'package:sezin_soft/product/maps/location_manager.dart';
import 'package:sezin_soft/product/maps/service/marker_service.dart';

part 'location_view_model.g.dart';

@riverpod
final class LocationViewModel extends _$LocationViewModel {
  @override
  LocationPageModel build() {
    return const LocationPageModel();
  }

  Future<void> currentLocation() async {
    final position = await LocationManager.getLocation();
    final currentAdres = await LocationManager.addressFromLatLong(
      LatLong(
        latitude: position?.latitude,
        longitude: position?.longitude,
      ),
    );
    if (position == null) {
      AsyncError('Hata', StackTrace.current);
      state = state.copyWith(status: Status.failed);
      return;
    }
    state = state.copyWith(
      position: position,
      currentAddress: currentAdres,
    );
  }

  Future<void> getMarkers() async {
    final locationModelList = await MarkerService.fetchData();
    final markers = locationModelList
        .map(
          (e) => Marker(
            infoWindow: InfoWindow(title: e.fullName),
            markerId: MarkerId(e.id.toString()),
            position: LatLng(
              e.markerModel?.latitude ?? 0,
              e.markerModel?.longitude ?? 0,
            ),
          ),
        )
        .toSet();
    state = state.copyWith(
      markers: markers,
      locationModelList: locationModelList,
    );
  }

  void changeModelStatus(LocationModel model) {
    List<LocationModel> newList =
        List<LocationModel>.from(state.locationModelList ?? []);

    final index = newList.indexWhere((e) => e.id == model.id);

    for (var item in newList) {
      if (item.id == model.id) {
        final newModel = item.copyWith(status: model.status);
        newList[index] = newModel;
      }
    }
    state = state.copyWith(locationModelList: newList);
  }
}
