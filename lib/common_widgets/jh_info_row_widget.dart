import 'package:flutter/material.dart';
import 'package:godseyeev1/common_widgets/show_bottom_sheet.dart';

import '../theme/theme.dart';
import '../utils/data.dart';
import 'jh_display_text.dart';
import 'jh_info_bottom_sheet.dart';
import 'jh_info_box.dart';

class JHInfoRow extends StatelessWidget {
  const JHInfoRow({
    required this.icon_1,
    required this.icon_2,
    required this.dataOne,
    required this.dataTwo,
    required this.animationController,
    Key? key,
  }) : super(key: key);
  final IconData icon_1;
  final IconData icon_2;
  final InfoData dataOne;
  final InfoData dataTwo;
  final AnimationController animationController;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: InfoBox(
            onPress: () => showCustomBottomSheet(
              context,
              animationController: animationController,
              child: JHBottomSheet(
                message: dataOne.content,
              ),
            ),
            icon: icon_1,
            iconColor: CustomColors.indigoDark,
            child: JHDisplayText(
              text: dataOne.title,
              fontSize: 12,
              style: TextStyle(
                color: Colors.grey.shade500,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: InfoBox(
            onPress: () => showCustomBottomSheet(
              context,
              animationController: animationController,
              child: JHBottomSheet(message: dataTwo.content),
            ),
            icon: icon_2,
            iconColor: CustomColors.indigoDark,
            child: JHDisplayText(
              text: dataTwo.title,
              fontSize: 12,
              style: TextStyle(
                color: Colors.grey.shade500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
