import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todomobx/stores/login_store.dart';
import 'package:todomobx/widgets/custom_icon_button.dart';
import 'package:todomobx/widgets/custom_text_field.dart';

import 'list_screen.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  LoginStore loginStore = LoginStore();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(32),
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 16,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Observer(builder: (context) {
                      return CustomTextField(
                        hint: 'E-mail',
                        prefix: Icon(Icons.account_circle),
                        textInputType: TextInputType.emailAddress,
                        onChanged: loginStore.setEmail,
                        enabled: !loginStore.loading,
                      );
                    }),
                    const SizedBox(height: 16,),
                    Observer(
                      builder: (context) {
                        return CustomTextField(
                          hint: 'Senha',
                          prefix: Icon(Icons.lock),
                          obscure: !loginStore.isVisible,
                          onChanged: loginStore.setPassword,
                          enabled: !loginStore.loading,
                          suffix: CustomIconButton(
                            radius: 32,
                            iconData: loginStore.isVisible ? Icons.visibility : Icons.visibility_off_sharp,
                            onTap: loginStore.toggleIsVisible
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 16,),
                    SizedBox(
                      height: 44,
                      child: Observer(
                        builder: (context) {
                          return ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.resolveWith((states) {
                                if(states.contains(MaterialState.disabled))
                                  return Theme.of(context).primaryColor.withAlpha(100);

                                return Theme.of(context).primaryColor;
                              })
                            ),
                            child: loginStore.loading
                              ? SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white)))
                              : Text('Login', style: TextStyle(color: Colors.white)),
                            onPressed: loginStore.loginPressed,
                          );
                        },
                      )
                    )
                  ],
                ),
              )
          ),
        ),
      ),
    );
  }
}
