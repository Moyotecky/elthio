import '../profile_page/widgets/profilelistsection_item_widget.dart';
import 'controller/profile_controller.dart';
import 'models/profile_model.dart';
import 'models/profilelistsection_item_model.dart';
import 'package:flutter/material.dart';
import 'package:healhio/core/app_export.dart';
import 'package:healhio/widgets/custom_icon_button.dart';

// ignore_for_file: must_be_immutable
class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  ProfileController controller = Get.put(ProfileController(ProfileModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.transparent,
            body: Container(
                width: mediaQueryData.size.width,
                height: mediaQueryData.size.height,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment(0.5, 0),
                        end: Alignment(0.5, 1),
                        colors: [
                      theme.colorScheme.secondaryContainer,
                      theme.colorScheme.onError
                    ])),
                child: Container(
                    width: double.maxFinite,
                    decoration: AppDecoration.linear,
                    child: Column(children: [
                      SizedBox(height: 44.v),
                      _buildProfileSection(),
                      SizedBox(height: 27.v),
                      _buildProfileListSection(),
                      SizedBox(height: 38.v),
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.h, vertical: 29.v),
                          decoration: AppDecoration.white.copyWith(
                              borderRadius: BorderRadiusStyle.customBorderTL30),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(height: 5.v),
                                _buildMySaveSection(),
                                SizedBox(height: 14.v),
                                Divider(),
                                SizedBox(height: 14.v),
                                _buildAppointmentSection(),
                                SizedBox(height: 14.v),
                                Divider(),
                                SizedBox(height: 14.v),
                                _buildPaymentSection(),
                                SizedBox(height: 14.v),
                                Divider(),
                                SizedBox(height: 14.v),
                                _buildFaqsSection(),
                                SizedBox(height: 14.v),
                                Divider(),
                                SizedBox(height: 14.v),
                                _buildLogoutSection()
                              ]))
                    ])))));
  }

  /// Section Widget
  Widget _buildProfileSection() {
    return Column(children: [
      SizedBox(
          height: 82.v,
          width: 81.h,
          child: Stack(alignment: Alignment.bottomRight, children: [
            CustomImageView(
                imagePath: ImageConstant.imgEllipse27,
                height: 80.adaptSize,
                width: 80.adaptSize,
                radius: BorderRadius.circular(40.h),
                alignment: Alignment.center),
            CustomIconButton(
                height: 24.adaptSize,
                width: 24.adaptSize,
                padding: EdgeInsets.all(4.h),
                decoration: IconButtonStyleHelper.fillWhiteA,
                alignment: Alignment.bottomRight,
                onTap: () {
                  onTapBtnCamera();
                },
                child: CustomImageView(imagePath: ImageConstant.imgCamera))
          ])),
      SizedBox(height: 19.v),
      Text("lbl_amelia_renata".tr,
          style: CustomTextStyles.titleMediumWhiteA700_1)
    ]);
  }

  /// Section Widget
  Widget _buildProfileListSection() {
    return SizedBox(
        height: 75.v,
        child: Obx(() => ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 44.h),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 31.5.h),
                  child: SizedBox(
                      height: 44.v,
                      child: VerticalDivider(
                          width: 1.h,
                          thickness: 1.v,
                          color: appTheme.blue300)));
            },
            itemCount: controller
                .profileModelObj.value.profilelistsectionItemList.value.length,
            itemBuilder: (context, index) {
              ProfilelistsectionItemModel model = controller.profileModelObj
                  .value.profilelistsectionItemList.value[index];
              return ProfilelistsectionItemWidget(model);
            })));
  }

  /// Section Widget
  Widget _buildMySaveSection() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
          height: 48.v,
          width: 43.h,
          child: Stack(alignment: Alignment.center, children: [
            Align(
                alignment: Alignment.center,
                child: Container(
                    height: 48.v,
                    width: 43.h,
                    decoration: BoxDecoration(
                        color: theme.colorScheme.onErrorContainer,
                        borderRadius: BorderRadius.circular(24.h)))),
            CustomImageView(
                imagePath: ImageConstant.imgLocationPrimary,
                height: 26.v,
                width: 24.h,
                alignment: Alignment.center)
          ])),
      Padding(
          padding: EdgeInsets.only(left: 18.h, top: 17.v, bottom: 11.v),
          child:
              Text("lbl_my_saved".tr, style: CustomTextStyles.titleMedium16)),
      Spacer(),
      CustomImageView(
          imagePath: ImageConstant.imgArrowRight,
          height: 26.v,
          width: 24.h,
          margin: EdgeInsets.only(top: 11.v, bottom: 10.v))
    ]);
  }

  /// Section Widget
  Widget _buildAppointmentSection() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
          height: 48.v,
          width: 43.h,
          child: Stack(alignment: Alignment.center, children: [
            Align(
                alignment: Alignment.center,
                child: Container(
                    height: 48.v,
                    width: 43.h,
                    decoration: BoxDecoration(
                        color: theme.colorScheme.onErrorContainer,
                        borderRadius: BorderRadius.circular(24.h)))),
            CustomImageView(
                imagePath: ImageConstant.imgMenuPrimary,
                height: 26.v,
                width: 24.h,
                alignment: Alignment.center)
          ])),
      Padding(
          padding: EdgeInsets.only(left: 18.h, top: 17.v, bottom: 11.v),
          child: Text("lbl_appointmnet".tr,
              style: CustomTextStyles.titleMedium16)),
      Spacer(),
      CustomImageView(
          imagePath: ImageConstant.imgArrowRight,
          height: 26.v,
          width: 24.h,
          margin: EdgeInsets.only(top: 11.v, bottom: 10.v))
    ]);
  }

  /// Section Widget
  Widget _buildPaymentSection() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
          height: 48.v,
          width: 43.h,
          child: Stack(alignment: Alignment.center, children: [
            Align(
                alignment: Alignment.center,
                child: Container(
                    height: 48.v,
                    width: 43.h,
                    decoration: BoxDecoration(
                        color: theme.colorScheme.onErrorContainer,
                        borderRadius: BorderRadius.circular(24.h)))),
            CustomImageView(
                imagePath: ImageConstant.imgFile,
                height: 26.v,
                width: 24.h,
                alignment: Alignment.center)
          ])),
      Padding(
          padding: EdgeInsets.only(left: 18.h, top: 17.v, bottom: 11.v),
          child: Text("lbl_payment_method".tr,
              style: CustomTextStyles.titleMedium16)),
      Spacer(),
      CustomImageView(
          imagePath: ImageConstant.imgArrowRight,
          height: 26.v,
          width: 24.h,
          margin: EdgeInsets.only(top: 10.v, bottom: 11.v))
    ]);
  }

  /// Section Widget
  Widget _buildFaqsSection() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
          height: 48.v,
          width: 43.h,
          child: Stack(alignment: Alignment.center, children: [
            Align(
                alignment: Alignment.center,
                child: Container(
                    height: 48.v,
                    width: 43.h,
                    decoration: BoxDecoration(
                        color: theme.colorScheme.onErrorContainer,
                        borderRadius: BorderRadius.circular(24.h)))),
            CustomImageView(
                imagePath: ImageConstant.imgCar,
                height: 26.v,
                width: 24.h,
                alignment: Alignment.center)
          ])),
      Padding(
          padding: EdgeInsets.only(left: 18.h, top: 16.v, bottom: 12.v),
          child: Text("lbl_faqs".tr, style: CustomTextStyles.titleMedium16)),
      Spacer(),
      CustomImageView(
          imagePath: ImageConstant.imgArrowRight,
          height: 26.v,
          width: 24.h,
          margin: EdgeInsets.only(top: 11.v, bottom: 10.v))
    ]);
  }

  /// Section Widget
  Widget _buildLogoutSection() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
          height: 48.v,
          width: 43.h,
          child: Stack(alignment: Alignment.center, children: [
            Align(
                alignment: Alignment.center,
                child: Container(
                    height: 48.v,
                    width: 43.h,
                    decoration: BoxDecoration(
                        color: appTheme.red50,
                        borderRadius: BorderRadius.circular(24.h)))),
            CustomImageView(
                imagePath: ImageConstant.imgIcRoundLogout,
                height: 26.v,
                width: 24.h,
                alignment: Alignment.center)
          ])),
      Padding(
          padding: EdgeInsets.only(left: 18.h, top: 18.v, bottom: 11.v),
          child: Text("lbl_logout".tr,
              style: CustomTextStyles.titleMediumRedA200)),
      Spacer(),
      CustomImageView(
          imagePath: ImageConstant.imgArrowRight,
          height: 26.v,
          width: 24.h,
          margin: EdgeInsets.only(top: 11.v, bottom: 10.v))
    ]);
  }

  /// Requests permission to access the camera and storage, and displays a model
  /// sheet for selecting images.
  ///
  /// Throws an error if permission is denied or an error occurs while selecting images.
  onTapBtnCamera() async {
    await PermissionManager.askForPermission(Permission.camera);
    await PermissionManager.askForPermission(Permission.storage);
    List<String?>? imageList = [];
    await FileManager().showModelSheetForImage(getImages: (value) async {
      imageList = value;
    });
  }
}
