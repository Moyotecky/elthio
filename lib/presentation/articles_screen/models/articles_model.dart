import 'frametwentyfour_item_model.dart';
import '../../../core/app_export.dart';
import 'eightynine_item_model.dart';
import 'sixtyfour_item_model.dart';

/// This class defines the variables used in the [articles_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ArticlesModel {
  Rx<List<FrametwentyfourItemModel>> frametwentyfourItemList =
      Rx(List.generate(3, (index) => FrametwentyfourItemModel()));

  Rx<List<EightynineItemModel>> eightynineItemList = Rx([
    EightynineItemModel(
        covidNineteen: ImageConstant.imgRectangle460.obs,
        covidNineteen1: "Covid-19".obs,
        comparingtheAstraZen:
            "Comparing the AstraZeneca and Sinovac COVID-19 Vaccines".obs,
        jun: "Jun 12, 2021".obs,
        time: "6 min read".obs),
    EightynineItemModel(
        covidNineteen: ImageConstant.imgRectangle458.obs,
        covidNineteen1: "Covid-19".obs,
        comparingtheAstraZen: "The Horror Of The Second Wave Of COVID-19".obs,
        jun: "Jun 10, 2021".obs,
        time: "5 min read".obs)
  ]);

  Rx<List<SixtyfourItemModel>> sixtyfourItemList = Rx([
    SixtyfourItemModel(
        image: ImageConstant.imgUnsplash86rvjm9zowy.obs,
        theHealthiest:
            "The 25 Healthiest Fruits You Can Eat, According to a Nutritionist"
                .obs,
        jun: "Jun 10, 2021 ".obs,
        time: "5min read".obs,
        image1: ImageConstant.imgBookmark12x10.obs)
  ]);
}
