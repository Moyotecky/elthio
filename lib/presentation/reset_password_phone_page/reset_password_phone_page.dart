import 'controller/reset_password_phone_controller.dart';
import 'models/reset_password_phone_model.dart';
import 'package:flutter/material.dart';
import 'package:healhio/core/app_export.dart';
import 'package:healhio/core/utils/validation_functions.dart';
import 'package:healhio/widgets/custom_elevated_button.dart';
import 'package:healhio/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ResetPasswordPhonePage extends StatelessWidget {
  ResetPasswordPhonePage({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ResetPasswordPhoneController controller =
      Get.put(ResetPasswordPhoneController(ResetPasswordPhoneModel().obs));

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
                  _buildMobileNo()
                ])))));
  }

  /// Section Widget
  Widget _buildMobileNo() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Column(children: [
          CustomTextFormField(
              controller: controller.mobileNoController,
              hintText: "lbl_1234567890".tr,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.phone,
              prefix: Container(
                  margin: EdgeInsets.fromLTRB(24.h, 16.v, 16.h, 16.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgCall,
                      height: 24.adaptSize,
                      width: 24.adaptSize)),
              prefixConstraints: BoxConstraints(maxHeight: 56.v),
              validator: (value) {
                if (!isValidPhone(value)) {
                  return "err_msg_please_enter_valid_phone_number".tr;
                }
                return null;
              },
              contentPadding:
                  EdgeInsets.only(top: 18.v, right: 30.h, bottom: 18.v)),
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
