import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_office_time/feature/auth/view/Signup_view.dart';
import 'package:flutter_office_time/feature/auth/view/login_view.dart';
import 'package:flutter_office_time/feature/home/view/home_view.dart';
import 'package:sizer/sizer.dart';

import 'feature/home/bloc/bloc/home_bloc.dart';

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
          theme: ThemeData(
              textTheme: const TextTheme(
                bodyLarge: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                titleLarge: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                labelLarge: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 0,
                iconTheme: IconThemeData(color: Colors.black),
              ),
              primarySwatch: Colors.blue,
              scaffoldBackgroundColor: Colors.white,
              inputDecorationTheme: InputDecorationTheme(
                border: InputBorder.none,
                fillColor: Colors.grey[200],
                filled: true,
                hintStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
              cardTheme: CardTheme(
                elevation: 2,
                color: Colors.grey[100],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
                  padding: const WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  ),
                  backgroundColor: const WidgetStatePropertyAll(Colors.black),
                  elevation: const WidgetStatePropertyAll(2),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  textStyle: const WidgetStatePropertyAll(
                    TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                        fontStyle: FontStyle.normal),
                  ),
                ),
              )),
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
