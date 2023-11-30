import '../pharmacy_screen/widgets/popularproduct_item_widget.dart';
import '../pharmacy_screen/widgets/productonsale_item_widget.dart';
import 'controller/pharmacy_controller.dart';
import 'dart:async';
import 'models/popularproduct_item_model.dart';
import 'models/productonsale_item_model.dart';
import 'package:flutter/material.dart';
import 'package:healhio/core/app_export.dart';
import 'package:healhio/widgets/app_bar/appbar_leading_image.dart';
import 'package:healhio/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:healhio/widgets/app_bar/appbar_trailing_image.dart';
import 'package:healhio/widgets/app_bar/custom_app_bar.dart';
import 'package:healhio/widgets/custom_search_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore_for_file: must_be_immutable
class PharmacyScreen extends GetWidget<PharmacyController> {
  PharmacyScreen({Key? key}) : super(key: key);

  Completer<WebViewController> webViewController =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 24.v),
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.h),
                      child: CustomSearchView(
                          controller: controller.searchController,
                          hintText: "msg_search_drugs_category".tr)),
                  SizedBox(height: 24.v),
                  _buildCta(),
                  SizedBox(height: 27.v),
                  _buildPopularProduct(),
                  SizedBox(height: 26.v),
                  _buildProductOnSale(),
                  SizedBox(height: 5.v)
                ]))));
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
        title: AppbarSubtitleOne(text: "lbl_pharmacy".tr),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgCart,
              margin: EdgeInsets.fromLTRB(24.h, 9.v, 24.h, 7.v))
        ]);
  }

  /// Section Widget
  Widget _buildCta() {
    return SizedBox(
        height: 135.v,
        width: 335.h,
        child: WebView(
            initialUrl: 'https://flutter.dev',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController controller) {
              webViewController.complete(controller);
            },
            onProgress: (int progress) {
              print("WebView is loading (progress : $progress%)");
            },
            onPageStarted: (String url) {
              print("Page started loading: $url");
            },
            onPageFinished: (String url) {
              print("Page finished loading: $url");
            }));
  }

  /// Section Widget
  Widget _buildPopularProduct() {
    return Align(
        alignment: Alignment.centerRight,
        child: Padding(
            padding: EdgeInsets.only(left: 21.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                  padding: EdgeInsets.only(right: 24.h),
                  child: _buildHeader(
                      productOnSale: "lbl_popular_product".tr,
                      seeAll: "lbl_see_all".tr)),
              SizedBox(height: 10.v),
              Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                      height: 165.v,
                      child: Obx(() => ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) {
                            return SizedBox(width: 21.h);
                          },
                          itemCount: controller.pharmacyModelObj.value
                              .popularproductItemList.value.length,
                          itemBuilder: (context, index) {
                            PopularproductItemModel model = controller
                                .pharmacyModelObj
                                .value
                                .popularproductItemList
                                .value[index];
                            return PopularproductItemWidget(model);
                          }))))
            ])));
  }

  /// Section Widget
  Widget _buildProductOnSale() {
    return Align(
        alignment: Alignment.centerRight,
        child: Padding(
            padding: EdgeInsets.only(left: 21.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                  padding: EdgeInsets.only(right: 24.h),
                  child: _buildHeader(
                      productOnSale: "lbl_product_on_sale".tr,
                      seeAll: "lbl_see_all".tr)),
              SizedBox(height: 12.v),
              Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                      height: 165.v,
                      child: Obx(() => ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) {
                            return SizedBox(width: 17.h);
                          },
                          itemCount: controller.pharmacyModelObj.value
                              .productonsaleItemList.value.length,
                          itemBuilder: (context, index) {
                            ProductonsaleItemModel model = controller
                                .pharmacyModelObj
                                .value
                                .productonsaleItemList
                                .value[index];
                            return ProductonsaleItemWidget(model);
                          }))))
            ])));
  }

  /// Common widget
  Widget _buildHeader({
    required String productOnSale,
    required String seeAll,
  }) {
    return Row(children: [
      Text(productOnSale,
          style: CustomTextStyles.titleMedium16
              .copyWith(color: theme.colorScheme.onPrimary)),
      Padding(
          padding: EdgeInsets.only(left: 170.h, bottom: 3.v),
          child: Text(seeAll,
              style: CustomTextStyles.labelLargePrimary_1
                  .copyWith(color: theme.colorScheme.primary)))
    ]);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
