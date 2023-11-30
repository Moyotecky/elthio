import '../../../core/app_export.dart';
import 'popularproduct_item_model.dart';
import 'productonsale_item_model.dart';

/// This class defines the variables used in the [pharmacy_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class PharmacyModel {
  Rx<List<PopularproductItemModel>> popularproductItemList = Rx([
    PopularproductItemModel(
        panadol: ImageConstant.imgEf58faa9a71e47e.obs,
        panadol1: "Panadol".obs,
        pcs: "20pcs".obs,
        price: "15.99".obs),
    PopularproductItemModel(
        panadol1: "Bodrex Herbal".obs, pcs: "100ml".obs, price: "7.99".obs),
    PopularproductItemModel(
        panadol1: "Konidin".obs, pcs: "3pcs".obs, price: "5.99".obs)
  ]);

  Rx<List<ProductonsaleItemModel>> productonsaleItemList = Rx([
    ProductonsaleItemModel(
        oBHCombi: ImageConstant.imgCalciumLLysin.obs,
        oBHCombi1: "OBH Combi".obs,
        measurement: "75ml".obs,
        price: "9.99".obs,
        price1: "10.99".obs),
    ProductonsaleItemModel(oBHCombi1: "Betadine".obs, measurement: "50ml".obs),
    ProductonsaleItemModel(
        oBHCombi1: "Bodrexin".obs,
        measurement: "75ml".obs,
        price: "7.99".obs,
        price1: "8.99".obs)
  ]);
}
