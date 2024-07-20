part of 'courier_login_page.dart';

final class _AppleSignButton extends ConsumerWidget {
  const _AppleSignButton();

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
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.apple),
          SizedBox(width: 5),
          Text(
            'Apple ile Giriş Yap',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
