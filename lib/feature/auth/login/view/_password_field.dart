part of 'courier_login_page.dart';

class _PasswordField extends StatefulWidget {
  const _PasswordField({
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  State<_PasswordField> createState() => __PasswordFieldState();
}

class __PasswordFieldState extends State<_PasswordField> {
  bool _passwordVisibility = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passwordController,
      textInputAction: TextInputAction.done,
      autofillHints: const [AutofillHints.password],
      obscureText: _passwordVisibility,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50),),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50),),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 209, 209, 209),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        prefixIcon: const Icon(Icons.lock, size: 20),
        labelText: StringConstants.password,
        suffixIcon: IconButton(
          icon: Icon(
            _passwordVisibility == false
                ? Icons.visibility
                : Icons.visibility_off,
          ),
          onPressed: () =>
              setState(() => _passwordVisibility = !_passwordVisibility),
        ),
      ),
    );
  }
}
