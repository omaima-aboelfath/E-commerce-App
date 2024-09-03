import 'package:ecommerce_app/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

// create new type of function
typedef MyValidator = String? Function(String?);

class TextFieldItem extends StatelessWidget {
  String hintText;
  TextEditingController controller; // to save what the user write
  TextInputType keyboardType; // optional in constructor
  bool obscureText; // input is visible or not, false => visible
  MyValidator validator; // make sure all fields are written in it
  // OR String? Function(String?) validator;
  Widget? suffixIcon;
  String text;

  TextFieldItem(
      {required this.hintText,
      required this.controller,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      required this.text,
      required this.validator,
      this.suffixIcon = null});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.greyColor),
              fillColor: Colors.white,
              filled: true,
              suffixIcon: suffixIcon,
              // not pressed
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.white)),
              // // on pressed
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.white)),
              // // on error but not presses
              // errorBorder: OutlineInputBorder(
              //     borderRadius: BorderRadius.circular(15),
              //     borderSide: BorderSide(color: AppColors.redColor)),
              // // on error but pressed
              // focusedErrorBorder: OutlineInputBorder(
              //     borderRadius: BorderRadius.circular(15),
              //     borderSide: BorderSide(color: AppColors.redColor)),
            ),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.primaryColor),
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            validator: validator,
          ),
        ],
      ),
    );
  }
}
