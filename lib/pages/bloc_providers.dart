import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uilearning_app/pages/register/bloc/register_blocs.dart';
import 'package:uilearning_app/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:uilearning_app/pages/welcome/bloc/welcome_blocs.dart';

import '../app_blocs.dart';

class AppBlocProviders {
  static get allBlockProviders => [
        BlocProvider(
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          create: (context) => AppBlocs(),
        ),
        BlocProvider(
          create: (context) => SignInBloc(),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
      ];
}
