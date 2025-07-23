import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zakwan_ali_portfolio/presentation/custom_widgets/app_text_area.dart';
import 'package:zakwan_ali_portfolio/presentation/custom_widgets/app_text_field.dart';
import '../../../../controllers/presentation/contact_controller.dart';
import '../../../../controllers/presentation/pages_controller.dart';
import '../../../custom_widgets/default_page_body.dart';
import '../../../custom_widgets/default_page_scaffold.dart';
import '../../../custom_widgets/page_title.dart';

class DContact extends StatelessWidget {
  final PagesController _pagesC = Get.find<PagesController>();
  final ContactController _contactC = Get.find<ContactController>();


  DContact({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultPageScaffold(
      body: DefaultPageBody(
        children: [
          const Padding(padding: EdgeInsets.only(left: 50.0)),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 100.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PageTitle(context: context, text: 'Contact me'),
                  const SizedBox(
                    height: 50.0,
                  ),
                  AppTextField(controller: _contactC.nameController, label: 'Name',),
                  const SizedBox(
                    height: 24.0,
                  ),
                  AppTextField(controller: _contactC.emailController, label: 'Email',),
                  const SizedBox(
                    height: 24.0,
                  ),
                  AppTextField(controller: _contactC.organizationController, label: 'Organization',),
                  const SizedBox(
                    height: 24.0,
                  ),
                  AppTextField(controller: _contactC.subjectController, label: 'Subject',),
                  const SizedBox(
                    height: 24.0,
                  ),
                  AppTextArea(controller: _contactC.messageController)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
