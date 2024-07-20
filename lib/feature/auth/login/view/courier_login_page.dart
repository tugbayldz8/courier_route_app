import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sezin_soft/feature/auth/login/view/courier_login_page_mixin.dart';
import 'package:sezin_soft/feature/auth/login/view_model/login_view_model.dart';
import 'package:sezin_soft/gen/assets.gen.dart';
import 'package:sezin_soft/product/constants/string_constants.dart';
import 'package:sezin_soft/product/router/app_router.dart';

part '_logo_field.dart';
part '_email_field.dart';
part '_password_field.dart';
part '_login_button.dart';
part '_google_sign_button.dart';
part '_apple_sign_button.dart';

@RoutePage()
class CourierLoginPage extends ConsumerStatefulWidget {
  const CourierLoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CoruierState();
}

class _CoruierState extends ConsumerState<CourierLoginPage>
    with CourierLoginPageMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _PageBuilder(
          loginKey: loginKey,
          emailController: emailController,
          passwordController: passwordController,
        ),
      ),
    );
  }
}

final class _PageBuilder extends StatelessWidget {
  const _PageBuilder({
    required this.loginKey,
    required this.emailController,
    required this.passwordController,
  });
  final GlobalKey<FormBuilderState> loginKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FormBuilder(
          key: loginKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const _LogoField(),
              const SizedBox(height: 100),
              _EmailField(emailController: emailController),
              const SizedBox(height: 20),
              _PasswordField(passwordController: passwordController),
              const SizedBox(height: 30),
              _LoginButton(
                loginKey: loginKey,
                emailController: emailController,
                passwordController: passwordController,
              ),
              const SizedBox(height: 20),
              const Text('veya', style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 20),
              const _GoogleSignButton(),
              const SizedBox(height: 10),
              const _AppleSignButton(),
            ],
          ),
        ),
      ),
    );
  }
}
