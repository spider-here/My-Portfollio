import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ContactController extends GetxController{
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final TextEditingController organizationController = TextEditingController();


  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    subjectController.dispose();
    messageController.dispose();
    organizationController.dispose();
    super.onClose();
  }

}