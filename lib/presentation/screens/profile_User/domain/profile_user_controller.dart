import 'package:FOODSTAR/domain/models/UserModel.dart';
import 'package:FOODSTAR/internal/Utils/authentication_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProfileUserController extends GetxController {
  late Rxn<UserModel?> currentUser;
  final email = TextEditingController().obs;
  final name = TextEditingController().obs;
  final phone = TextEditingController().obs;
  final dateOfbirth = TextEditingController().obs;
  final enableEditProfile = false.obs;

  @override
  void onInit() {
    currentUser = AuthenticationRepository.instance.currentUser;
    ever(currentUser, (_) {
      email.value.text = currentUser.value?.email ?? '';
      name.value.text = currentUser.value?.name ?? '';
      phone.value.text = currentUser.value?.phone ?? '';
      dateOfbirth.value.text = currentUser.value?.dateOfbirth ?? '';
      update();
    });
    readingUserInformation();
    super.onInit();
  }

  void readingUserInformation() {
    AuthenticationRepository.instance.initAuth();
    currentUser = AuthenticationRepository.instance.currentUser;
    email.value.text = currentUser.value?.email ?? '';
    name.value.text = currentUser.value?.name ?? '';
    phone.value.text = currentUser.value?.phone ?? '';
    dateOfbirth.value.text = currentUser.value?.dateOfbirth ?? '';
    update();
  }

  void editProfile() {
    enableEditProfile.value = !enableEditProfile.value;
    update();
  }

  updateUser(UserModel user) async {
    await AuthenticationRepository.instance.updateUser(user);
  }

  void signOut() {
    AuthenticationRepository.instance.signOutController();
  }
}
