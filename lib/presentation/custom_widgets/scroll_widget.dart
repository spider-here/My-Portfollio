import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zakwan_ali_portfolio/utils/extensions/responsive_context.dart';

class ScrollWidget extends StatelessWidget {
  final VoidCallback onClick;
  final bool scrollDown;

  const ScrollWidget(
      {super.key, required this.onClick, required this.scrollDown});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.designInsetLTRB(
          scrollDown ? 185.0 : 0.0,
          scrollDown ? 0.0 : 100.0,
          scrollDown ? 0.0 : 100.0,
          scrollDown ? 50.0 : 0.0),
      child: InkWell(
        onTap: onClick,
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          color: context.theme.scaffoldBackgroundColor,
          padding:
              context.designInsetSymmetric(vertical: 6.0, horizontal: 10.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.mouse_outlined,
                size: 16.0,
                color: context.textTheme.bodySmall?.color,
              ),
              const Padding(padding: EdgeInsets.only(left: 5.0)),
              Text(
                scrollDown ? 'Scroll down' : 'Scroll to top',
                style: context.textTheme.bodySmall,
              ),
              const Padding(padding: EdgeInsets.only(left: 5.0)),
              scrollDown
                  ? Icon(Icons.arrow_downward_rounded,
                      size: 16.0, color: context.textTheme.bodySmall?.color)
                  : Icon(Icons.arrow_upward_rounded,
                      size: 16.0, color: context.textTheme.bodySmall?.color),
            ],
          ),
        ),
      ),
    );
  }
}
