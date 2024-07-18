part of 'courier_login_page.dart';

final class _LogoField extends StatelessWidget {
  const _LogoField();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      child: Image.asset(
        Assets.images.logo.path,
        fit: BoxFit.contain,
      ),
    );
  }
}
