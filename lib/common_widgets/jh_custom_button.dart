import 'package:flutter/material.dart';
import 'package:godseyeev1/theme/theme.dart';

import 'jh_display_text.dart';
import 'jh_size_config.dart';

class JHCustomButton extends StatelessWidget {
  const JHCustomButton({
    required this.backgroundColor,
    required this.onPress,
    required this.title,
    Key? key,
    this.borderColor = Colors.transparent,
    this.textColor = Colors.white,
  }) : super(key: key);
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final void Function() onPress;
  final String title;

  @override
  Widget build(BuildContext context) {
    JHSizeConfig().init(context);
    return Center(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          side: BorderSide(width: 1.5, color: borderColor),
          minimumSize: Size(
            MediaQuery.of(context).size.width * 0.95,
            JHSizeConfig.screenHeight! * 0.07,
          ),
        ),
        onPressed: onPress,
        child: JHDisplayText(
          text: title,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(13),
            color: textColor,
          ),
        ),
      ),
    ).p4;
  }
}
