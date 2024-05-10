import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController ktpController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  RxBool showNameWarning = false.obs;
  RxBool showKtpWarning = false.obs;
  RxBool showPhoneWarning = false.obs;
  RxBool showAddressWarning = false.obs;
  RxBool showPhoneNumberWarning = false.obs;
  RxBool showUsernameWarning = false.obs;
  RxBool showPasswordWarning = false.obs;
  RxBool showConfirmPasswordWarning = false.obs;

  bool get hasWarnings => showNameWarning.value ||
      showKtpWarning.value ||
      showPhoneWarning.value ||
      showAddressWarning.value ||
      showPhoneNumberWarning.value;

  bool get hasWarnings2 =>  showUsernameWarning.value ||
       showPasswordWarning.value ||
       showConfirmPasswordWarning.value;    
      

  void checkWarnings() {
    showNameWarning.value = nameController.text.isEmpty;
    showKtpWarning.value = ktpController.text.isEmpty;
    showPhoneWarning.value = phoneController.text.isEmpty;
    showAddressWarning.value = addressController.text.isEmpty;
    showUsernameWarning.value = usernameController.text.isEmpty;
    showPasswordWarning.value = passwordController.text.isEmpty;
    showConfirmPasswordWarning.value = confirmPasswordController.text.isEmpty;
  }

  @override
  void onClose() {
    nameController.dispose();
    ktpController.dispose();
    phoneController.dispose();
    addressController.dispose();
    phoneNumberController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
