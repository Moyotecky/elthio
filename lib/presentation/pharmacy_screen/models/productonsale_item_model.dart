import '../../../core/app_export.dart';

/// This class is used in the [productonsale_item_widget] screen.
class ProductonsaleItemModel {
  ProductonsaleItemModel({
    this.oBHCombi,
    this.oBHCombi1,
    this.measurement,
    this.price,
    this.price1,
    this.id,
  }) {
    oBHCombi = oBHCombi ?? Rx(ImageConstant.imgCalciumLLysin);
    oBHCombi1 = oBHCombi1 ?? Rx("OBH Combi");
    measurement = measurement ?? Rx("75ml");
    price = price ?? Rx("9.99");
    price1 = price1 ?? Rx("10.99");
    id = id ?? Rx("");
  }

  Rx<String>? oBHCombi;

  Rx<String>? oBHCombi1;

  Rx<String>? measurement;

  Rx<String>? price;

  Rx<String>? price1;

  Rx<String>? id;
}
