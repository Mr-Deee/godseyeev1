import 'package:flutter/material.dart';

import '../theme/theme.dart';
import 'jh_custom_raised_button.dart';
import 'jh_display_text.dart';

class FormSubmitButton extends JHCustomRaisedButton {
  FormSubmitButton({
    required String text,
    required VoidCallback onPressed,
    Key? key,
    Color? color,
  }) : super(
          key: key,
          child: JHDisplayText(
            text: text,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          height: 44,
          color: color ?? CustomColors.indigoDark,
          borderRadius: 4,
          onPressed: onPressed,
        );
}
