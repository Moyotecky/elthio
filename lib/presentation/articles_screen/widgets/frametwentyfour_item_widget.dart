import '../models/frametwentyfour_item_model.dart';
import 'package:flutter/material.dart';
import 'package:healhio/core/app_export.dart';

// ignore: must_be_immutable
class FrametwentyfourItemWidget extends StatelessWidget {
  FrametwentyfourItemWidget(
    this.frametwentyfourItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  FrametwentyfourItemModel frametwentyfourItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RawChip(
        padding: EdgeInsets.symmetric(
          horizontal: 17.h,
          vertical: 16.v,
        ),
        showCheckmark: false,
        labelPadding: EdgeInsets.zero,
        label: Text(
          frametwentyfourItemModelObj.covidNineteen!.value,
          style: TextStyle(
            color: appTheme.whiteA700,
            fontSize: 14.fSize,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w600,
          ),
        ),
        selected: (frametwentyfourItemModelObj.isSelected?.value ?? false),
        backgroundColor: theme.colorScheme.primary,
        selectedColor: theme.colorScheme.primary,
        shape: (frametwentyfourItemModelObj.isSelected?.value ?? false)
            ? RoundedRectangleBorder(
                side: BorderSide(
                  color: appTheme.whiteA700.withOpacity(0.6),
                  width: 1.h,
                ),
                borderRadius: BorderRadius.circular(
                  10.h,
                ),
              )
            : RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(
                  10.h,
                ),
              ),
        onSelected: (value) {
          frametwentyfourItemModelObj.isSelected!.value = value;
        },
      ),
    );
  }
}
