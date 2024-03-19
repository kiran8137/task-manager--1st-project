


import 'package:flutter/material.dart';
import 'package:manage_your/utils/apps_colors.dart';
import 'package:manage_your/utils/apps_str.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

noTaskWarning(BuildContext context){
  return PanaraInfoDialog.showAnimatedGrow(
    context, 
    title: AppStrings.oopsmsg,
    message: "There is no Task For Delete..!\n Try adding some and then try to delete it!", 
    buttonText: "Okey", 
    onTapDismiss: (){
      Navigator.pop(context);
    },
    panaraDialogType: PanaraDialogType.custom,
    color: Appcolors.buttonColor
    );
}