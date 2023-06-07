import 'package:flutter/material.dart';
import 'package:meet/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key ? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return MaterialApp(
          theme: ThemeData(
          ),
          builder: (BuildContext context, Widget? child) {
            // Set RTL text direction
            return Directionality(
              textDirection: TextDirection.rtl, //To change the rendering direction from right to left
              child: child!,
            );
          },
          home: LoginScreen()
        );
      },
    );
  }
}
