part of '../route_bottom_sheet.dart';
final 
class _SupportButton extends StatelessWidget {
  const _SupportButton();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton.icon(
          icon: const Icon(Icons.contact_support),
          onPressed: BaseUrlLauncher.mail,
          label: const Text('Destek Al'),
        ),
      ],
    );
  }
}
