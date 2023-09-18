import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uilearning_app/common/routes/pages.dart';
import 'package:uilearning_app/common/values/app_colors.dart';
import 'package:uilearning_app/global.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [...AppPages.allBlocProviders(context)],
        child: ScreenUtilInit(
          builder: (context, child) => MaterialApp(
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                  color: Colors.white,
                  elevation: 0,
                  iconTheme: IconThemeData(color: AppColors.primaryText)),
            ),
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppPages.generateRouteSettings,
          ),
        ));
  }
}
