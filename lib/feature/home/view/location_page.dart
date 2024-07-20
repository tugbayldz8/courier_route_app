import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
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

  final Completer<MapController> controller = Completer<MapController>();

  @override
  Widget build(BuildContext context) {
    final locationModel = ref.watch(locationViewModelProvider);
    return Scaffold(
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 74, 2, 133),
                shadowColor: Colors.transparent,
                side: const BorderSide(
                  color: Color.fromARGB(255, 209, 209, 209),
                ),
              ),
              onPressed: () {
                ref.read(locationViewModelProvider.notifier).startFullRoute();
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.navigation_outlined,
                    color: Colors.white,
                  ),
                  Text(
                    'Başlat',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                side: const BorderSide(
                  color: Color.fromARGB(255, 209, 209, 209),
                ),
              ),
              onPressed: () {
                ref.read(locationViewModelProvider.notifier).stopRoute();
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.close),
                  SizedBox(width: 5),
                  Text(
                    'Sonlandır',
                    style: TextStyle(
                      color: Color.fromARGB(255, 74, 2, 133),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Builder(
            builder: (context) {
              if (locationModel.locationModelList != null &&
                  locationModel.position != null &&
                  locationModel.currentAddress != null) {
                final locationPageModel = ref.read(locationViewModelProvider);
                final markers = locationModel.locationModelList
                    ?.map(
                      (e) => Marker(
                        alignment: Alignment.topCenter,
                        rotate: true,
                        child: GestureDetector(

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
                          child: Icon(
                            Icons.location_on,
                            size: 50,
                            color: e.status == true ? Colors.green : Colors.red,
                          ),
                        ),
                        point: LatLng(
                          e.markerModel?.latitude ?? 0,
                          e.markerModel?.longitude ?? 0,
                        ),
                      ),
                    )
                    .toList();
                return FlutterMap(
                  mapController: MapController(),
                  options: MapOptions(
                    initialZoom: 14,
                    initialCenter: LatLng(
                      locationModel.position?.latitude ??
                          StringConstants.latitude,
                      locationModel.position?.longitude ??
                          StringConstants.longitude,
                    ),
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                      tileProvider: CancellableNetworkTileProvider(),
                    ),
                    MarkerLayer(
                      markers: markers ?? [],
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: LatLng(
                            locationModel.position?.latitude ?? 0,
                            locationModel.position?.longitude ?? 0,
                          ),
                          child: const Icon(
                            Icons.delivery_dining,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                    PolylineLayer(
                      polylines: [
                        Polyline(
                          strokeWidth: 5,
                          color: const Color.fromARGB(255, 3, 130, 233),
                          points: [
                            LatLng(
                              locationModel.position?.latitude ?? 0,
                              locationModel.position?.longitude ?? 0,
                            ),
                            ...locationPageModel.points ?? [],
                          ],
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
            },
          ),
          Positioned(
            top: 60,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                children: [
                  const Text(
                    'Rotalar',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 150),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 74, 2, 133),
                      shadowColor: Colors.transparent,
                      side: const BorderSide(
                        color: Color.fromARGB(255, 209, 209, 209),
                      ),
                    ),
                    onPressed: () async {
                      final locationPageModel =
                          ref.read(locationViewModelProvider);
                      if (locationPageModel.locationModelList != null) {
                        WidgetsBinding.instance.addPostFrameCallback(
                          (_) {
                            CustomBottomSheet.show<void>(
                              context: context,
                              child: LocationBottomSheet(
                                locationModelList:
                                    locationPageModel.locationModelList!,
                              ),
                            );
                          },
                        );
                      }
                    },
                    child: const Icon(
                      Icons.list_rounded,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
