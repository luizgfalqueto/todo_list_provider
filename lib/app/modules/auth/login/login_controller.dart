import 'package:todo_list_provider/app/core/notifier/default_change_notifier.dart';
import 'package:todo_list_provider/app/exceptions/auth_exception.dart';

import '../../../services/user/user_service.dart';

class LoginController extends DefaultChangeNotifier {
  final UserService _userService;
  String? infoMessage;

  LoginController({required UserService userService})
      : _userService = userService;

  bool get hasInfo => infoMessage != null;

  Future<void> login(String email, String password) async {
    try {
      showLoadingAndResetState();
      infoMessage = null;
      notifyListeners();
      final user = await _userService.login(email, password);

      if (user != null) {
        success();
      } else {
        setError('Usuário e/ou senha inválidos');
      }
    } on AuthException catch (e) {
      setError(e.message);
    } finally {
      hideLoading();
      notifyListeners();
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      infoMessage = null;
      showLoadingAndResetState();
      notifyListeners();
      await _userService.forgotPassword(email);
      infoMessage = 'Recuperaçao de senha enviada para seu email';
    } catch (e) {
      if(e is AuthException) {
        setError(e.message);
      }
      setError('Erro ao recuperar senha');
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}
