import 'package:flutter/material.dart';
import 'package:tasks/ui/widgets/general/colors.dart';

class TextFliedNormalWidget extends StatelessWidget {
  String hintText;
  IconData icon;
  Function? onTap;

  TextFliedNormalWidget({
    required this.hintText,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap != null
          ? () {
              onTap!();
            }
          : null,
      readOnly: onTap != null ? true : false,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14.0),
          prefixIcon: Icon(icon,
              size: 20.0, color: kBrandPrimaryColor.withOpacity(8.6)),
          hintText: hintText,
          hintStyle: TextStyle(
              fontSize: 14.0, color: kBrandPrimaryColor.withOpacity(8.6)),
          filled: true,
          fillColor: kBrandSecondaryColor,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              14.0,
            ),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              14.0,
            ),
            borderSide: BorderSide.none,
          )),
    );
  }
}