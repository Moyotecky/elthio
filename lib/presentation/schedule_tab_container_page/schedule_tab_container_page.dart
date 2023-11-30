import 'controller/schedule_tab_container_controller.dart';
import 'models/schedule_tab_container_model.dart';
import 'package:flutter/material.dart';
import 'package:healhio/core/app_export.dart';
import 'package:healhio/presentation/schedule_page/schedule_page.dart';
import 'package:healhio/widgets/app_bar/appbar_title.dart';
import 'package:healhio/widgets/app_bar/custom_app_bar.dart';

class ScheduleTabContainerPage extends StatelessWidget {
  ScheduleTabContainerPage({Key? key})
      : super(
          key: key,
        );

  ScheduleTabContainerController controller =
      Get.put(ScheduleTabContainerController(ScheduleTabContainerModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 16.v),
              _buildTabview(),
              SizedBox(
                height: 578.v,
                child: TabBarView(
                  controller: controller.tabviewController,
                  children: [
                    SchedulePage(),
                    SchedulePage(),
                    SchedulePage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      height: 47.v,
      title: AppbarTitle(
        text: "lbl_schedule".tr,
        margin: EdgeInsets.only(left: 21.h),
      ),
      actions: [
        Container(
          height: 33.v,
          width: 24.h,
          margin: EdgeInsets.fromLTRB(20.h, 8.v, 20.h, 6.v),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgComponent1WhiteA700,
                height: 16.v,
                width: 4.h,
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.only(
                  left: 20.h,
                  top: 17.v,
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgVolume,
                height: 24.adaptSize,
                width: 24.adaptSize,
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(bottom: 9.v),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildTabview() {
    return Container(
      height: 46.v,
      width: 335.h,
      decoration: BoxDecoration(
        color: appTheme.gray100,
        borderRadius: BorderRadius.circular(
          8.h,
        ),
      ),
      child: TabBar(
        controller: controller.tabviewController,
        labelPadding: EdgeInsets.zero,
        labelColor: appTheme.whiteA700,
        labelStyle: TextStyle(
          fontSize: 14.fSize,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelColor: theme.colorScheme.onPrimary,
        unselectedLabelStyle: TextStyle(
          fontSize: 14.fSize,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w400,
        ),
        indicator: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(
            8.h,
          ),
        ),
        tabs: [
          Tab(
            child: Text(
              "lbl_upcoming".tr,
            ),
          ),
          Tab(
            child: Text(
              "lbl_completed".tr,
            ),
          ),
          Tab(
            child: Text(
              "lbl_canceled".tr,
            ),
          ),
        ],
      ),
    );
  }
}
