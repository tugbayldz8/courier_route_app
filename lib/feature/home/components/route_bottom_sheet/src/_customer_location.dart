part of '../route_bottom_sheet.dart';

final class _CustomerLocation extends ConsumerWidget {
  const _CustomerLocation({
    required this.locationModel,
  });

  final LocationModel? locationModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 4,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: ListTile(
              isThreeLine: true,
              title: const Text(
                'Adres Bilgileri',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(locationModel?.address ?? ''),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                IconButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                        Color.fromARGB(147, 211, 212, 212)),
                  ),
                  onPressed: () {
                    ref.read(locationViewModelProvider.notifier).startRoute(
                          locationModel?.id,
                        );
                    Navigator.maybePop(context);
                  },
                  icon: const Icon(
                    Icons.location_on,
                  ),
                ),
                const Text(
                  'Rotayı Başlat',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
