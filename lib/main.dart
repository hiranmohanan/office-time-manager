import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_office_time/feature/auth/view/Signup_view.dart';
import 'package:flutter_office_time/feature/auth/view/login_view.dart';
import 'package:flutter_office_time/feature/home/view/home_view.dart';
import 'package:flutter_office_time/theme/dark_theme.dart';
import 'package:sizer/sizer.dart';

import 'feature/home/bloc/bloc/home_bloc.dart';
import 'theme/light_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, deviceType) {
      return MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
            create: (context) => HomeBloc(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme(),
          darkTheme: darktheme(),
          themeMode: ThemeMode.system,
          routes: {
            '/': (context) => const LoginView(),
            '/signup': (context) => const SignupView(),
            '/home': (context) => const HomeView(),
          },
        ),
      );
    });
  }
}
