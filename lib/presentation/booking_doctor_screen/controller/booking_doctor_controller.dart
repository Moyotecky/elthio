import 'package:healhio/core/app_export.dart';
import 'package:healhio/presentation/booking_doctor_screen/models/booking_doctor_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the BookingDoctorScreen.
///
/// This class manages the state of the BookingDoctorScreen, including the
/// current bookingDoctorModelObj
class BookingDoctorController extends GetxController {
  TextEditingController shareController = TextEditingController();

  Rx<BookingDoctorModel> bookingDoctorModelObj = BookingDoctorModel().obs;

  @override
  void onClose() {
    super.onClose();
    shareController.dispose();
  }
}
