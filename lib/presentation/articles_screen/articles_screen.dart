import '../articles_screen/widgets/eightynine_item_widget.dart';
import '../articles_screen/widgets/frametwentyfour_item_widget.dart';
import '../articles_screen/widgets/sixtyfour_item_widget.dart';
import 'controller/articles_controller.dart';
import 'models/eightynine_item_model.dart';
import 'models/frametwentyfour_item_model.dart';
import 'models/sixtyfour_item_model.dart';
import 'package:flutter/material.dart';
import 'package:healhio/core/app_export.dart';
import 'package:healhio/widgets/app_bar/appbar_leading_image.dart';
import 'package:healhio/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:healhio/widgets/app_bar/appbar_trailing_image.dart';
import 'package:healhio/widgets/app_bar/custom_app_bar.dart';
import 'package:healhio/widgets/custom_search_view.dart';

class ArticlesScreen extends GetWidget<ArticlesController> {
  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(),
            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 24.v),
                    child: Padding(
                        padding: EdgeInsets.only(left: 20.h),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: 4.h, right: 24.h),
                                  child: CustomSearchView(
                                      controller: controller.searchController,
                                      hintText: "msg_search_articles".tr)),
                              SizedBox(height: 28.v),
                              _buildPopularArticles(),
                              SizedBox(height: 27.v),
                              _buildTrendingArticles(),
                              SizedBox(height: 26.v),
                              _buildRelatedArticles()
                            ]))))));
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
        title: AppbarSubtitleOne(text: "lbl_articles".tr),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgOverflowMenu,
              margin: EdgeInsets.symmetric(horizontal: 16.h),
              onTap: () {
                onTapOverflowMenu();
              })
        ]);
  }

  /// Section Widget
  Widget _buildPopularArticles() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 4.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("msg_popular_articles".tr,
              style: CustomTextStyles.titleMedium16),
          SizedBox(height: 10.v),
          Obx(() => Wrap(
              runSpacing: 5.v,
              spacing: 5.h,
              children: List<Widget>.generate(
                  controller.articlesModelObj.value.frametwentyfourItemList
                      .value.length, (index) {
                FrametwentyfourItemModel model = controller.articlesModelObj
                    .value.frametwentyfourItemList.value[index];
                return FrametwentyfourItemWidget(model);
              })))
        ]));
  }

  /// Section Widget
  Widget _buildTrendingArticles() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(left: 4.h, right: 24.h),
          child: _buildSixtyOne(
              relatedArticlesText: "msg_trending_articles".tr,
              seeAllText: "lbl_see_all".tr)),
      SizedBox(height: 10.v),
      Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
              height: 219.v,
              child: Obx(() => ListView.separated(
                  padding: EdgeInsets.only(left: 4.h),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 15.h);
                  },
                  itemCount: controller
                      .articlesModelObj.value.eightynineItemList.value.length,
                  itemBuilder: (context, index) {
                    EightynineItemModel model = controller
                        .articlesModelObj.value.eightynineItemList.value[index];
                    return EightynineItemWidget(model);
                  }))))
    ]);
  }

  /// Section Widget
  Widget _buildRelatedArticles() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(left: 4.h, right: 24.h),
          child: _buildSixtyOne(
              relatedArticlesText: "msg_related_articles".tr,
              seeAllText: "lbl_see_all".tr)),
      SizedBox(height: 12.v),
      Padding(
          padding: EdgeInsets.only(right: 20.h),
          child: Obx(() => ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(height: 10.v);
              },
              itemCount: controller
                  .articlesModelObj.value.sixtyfourItemList.value.length,
              itemBuilder: (context, index) {
                SixtyfourItemModel model = controller
                    .articlesModelObj.value.sixtyfourItemList.value[index];
                return SixtyfourItemWidget(model);
              })))
    ]);
  }

  /// Common widget
  Widget _buildSixtyOne({
    required String relatedArticlesText,
    required String seeAllText,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(relatedArticlesText,
          style: CustomTextStyles.titleMediumBlack900
              .copyWith(color: appTheme.black900)),
      Padding(
          padding: EdgeInsets.only(bottom: 3.v),
          child: Text(seeAllText,
              style: CustomTextStyles.labelLargePrimary_1
                  .copyWith(color: theme.colorScheme.primary)))
    ]);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }

  /// Navigates to the homeContainerScreen when the action is triggered.
  onTapOverflowMenu() {
    Get.toNamed(
      AppRoutes.homeContainerScreen,
    );
  }
}
