import 'package:flutter/material.dart';

class ScrollWidget extends StatelessWidget{
  final VoidCallback onClick;
  final bool scrollDown;
  const ScrollWidget({super.key, required this.onClick, required this.scrollDown});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      borderRadius: BorderRadius.circular(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.mouse_outlined, size: 16.0, color: Theme.of(context).textTheme.bodySmall?.color,),
          const Padding(padding: EdgeInsets.only(left: 5.0)),
          Text(scrollDown ? 'Scroll down' : 'Scroll to top', style: Theme.of(context).textTheme.bodySmall,),
          const Padding(padding: EdgeInsets.only(left: 5.0)),
          scrollDown ? Icon(Icons.arrow_downward_rounded, size: 16.0, color: Theme.of(context).textTheme.bodySmall?.color)
          : Icon(Icons.arrow_upward_rounded, size: 16.0, color: Theme.of(context).textTheme.bodySmall?.color),
        ],
      ),
    );
  }

}