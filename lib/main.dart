import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vouch_chatroom/di/injection.dart';
import 'package:vouch_chatroom/service/bloc_observer.dart';
import 'package:vouch_chatroom/utils/color_lib.dart';
import 'package:vouch_chatroom/utils/helpers.dart';
import 'package:vouch_chatroom/views/login/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  Bloc.observer = CustomBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Helpers.generateMaterialColor(ColorLib.colorPrimary),
        primaryColor: ColorLib.colorPrimary,
      ),
      home: LoginPage(),
    );
  }
}

