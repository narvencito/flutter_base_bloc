// ignore_for_file: inference_failure_on_function_invocation, eol_at_end_of_file

import 'package:flutter/material.dart';
import 'package:movie/app/common/widgets/alert_confirm.dart';

class UtilCommon {
  static void openConfirmDialog(
    BuildContext context,
    String message,
    Function yesOnPressed,
    Function noOnPressed,
  ) {
    final confirmDialog = AppConfirmDialog(
      title: message,
      yesOnPressed: yesOnPressed,
      noOnPressed: noOnPressed,
      yes: 'Aceptar',
      no: 'Cancelar',
    );
    showDialog(
      barrierColor: Colors.black45,
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => confirmDialog,
    );
  }
}
