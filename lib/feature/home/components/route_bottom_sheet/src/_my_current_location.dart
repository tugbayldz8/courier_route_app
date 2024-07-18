part of '../route_bottom_sheet.dart';

final class _MyCurrentLocation extends StatelessWidget {
  const _MyCurrentLocation({
    required this.currentAddress,
  });

  final String currentAddress;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        isThreeLine: true,
        title: const Text(
          'Konumum',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(currentAddress),
      ),
    );
  }
}
