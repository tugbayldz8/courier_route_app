import 'package:latlong2/latlong.dart';
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
    state = state.copyWith(
      locationModelList: locationModelList,
    );
  }

  void changeModelStatus(LocationModel model) {
    List<LocationModel> newList = List<LocationModel>.from(
      state.locationModelList ?? [],
    );

    final index = newList.indexWhere(
      (e) => e.id == model.id,
    );

    for (var item in newList) {
      if (item.id == model.id) {
        final newModel = item.copyWith(
          status: model.status,
        );
        newList[index] = newModel;
      }
    }
    state = state.copyWith(
      locationModelList: newList,
    );
  }

  void startRoute(int? id) {
    if (id == null) return;
    final customer = state.locationModelList?.firstWhere(
      (e) => e.id == id,
    );

    state = state.copyWith(
      points: [
        LatLng(
          customer?.markerModel?.latitude ?? 0,
          customer?.markerModel?.longitude ?? 0,
        ),
      ],
    );
  }

  void startFullRoute() {
    final latlongRoutes = state.locationModelList
        ?.map(
          (e) {
            return LatLng(
              e.markerModel?.latitude ?? 0,
              e.markerModel?.longitude ?? 0,
            );
          },
        )
        .cast<LatLng>()
        .toList();
    state = state.copyWith(
      points: latlongRoutes,
    );
  }

  void stopRoute() {
    state = state.copyWith(
      points: [],
    );
  }
}
