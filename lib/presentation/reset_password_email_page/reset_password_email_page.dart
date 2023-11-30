import 'controller/reset_password_email_controller.dart';
import 'models/reset_password_email_model.dart';
import 'package:flutter/material.dart';
import 'package:healhio/core/app_export.dart';
import 'package:healhio/core/utils/validation_functions.dart';
import 'package:healhio/widgets/custom_elevated_button.dart';
import 'package:healhio/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ResetPasswordEmailPage extends StatelessWidget {
  ResetPasswordEmailPage({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ResetPasswordEmailController controller =
      Get.put(ResetPasswordEmailController(ResetPasswordEmailModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Column(children: [
                  SizedBox(height: 24.v),
                  _buildNinetyOne()
                ])))));
  }

  /// Section Widget
  Widget _buildNinetyOne() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Column(children: [
          CustomTextFormField(
              controller: controller.emailController,
              hintText: "lbl_xyz_gmail_com".tr,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.emailAddress,
              prefix: Container(
                  margin: EdgeInsets.fromLTRB(24.h, 16.v, 16.h, 16.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgClock,
                      height: 24.adaptSize,
                      width: 24.adaptSize)),
              prefixConstraints: BoxConstraints(maxHeight: 56.v),
              suffix: Container(
                  margin: EdgeInsets.fromLTRB(30.h, 20.v, 24.h, 20.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgCheckmarkGreen600,
                      height: 16.adaptSize,
                      width: 16.adaptSize)),
              suffixConstraints: BoxConstraints(maxHeight: 56.v),
              validator: (value) {
                if (value == null || (!isValidEmail(value, isRequired: true))) {
                  return "err_msg_please_enter_valid_email".tr;
                }
                return null;
              }),
          SizedBox(height: 32.v),
          CustomElevatedButton(
              text: "lbl_send_otp".tr,
              onPressed: () {
                onTapSendOTP();
              })
        ]));
  }

  /// Navigates to the resetPasswordVerifyCodeScreen when the action is triggered.
  onTapSendOTP() {
    Get.toNamed(
      AppRoutes.resetPasswordVerifyCodeScreen,
    );
  }
}
