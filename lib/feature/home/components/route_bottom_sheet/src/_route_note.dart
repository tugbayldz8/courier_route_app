part of '../route_bottom_sheet.dart';

final class _RouteNote extends StatelessWidget {
  _RouteNote();
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        title: const Text(
          'Not Ekle',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          children: [
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Notunuz...',
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                side: const BorderSide(color: Colors.black),
                backgroundColor: const Color.fromARGB(255, 59, 59, 59),
              ),
              onPressed: () {
                if (textController.text.isNotEmpty) {
                  // code here
                }
              },
              child: const Text(
                'Kaydet',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
