import 'package:flutter/material.dart';

import 'other_profiles.dart';

class DefaultPageBody extends Row {
  DefaultPageBody({super.key, List<Widget>? children})
      : super(children: [OtherProfiles(), if (children != null) ...children]);
}
