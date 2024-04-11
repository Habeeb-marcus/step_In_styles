import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:step_in_style/core/providers/auth_provider.dart';
import 'package:step_in_style/core/vm/login_state.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController(this.ref) : super(const LoginStateInitial());

  final Ref ref;

  Future<void> login(String email, String password) async {
    try {
      state = const LoginStateLoading();
      await ref.read(authRepositoryProvider).signInWithEmailAndPassword(email, password);
      state = const LoginStateSuccess();
    } catch (e) {
      state = LoginStateFailure(e.toString());
    }
  }
}


final loginControllerProvider = StateNotifierProvider<LoginController, LoginState>((ref) {
  return LoginController(ref);
});