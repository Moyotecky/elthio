import '../../../core/app_export.dart';
import 'mycart_item_model.dart';

/// This class defines the variables used in the [my_cart_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class MyCartModel {
  Rx<List<MycartItemModel>> mycartItemList = Rx([
    MycartItemModel(
        oBHCombi: ImageConstant.imgHealthvitLLys50x50.obs,
        oBHCombi1: "OBH Combi".obs,
        measurement: "75ml".obs,
        one: "1".obs,
        price: "9.99".obs)
  ]);
}
