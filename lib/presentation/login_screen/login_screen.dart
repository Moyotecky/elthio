import 'controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:healhio/core/app_export.dart';
import 'package:healhio/core/utils/validation_functions.dart';
import 'package:healhio/widgets/app_bar/appbar_leading_image.dart';
import 'package:healhio/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:healhio/widgets/app_bar/custom_app_bar.dart';
import 'package:healhio/widgets/custom_elevated_button.dart';
import 'package:healhio/widgets/custom_outlined_button.dart';
import 'package:healhio/widgets/custom_text_form_field.dart';
import 'package:healhio/domain/googleauth/google_auth_helper.dart';
import 'package:healhio/domain/facebookauth/facebook_auth_helper.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends GetWidget<LoginController> {
  LoginScreen({Key? key}) : super(key: key);

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
                        EdgeInsets.symmetric(horizontal: 24.h, vertical: 40.v),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextFormField(
                              controller: controller.emailController,
                              hintText: "msg_enter_your_email".tr,
                              textInputType: TextInputType.emailAddress,
                              prefix: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      24.h, 16.v, 16.h, 16.v),
                                  child: CustomImageView(
                                      imagePath: ImageConstant.imgCheckmark,
                                      height: 24.adaptSize,
                                      width: 24.adaptSize)),
                              prefixConstraints:
                                  BoxConstraints(maxHeight: 56.v),
                              validator: (value) {
                                if (value == null ||
                                    (!isValidEmail(value, isRequired: true))) {
                                  return "err_msg_please_enter_valid_email".tr;
                                }
                                return null;
                              },
                              contentPadding: EdgeInsets.only(
                                  top: 18.v, right: 12.h, bottom: 18.v)),
                          SizedBox(height: 16.v),
                          Obx(() => CustomTextFormField(
                              controller: controller.passwordController,
                              hintText: "msg_enter_your_password".tr,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.visiblePassword,
                              prefix: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      24.h, 16.v, 16.h, 16.v),
                                  child: CustomImageView(
                                      imagePath: ImageConstant.imgLock,
                                      height: 24.adaptSize,
                                      width: 24.adaptSize)),
                              prefixConstraints:
                                  BoxConstraints(maxHeight: 56.v),
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
                              suffixConstraints:
                                  BoxConstraints(maxHeight: 56.v),
                              validator: (value) {
                                if (value == null ||
                                    (!isValidPassword(value,
                                        isRequired: true))) {
                                  return "err_msg_please_enter_valid_password"
                                      .tr;
                                }
                                return null;
                              },
                              obscureText: controller.isShowPassword.value)),
                          SizedBox(height: 10.v),
                          Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                  onTap: () {
                                    onTapTxtForgotPassword();
                                  },
                                  child: Text("msg_forgot_password".tr,
                                      style:
                                          CustomTextStyles.titleSmallPrimary))),
                          SizedBox(height: 32.v),
                          CustomElevatedButton(
                              text: "lbl_login".tr,
                              onPressed: () {
                                onTapLogin();
                              }),
                          SizedBox(height: 25.v),
                          Padding(
                              padding: EdgeInsets.only(left: 48.h),
                              child: Row(children: [
                                Padding(
                                    padding: EdgeInsets.only(bottom: 1.v),
                                    child: Text("msg_don_t_have_an_account".tr,
                                        style: CustomTextStyles
                                            .bodyMediumGray600)),
                                GestureDetector(
                                    onTap: () {
                                      onTapTxtSignUp();
                                    },
                                    child: Padding(
                                        padding: EdgeInsets.only(left: 4.h),
                                        child: Text("lbl_sign_up".tr,
                                            style: CustomTextStyles
                                                .titleSmallPrimary_1)))
                              ])),
                          SizedBox(height: 34.v),
                          _buildORDivider(),
                          SizedBox(height: 29.v),
                          _buildSocial(),
                          SizedBox(height: 5.v)
                        ])))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 64.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 24.h),
            onTap: () {
              onTapArrowLeft();
            }),
        centerTitle: true,
        title: AppbarSubtitleTwo(text: "lbl_login".tr));
  }

  /// Section Widget
  Widget _buildORDivider() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(top: 8.v, bottom: 9.v),
              child: SizedBox(width: 137.h, child: Divider())),
          Text("lbl_or".tr, style: theme.textTheme.bodyLarge),
          Padding(
              padding: EdgeInsets.only(top: 8.v, bottom: 9.v),
              child: SizedBox(width: 137.h, child: Divider()))
        ]);
  }

  /// Section Widget
  Widget _buildSocial() {
    return Column(children: [
      CustomOutlinedButton(
          text: "msg_sign_in_with_google".tr,
          leftIcon: Container(
              margin: EdgeInsets.only(right: 30.h),
              child: CustomImageView(
                  imagePath: ImageConstant.imgGoogle,
                  height: 20.v,
                  width: 19.h)),
          onPressed: () {
            onTapSignInWithGoogle();
          }),
      SizedBox(height: 16.v),
      CustomOutlinedButton(
          text: "msg_sign_in_with_apple".tr,
          leftIcon: Container(
              margin: EdgeInsets.only(right: 30.h),
              child: CustomImageView(
                  imagePath: ImageConstant.imgApple,
                  height: 20.v,
                  width: 16.h))),
      SizedBox(height: 16.v),
      CustomOutlinedButton(
          text: "msg_sign_in_with_facebook".tr,
          leftIcon: Container(
              padding: EdgeInsets.fromLTRB(7.h, 4.v, 6.h, 4.v),
              margin: EdgeInsets.only(right: 30.h),
              decoration: BoxDecoration(
                  color: appTheme.blue600,
                  borderRadius: BorderRadius.circular(10.h)),
              child: CustomImageView(
                  imagePath: ImageConstant.imgFacebook,
                  height: 11.v,
                  width: 6.h)),
          onPressed: () {
            onTapSignInWithFacebook();
          })
    ]);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }

  /// Navigates to the resetPasswordEmailTabContainerScreen when the action is triggered.
  onTapTxtForgotPassword() {
    Get.toNamed(
      AppRoutes.resetPasswordEmailTabContainerScreen,
    );
  }

  onTapLogin() {
    // TODO: implement Actions
  }

  /// Navigates to the signUpScreen when the action is triggered.
  onTapTxtSignUp() {
    Get.toNamed(
      AppRoutes.signUpScreen,
    );
  }

  /// Performs a Google sign-in and returns a [GoogleUser] object.
  ///
  /// If the sign-in is successful, the [onSuccess] callback will be called with
  /// a TODO comment needed to be modified by you.
  /// If the sign-in fails, the [onError] callback will be called with the error message.
  ///
  /// Throws an exception if the Google sign-in process fails.
  onTapSignInWithGoogle() async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
        //TODO Actions to be performed after signin
      } else {
        Get.snackbar('Error', 'user data is empty');
      }
    }).catchError((onError) {
      Get.snackbar('Error', onError.toString());
    });
  }

  /// Performs a Facebook sign-in and returns a [FacebookUser] object.
  ///
  /// If the sign-in is successful, the [onSuccess] callback will be called with
  /// a TODO comment needed to be modified by you.
  /// If the sign-in fails, the [onError] callback will be called with the error message.
  ///
  /// Throws an exception if the Facebook sign-in process fails.
  onTapSignInWithFacebook() async {
    await FacebookAuthHelper().facebookSignInProcess().then((facebookUser) {
      //TODO Actions to be performed after signin
    }).catchError((onError) {
      Get.snackbar('Error', onError.toString());
    });
  }
}
