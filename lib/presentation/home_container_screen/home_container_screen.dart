import 'controller/home_container_controller.dart';
import 'package:flutter/material.dart';
import 'package:healhio/core/app_export.dart';
import 'package:healhio/presentation/home_page/home_page.dart';
import 'package:healhio/presentation/message_history_tab_container_page/message_history_tab_container_page.dart';
import 'package:healhio/presentation/profile_page/profile_page.dart';
import 'package:healhio/presentation/schedule_tab_container_page/schedule_tab_container_page.dart';
import 'package:healhio/widgets/custom_bottom_bar.dart';

class HomeContainerScreen extends GetWidget<HomeContainerController> {
  const HomeContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Navigator(
                key: Get.nestedKey(1),
                initialRoute: AppRoutes.homePage,
                onGenerateRoute: (routeSetting) => GetPageRoute(
                    page: () => getCurrentPage(routeSetting.name!),
                    transition: Transition.noTransition)),
            bottomNavigationBar: _buildBottomBar()));
  }

  /// Section Widget
  Widget _buildBottomBar() {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Get.toNamed(getCurrentRoute(type), id: 1);
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homePage;
      case BottomBarEnum.Checkmarkgray50032x32:
        return AppRoutes.messageHistoryTabContainerPage;
      case BottomBarEnum.Calendargray500:
        return AppRoutes.scheduleTabContainerPage;
      case BottomBarEnum.Usergray500:
        return AppRoutes.profilePage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homePage:
        return HomePage();
      case AppRoutes.messageHistoryTabContainerPage:
        return MessageHistoryTabContainerPage();
      case AppRoutes.scheduleTabContainerPage:
        return ScheduleTabContainerPage();
      case AppRoutes.profilePage:
        return ProfilePage();
      default:
        return DefaultWidget();
    }
  }
}
