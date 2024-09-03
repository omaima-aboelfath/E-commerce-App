import 'package:ecommerce_app/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

// components of alert dialog
// 1- title
// 2- content
// 3- actions

class DialogUtils {
  static void showLoading(
      {required BuildContext context,
      required String loadingLabel,
      // optional named parameter
      bool barrierDismissible = true}) {
    showDialog(
        context: context,
        // if false => the user cannot close the dialog until condition is occur
        barrierDismissible: barrierDismissible,
        builder: (context) {
          return AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  loadingLabel,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColors.primaryColor),
                ),
              ],
            ),
          );
        });
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage(
      {required BuildContext context,
      required String message,
      String title = '',
      String? posActionName,
      Function? posAction,
      // String? negActionName,
      Function? negAction}) {
    // the user write his own actions, one button or more as he like
    List<Widget> actions = [];
    if (posActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            // if the user pass the posAction fun, we will call it(execution)
            posAction?.call(); // conditional access
          },
          child: Text(posActionName)));
    }
    // if (negActionName != null) {
    //   actions.add(TextButton(
    //       onPressed: () {
    //         Navigator.pop(context);
    //         // if the user pass the posAction fun, we will call it(execution)
    //         if(negAction != null){
    //           negAction.call();
    //         }
    //       },
    //       child: Text(negActionName)));
    // }
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(message,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColors.primaryColor)),
            title: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: AppColors.primaryColor),
            ),
            actions: actions,
          );
        });
  }
}
