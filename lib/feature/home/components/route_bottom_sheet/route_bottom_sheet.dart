import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sezin_soft/feature/home/model/location_model.dart';
import 'package:sezin_soft/feature/home/view_model/location_view_model.dart';
import 'package:sezin_soft/product/base/functions/base_url_launcher.dart';

part 'src/_my_current_location.dart';
part 'src/_customer_location.dart';
part 'src/_customer_info.dart';
part 'src/_delivery_status.dart';
part 'src/_route_note.dart';
part 'src/_support_button.dart';

final class RouteBottomSheet extends ConsumerWidget {
  const RouteBottomSheet({
    super.key,
    required this.id,
    required this.currentAddress,
  });

  final int id;
  final String currentAddress;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationModel = ref
        .watch(locationViewModelProvider)
        .locationModelList
        ?.firstWhere((e) => e.id == id);
    if (locationModel == null) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MyCurrentLocation(currentAddress: currentAddress),
          _CustomerLocation(locationModel: locationModel),
          _CustomerInfo(locationModel: locationModel),
          _DeliveryStatus(locationModel: locationModel),
          _RouteNote(),
          const _SupportButton(),
        ],
      ),
    );
  }
}
