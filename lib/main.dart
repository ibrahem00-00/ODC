import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshopodc/business_logic/auth/login/login_cubit.dart';
import 'package:workshopodc/business_logic/auth/register/register_cubit.dart';
import 'package:workshopodc/business_logic/lectures/lectures_cubit.dart';
import 'package:workshopodc/business_logic/news/news_cubit.dart';
import 'package:workshopodc/business_logic/notes/notes_cubit.dart';
import 'package:workshopodc/business_logic/sections/sections_cubit.dart';
import 'package:workshopodc/data_provider/local/cache_helper.dart';
import 'package:workshopodc/presentation/screens/login/login_screen.dart';
import 'business_logic/finals/finals_cubit.dart';
import 'constants/app_colors.dart';
import 'package:sizer/sizer.dart';

import 'data_provider/remote/dio_helper.dart';
import 'presentation/screens/splash/splash.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.init();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => RegisterCubit(),),
            BlocProvider(create: (context) => LoginCubit(),),
            BlocProvider(create: (context) => NotesCubit()..createTable(),),
            BlocProvider(create: (context) => NewsCubit(),),
            BlocProvider(create: (context) => LecturesCubit(),),
            BlocProvider(create: (context) => SectionsCubit(),),
            BlocProvider(create: (context) => FinalsCubit(),),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Sizer',
            theme: ThemeData(
              elevatedButtonTheme: const ElevatedButtonThemeData(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          AppColors.primaryColor)
                  )
              ),
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  backgroundColor: AppColors.primaryColor
              ),
              // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              //   showUnselectedLabels: false,
              //     selectedIconTheme: IconThemeData(
              //         color:AppColors.primaryColor,
              //     size: 25),
              //     selectedItemColor: AppColors.primaryColor)
            ),
            // home: Splash(),
            initialRoute: "/",
            routes: {
              "/": (context) => const Splash(),
              "/APP_LAYOUT": (context) => Login(),

            },
          ),
        );
      },
    );
  }
}
