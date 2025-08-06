import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zakwan_ali_portfolio/globals.dart';
import 'package:zakwan_ali_portfolio/presentation/custom_widgets/app_elevated_button.dart';
import 'package:zakwan_ali_portfolio/presentation/custom_widgets/app_text_area.dart';
import 'package:zakwan_ali_portfolio/presentation/custom_widgets/app_text_field.dart';
import 'package:zakwan_ali_portfolio/presentation/custom_widgets/footer.dart';
import 'package:zakwan_ali_portfolio/presentation/custom_widgets/space_box.dart';
import 'package:zakwan_ali_portfolio/utils/extensions/responsive_context.dart';
import '../../../../controllers/presentation/contact_controller.dart';
import '../../../creatives/app_colors.dart';
import '../../../custom_widgets/default_page_body.dart';
import '../../../custom_widgets/default_page_scaffold.dart';
import '../../../custom_widgets/page_title.dart';

class DContact extends StatelessWidget {
  final ContactController _contactC = Get.find<ContactController>();
  final GlobalKey<FormState> _contactFormKey = GlobalKey<FormState>();

  DContact({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultPageScaffold(
      body: DefaultPageBody(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: context.widthFromDesign(900.0),
            child: Form(
              key: _contactFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  PageTitle(context: context, text: 'Contact me'),
                  const SpaceBox(space: 50.0,
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: AppTextField(
                          controller: _contactC.firstNameController,
                          label: 'First Name',
                          validator: Globals.validateName,
                        ),
                      ),
                      const SpaceBox.horizontal(space: 16.0,
                      ),
                      Flexible(
                        child: AppTextField(
                          controller: _contactC.lastNameController,
                          label: ' Last Name',
                          validator: Globals.validateName,
                        ),
                      ),
                    ],
                  ),
                  const SpaceBox(space: 16.0,
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: AppTextField(
                          controller: _contactC.emailController,
                          label: 'Email',
                        ),
                      ),
                      const SpaceBox.horizontal(space: 16.0,
                      ),
                      Flexible(
                        child: AppTextField(
                          controller: _contactC.organizationController,
                          label: 'Organization',
                        ),
                      ),
                    ],
                  ),
                  const SpaceBox(space: 16.0,
                  ),
                  AppTextField(
                    controller: _contactC.subjectController,
                    label: 'Subject',
                  ),
                  const SpaceBox(space: 16.0,
                  ),
                  Expanded(child: AppTextArea(controller: _contactC.messageController)),
                  const SpaceBox(space: 32.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      AppElevatedButton(
                          onClick: () {
                            _contactFormKey.currentState?.validate();
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                'Send',
                                style: context.textTheme.bodySmall?.copyWith(
                                    color: primaryTextDark,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SpaceBox.horizontal(space: 10.0),
                              Icon(
                                Icons.send_outlined,
                                size: 14.0,
                                color: primaryTextDark,
                              )
                            ],
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      footer: const Footer()
    );
  }
}
