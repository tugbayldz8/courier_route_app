part of 'courier_login_page.dart';

final class _EmailField extends StatelessWidget {
  const _EmailField({
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofillHints: const [AutofillHints.email],
      controller: emailController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Colors.grey),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10),
        prefixIcon: Icon(
          Icons.mail,
          size: 20,
        ),
        labelText: StringConstants.email,
      ),
    );
  }
}
