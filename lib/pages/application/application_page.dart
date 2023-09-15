import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uilearning_app/common/values/app_colors.dart';
import 'package:uilearning_app/pages/application/bloc/application_blocs.dart';
import 'package:uilearning_app/pages/application/bloc/application_events.dart';
import 'package:uilearning_app/pages/application/bloc/application_states.dart';
import 'package:uilearning_app/pages/sign_in/widgets/application_widgets.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationBlocs, ApplicationStates>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              body: buildPage(state.index),
              bottomNavigationBar: Container(
                width: 375.w,
                height: 58.h,
                decoration: BoxDecoration(
                    color: AppColors.primaryElement,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.h),
                        topRight: Radius.circular(20.h)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 1)
                    ]),
                child: BottomNavigationBar(
                    currentIndex: state.index,
                    onTap: (value) {
                      // setState(() {
                      //   _index = value;
                      // });
                      context
                          .read<ApplicationBlocs>()
                          .add(TriggerAppEvent(value));
                    },
                    elevation: 0,
                    type: BottomNavigationBarType.fixed,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    selectedItemColor: AppColors.primaryElement,
                    unselectedItemColor: AppColors.primaryFourElementText,
                    items: bottomTabs),
              ),
            ),
          ),
        );
      },
    );
  }
}
