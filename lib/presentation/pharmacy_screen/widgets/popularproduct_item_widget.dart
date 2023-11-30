import '../controller/pharmacy_controller.dart';
import '../models/popularproduct_item_model.dart';
import 'package:flutter/material.dart';
import 'package:healhio/core/app_export.dart';

// ignore: must_be_immutable
class PopularproductItemWidget extends StatelessWidget {
  PopularproductItemWidget(
    this.popularproductItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  PopularproductItemModel popularproductItemModelObj;

  var controller = Get.find<PharmacyController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 118.h,
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 6.h,
            vertical: 9.v,
          ),
          decoration: AppDecoration.outlineGray300.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder11,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 11.v),
              Obx(
                () => CustomImageView(
                  imagePath: popularproductItemModelObj.panadol!.value,
                  height: 58.v,
                  width: 56.h,
                  radius: BorderRadius.circular(
                    29.h,
                  ),
                  alignment: Alignment.center,
                ),
              ),
              SizedBox(height: 16.v),
              Padding(
                padding: EdgeInsets.only(left: 1.h),
                child: Obx(
                  () => Text(
                    popularproductItemModelObj.panadol1!.value,
                    style: theme.textTheme.titleSmall,
                  ),
                ),
              ),
              SizedBox(height: 8.v),
              Padding(
                padding: EdgeInsets.only(left: 1.h),
                child: Obx(
                  () => Text(
                    popularproductItemModelObj.pcs!.value,
                    style: theme.textTheme.labelLarge,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 1.h),
                child: Row(
                  children: [
                    Obx(
                      () => Text(
                        popularproductItemModelObj.price!.value,
                        style: CustomTextStyles.titleSmallBlack900,
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgPlus,
                      height: 18.adaptSize,
                      width: 18.adaptSize,
                      margin: EdgeInsets.only(left: 42.h),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
