part of '../route_bottom_sheet.dart';

final class _DeliveryStatus extends ConsumerWidget {
  const _DeliveryStatus({
    required this.locationModel,
  });

  final LocationModel locationModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 4,
      child: ListTile(
        title: const Text(
          'Teslimat Bilgileri',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Row(
          children: [
            RadioMenuButton(
              value: false,
              groupValue: locationModel.status,
              onChanged: (value) {
                ref.read(locationViewModelProvider.notifier).changeModelStatus(
                      locationModel.copyWith(status: value),
                    );
              },
              child: const Text('Teslim Edilmedi'),
            ),
            RadioMenuButton(
              value: true,
              groupValue: locationModel.status,
              onChanged: (value) {
                ref.read(locationViewModelProvider.notifier).changeModelStatus(
                      locationModel.copyWith(status: value),
                    );
              },
              child: const Text('Teslim Edildi'),
            ),
          ],
        ),
      ),
    );
  }
}
