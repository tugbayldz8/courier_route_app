part of 'courier_login_page.dart';

final class _GoogleSignButton extends ConsumerWidget {
  const _GoogleSignButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        side: const BorderSide(
          color: Color.fromARGB(255, 209, 209, 209),
        ),
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            MdiIcons.google,
            size: 20,
          ),
          const SizedBox(width: 5),
          const Text(
            'Google ile Giriş Yap',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
