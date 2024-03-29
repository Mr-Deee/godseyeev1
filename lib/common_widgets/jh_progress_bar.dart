import 'package:flutter/material.dart';

import '../theme/theme.dart';

class JHCustomProgressBar extends StatelessWidget {
  const JHCustomProgressBar({
    required this.progress,
    Key? key,
  }) : super(key: key);
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(5),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: progress,
        child: Container(
          decoration: BoxDecoration(
            color: CustomColors.greenPrimary,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    ).hP8;
  }
}
