import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uilearning_app/app_blocs.dart';
import 'package:uilearning_app/app_events.dart';
import 'package:uilearning_app/app_states.dart';
import 'package:uilearning_app/common/values/app_colors.dart';
import 'package:uilearning_app/pages/bloc_providers.dart';
import 'package:uilearning_app/pages/register/register.dart';
import 'package:uilearning_app/pages/sign_in/sign_in.dart';
import 'package:uilearning_app/pages/welcome/welcome.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: AppBlocProviders.allBlockProviders,
        child: ScreenUtilInit(
          builder: (context, child) => MaterialApp(
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                  color: Colors.white, elevation: 0, iconTheme: IconThemeData(color: AppColors.primaryText)),
            ),
            debugShowCheckedModeBanner: false,
            home: const Welcome(),
            routes: {
              "myHomePage": (context) => const MyHomePage(),
              "signIn": (context) => const SignIn(),
              "register": (context) => const Register()
            },
          ),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Flutter Demo Home Page'),
        ),
        body: Center(child: BlocBuilder<AppBlocs, AppStates>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  "${BlocProvider.of<AppBlocs>(context).state.counter}",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            );
          },
        )),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              heroTag: "HeroTag1",
              onPressed: () => BlocProvider.of<AppBlocs>(context).add(Increment()),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              heroTag: "HeroTag2",
              onPressed: () => BlocProvider.of<AppBlocs>(context).add(Decrement()),
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        ));
  }
}
