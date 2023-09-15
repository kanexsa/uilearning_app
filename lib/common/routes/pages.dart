import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uilearning_app/common/routes/names.dart';
import 'package:uilearning_app/pages/application/application_page.dart';
import 'package:uilearning_app/pages/application/bloc/application_blocs.dart';

import '../../pages/register/bloc/register_blocs.dart';
import '../../pages/register/register.dart';
import '../../pages/sign_in/bloc/sign_in_blocs.dart';
import '../../pages/sign_in/sign_in.dart';
import '../../pages/welcome/bloc/welcome_blocs.dart';
import '../../pages/welcome/welcome.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
          route: AppRoutes.INITIAL,
          page: const Welcome(),
          bloc: BlocProvider(
            create: (_) => WelcomeBloc(),
          )),
      PageEntity(
          route: AppRoutes.SIGN_IN,
          page: const SignIn(),
          bloc: BlocProvider(
            create: (_) => SignInBloc(),
          )),
      PageEntity(
          route: AppRoutes.REGISTER,
          page: const Register(),
          bloc: BlocProvider(
            create: (_) => RegisterBloc(),
          )),
      PageEntity(
          route: AppRoutes.APPLICATION,
          page: const ApplicationPage(),
          bloc: BlocProvider(create: (_) => ApplicationBlocs())),
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  //a modal that covers entire screen as we click an navigator object
  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      //check for route name matching when navigator gets triggered.
      //Navigatorda belirttiğimiz route isimleri ile yukarıdaki pageentity route isimlerini karşılaştırıyoruz. Eşleşenleri alıyoruz.
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        print("valid route name ${settings.name}");
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    print("invalid route name ${settings.name}");
    return MaterialPageRoute(
        builder: (_) => const SignIn(), settings: settings);
  }
}

//blocprovider, route ve sayfaları birleştirfiğimiz sınıf
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, this.bloc});
}
