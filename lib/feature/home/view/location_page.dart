import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sezin_soft/feature/home/components/location_bottom_sheet.dart';
import 'package:sezin_soft/feature/home/components/route_bottom_sheet/route_bottom_sheet.dart';
import 'package:sezin_soft/feature/home/view_model/location_view_model.dart';
import 'package:sezin_soft/product/constants/string_constants.dart';
import 'package:sezin_soft/product/core/widgets/custom_bottom_sheet.dart';

part 'text_button.dart';

@RoutePage()
final class LocationPage extends ConsumerStatefulWidget {
  const LocationPage({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LocationPageState();
}

class _LocationPageState extends ConsumerState<LocationPage> {
  @override
  void initState() {
    ref.read(locationViewModelProvider.notifier).getMarkers();
    ref.read(locationViewModelProvider.notifier).currentLocation();
    super.initState();
  }

  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    final locationModel = ref.watch(locationViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Rotalar',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          _TextButton(),
        ],
      ),
      body: Builder(
        builder: (context) {
          if (locationModel.locationModelList != null &&
              locationModel.position != null &&
              locationModel.currentAddress != null) {
            final locationPageModel = ref.read(locationViewModelProvider);
            final markers = locationModel.locationModelList
                ?.map(
                  (e) => Marker(
                    icon: e.status == true
                        ? BitmapDescriptor.defaultMarkerWithHue(
                            BitmapDescriptor.hueGreen)
                        : BitmapDescriptor.defaultMarker,
                    infoWindow: InfoWindow(title: e.fullName),
                    markerId: MarkerId(e.id.toString()),
                    position: LatLng(
                      e.markerModel?.latitude ?? 0,
                      e.markerModel?.longitude ?? 0,
                    ),
                    onTap: () {
                      CustomBottomSheet.show<void>(
                        context: context,
                        child: RouteBottomSheet(
                          id: e.id ?? 0,
                          currentAddress:
                              locationPageModel.currentAddress ?? '',
                        ),
                      );
                    },
                  ),
                )
                .toSet();
            return GoogleMap(
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  locationModel.position?.latitude ?? StringConstants.latitude,
                  locationModel.position?.longitude ??
                      StringConstants.longitude,
                ),
                zoom: 14.4746,
              ),
              onMapCreated: controller.isCompleted ? null : controller.complete,
              markers: markers ?? {},
            );
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
    );
  }
}
