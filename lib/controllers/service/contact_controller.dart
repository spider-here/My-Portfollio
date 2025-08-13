import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../data/local/local_data.dart';
import 'package:http/http.dart' as http;

class ContactController extends GetxController{
  final RxBool isSending = false.obs;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final TextEditingController organizationController = TextEditingController();

  Future<void> sendEmail() async {
    isSending.value = true;

    final Map<String, String> headers = <String, String>{
      'Content-Type': 'application/json',
      'origin': 'http://localhost'
    };

    final Map<String, dynamic> body = <String, dynamic>{
      'service_id': LocalData.emailJSServiceID,
      'template_id': LocalData.emailJSTemplateID,
      'user_id': LocalData.emailJSPublicKey,
      'template_params':<String, String>{
        'name': '${firstNameController.text} ${lastNameController.text}',
        'organization': organizationController.text,
        'email': emailController.text,
        'subject': subjectController.text,
        'message': messageController.text
      }
    };

    try{
      final Uri emailUri = Uri.parse(LocalData.emailJSUrl);
      final http.Response response = await http.post(emailUri, headers: headers, body: jsonEncode(body));
      if(response.statusCode == 200){
        Get.snackbar('Success', 'Email sent successfully');
        firstNameController.clear();
        lastNameController.clear();
        emailController.clear();
        subjectController.clear();
        messageController.clear();
        organizationController.clear();
      }
      else{
        Get.snackbar('Error', 'Failed to send email');
      }
    }
    catch (e){
      log(e.toString());
      Get.snackbar('Error', e.toString());
    }
    finally{
      isSending.value = false;
    }
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    subjectController.dispose();
    messageController.dispose();
    organizationController.dispose();
    super.onClose();
  }

}