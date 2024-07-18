import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sezin_soft/feature/auth/login/view/courier_login_page.dart';

mixin CourierLoginPageMixin on State<CourierLoginPage> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final GlobalKey<FormBuilderState> loginKey;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    loginKey = GlobalKey<FormBuilderState>();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
