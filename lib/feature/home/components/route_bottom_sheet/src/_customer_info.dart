part of '../route_bottom_sheet.dart';

final class _CustomerInfo extends StatelessWidget {
  const _CustomerInfo({
    required this.locationModel,
  });
  final LocationModel locationModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: ListTile(
              leading: Text(
                locationModel.id.toString(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 77, 77, 77),
                ),
              ),
              title: const Text(
                'Müşteri Bilgileri',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text.rich(
                TextSpan(
                  text: 'Ad Soyad: ',
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' ${locationModel.fullName}\n',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 94, 94, 94),
                      ),
                    ),
                    const TextSpan(
                      text: 'Telefon: ',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    TextSpan(
                      text: '${locationModel.phone}\n',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 94, 94, 94),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: const Color.fromARGB(147, 211, 212, 212),
                  ),
                  onPressed: BaseUrlLauncher.phone,
                  icon: const Icon(
                    Icons.phone,
                  ),
                ),
                const Text(
                  'Ara',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
