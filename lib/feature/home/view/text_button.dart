part of 'location_page.dart';

final class _TextButton extends ConsumerWidget {
  const _TextButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      child: const Text(
        'Müşteri Listesi',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () async {
        final locationPageModel = ref.read(locationViewModelProvider);
        if (locationPageModel.locationModelList != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            CustomBottomSheet.show<void>(
              context: context,
              child: LocationBottomSheet(
                locationModelList: locationPageModel.locationModelList!,
              ),
            );
          });
        }
      },
    );
  }
} 
