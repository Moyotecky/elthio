import 'package:healhio/core/app_export.dart';
import 'package:healhio/presentation/location_screen/models/location_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the LocationScreen.
///
/// This class manages the state of the LocationScreen, including the
/// current locationModelObj
class LocationController extends GetxController {
  TextEditingController searchController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  Rx<LocationModel> locationModelObj = LocationModel().obs;

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
    addressController.dispose();
  }
}
