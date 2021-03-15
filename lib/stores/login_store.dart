
import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {

  _LoginStore() {
    autorun((_) {
      print(email);
    });
  }

  @observable
  String email = '';

  @observable
  String password = '';

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get isFormValid => email.length > 6 && password.length > 6;

  @observable
  bool isVisible = false;

  @action
  void toggleIsVisible() => isVisible = !isVisible;

  @observable
  bool loading = false;

  @action
  Future<void> login() async {
    loading = true;
    await Future.delayed(Duration(seconds: 2));
    loading = false;
  }

  @computed
  Function get loginPressed =>
    isFormValid && !loading ? login : null;

}