import 'controller/create_new_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:healhio/core/app_export.dart';
import 'package:healhio/core/utils/validation_functions.dart';
import 'package:healhio/widgets/app_bar/appbar_leading_image.dart';
import 'package:healhio/widgets/app_bar/custom_app_bar.dart';
import 'package:healhio/widgets/custom_elevated_button.dart';
import 'package:healhio/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class CreateNewPasswordScreen extends GetWidget<CreateNewPasswordController> {
  CreateNewPasswordScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.h, vertical: 42.v),
                    child: Column(children: [
                      _buildTitle(),
                      SizedBox(height: 24.v),
                      Obx(() => CustomTextFormField(
                          controller: controller.newpasswordController,
                          hintText: "msg_enter_new_password".tr,
                          textInputType: TextInputType.visiblePassword,
                          prefix: Container(
                              margin:
                                  EdgeInsets.fromLTRB(24.h, 16.v, 16.h, 16.v),
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgLock,
                                  height: 24.adaptSize,
                                  width: 24.adaptSize)),
                          prefixConstraints: BoxConstraints(maxHeight: 56.v),
                          suffix: InkWell(
                              onTap: () {
                                controller.isShowPassword.value =
                                    !controller.isShowPassword.value;
                              },
                              child: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      12.h, 16.v, 24.h, 16.v),
                                  child: CustomImageView(
                                      imagePath:
                                          ImageConstant.imgCheckmarkGray500,
                                      height: 24.adaptSize,
                                      width: 24.adaptSize))),
                          suffixConstraints: BoxConstraints(maxHeight: 56.v),
                          validator: (value) {
                            if (value == null ||
                                (!isValidPassword(value, isRequired: true))) {
                              return "err_msg_please_enter_valid_password".tr;
                            }
                            return null;
                          },
                          obscureText: controller.isShowPassword.value)),
                      SizedBox(height: 16.v),
                      Obx(() => CustomTextFormField(
                          controller: controller.confirmpasswordController,
                          hintText: "msg_confirm_password".tr,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.visiblePassword,
                          prefix: Container(
                              margin:
                                  EdgeInsets.fromLTRB(24.h, 16.v, 16.h, 16.v),
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgLock,
                                  height: 24.adaptSize,
                                  width: 24.adaptSize)),
                          prefixConstraints: BoxConstraints(maxHeight: 56.v),
                          suffix: InkWell(
                              onTap: () {
                                controller.isShowPassword1.value =
                                    !controller.isShowPassword1.value;
                              },
                              child: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      30.h, 16.v, 24.h, 16.v),
                                  child: CustomImageView(
                                      imagePath:
                                          ImageConstant.imgCheckmarkGray500,
                                      height: 24.adaptSize,
                                      width: 24.adaptSize))),
                          suffixConstraints: BoxConstraints(maxHeight: 56.v),
                          validator: (value) {
                            if (value == null ||
                                (!isValidPassword(value, isRequired: true))) {
                              return "err_msg_please_enter_valid_password".tr;
                            }
                            return null;
                          },
                          obscureText: controller.isShowPassword1.value)),
                      SizedBox(height: 24.v),
                      CustomElevatedButton(
                          text: "lbl_create_password".tr,
                          onPressed: () {
                            onTapCreatePassword();
                          }),
                      SizedBox(height: 5.v)
                    ])))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: double.maxFinite,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 24.h, right: 311.h),
            onTap: () {
              onTapArrowLeft();
            }));
  }

  /// Section Widget
  Widget _buildTitle() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("msg_create_new_password".tr, style: theme.textTheme.headlineSmall),
      SizedBox(height: 12.v),
      Text("msg_create_your_new".tr, style: CustomTextStyles.titleMediumGray500)
    ]);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }

  onTapCreatePassword() {
    // TODO: implement Actions
  }
}
