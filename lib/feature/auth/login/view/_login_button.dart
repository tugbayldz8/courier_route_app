part of 'courier_login_page.dart';

final class _LoginButton extends ConsumerWidget {
  const _LoginButton({
    required this.loginKey,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormBuilderState> loginKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        side: const BorderSide(color: Colors.black),
        backgroundColor: const Color.fromARGB(255, 59, 59, 59),
      ),
      onPressed: () {
        if (loginKey.currentState?.validate() ?? false) {
          ref.read(loginViewModelProvider.notifier).login(
                emailController.text,
                passwordController.text,
              );
          context.router.replaceNamed(RoutePath.home.path);
        }
      },
      child: const Text(
        StringConstants.login,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
