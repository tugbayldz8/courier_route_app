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
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 209, 209, 209),
          ),
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
