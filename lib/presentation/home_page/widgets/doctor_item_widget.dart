import '../controller/home_controller.dart';
import '../models/doctor_item_model.dart';
import 'package:flutter/material.dart';
import 'package:healhio/core/app_export.dart';

// ignore: must_be_immutable
class DoctorItemWidget extends StatelessWidget {
  DoctorItemWidget(
    this.doctorItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  DoctorItemModel doctorItemModelObj;

  var controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 6.h,
        vertical: 8.v,
      ),
      decoration: AppDecoration.outlineGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 82.v,
              width: 105.h,
              margin: EdgeInsets.only(right: 1.h),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Obx(
                    () => CustomImageView(
                      imagePath: doctorItemModelObj.circleImage!.value,
                      height: 71.adaptSize,
                      width: 71.adaptSize,
                      radius: BorderRadius.circular(
                        35.h,
                      ),
                      alignment: Alignment.bottomLeft,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgStar,
                          height: 16.adaptSize,
                          width: 16.adaptSize,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 4.h),
                          child: Obx(
                            () => Text(
                              doctorItemModelObj.fortySeven!.value,
                              style:
                                  CustomTextStyles.labelLargeAmber500SemiBold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 18.v),
          Obx(
            () => Text(
              doctorItemModelObj.drMarcusHorizon!.value,
              style: CustomTextStyles.titleMediumErrorContainer,
            ),
          ),
          SizedBox(height: 9.v),
          Obx(
            () => Text(
              doctorItemModelObj.chardiologist!.value,
              style: CustomTextStyles.titleSmallGray500,
            ),
          ),
          SizedBox(height: 5.v),
          Row(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgLocation,
                height: 16.adaptSize,
                width: 16.adaptSize,
                margin: EdgeInsets.only(bottom: 4.v),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 8.h,
                  top: 3.v,
                ),
                child: Obx(
                  () => Text(
                    doctorItemModelObj.distance!.value,
                    style: CustomTextStyles.titleSmallGray500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
