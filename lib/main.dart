import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todomobx/screens/login_screen.dart';
import 'package:todomobx/stores/login_store.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => LoginStore(),
      child: MaterialApp(
        title: 'MobX Tutorial',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.deepPurpleAccent,
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.deepPurpleAccent
          ),
          scaffoldBackgroundColor: Colors.deepPurpleAccent,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
