import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sezin_soft/feature/auth/login/model/login_model.dart';

part 'login_view_model.g.dart';

@riverpod
final class LoginViewModel extends _$LoginViewModel {
  @override
  LoginModel build() {
    return LoginModel(email: '', password: '');
  }

  void login(String email, String password) {
    state = LoginModel(
      email: email,
      password: password,
    );
  }

  void logout() {
    state = LoginModel(email: '', password: '');
  }
}
