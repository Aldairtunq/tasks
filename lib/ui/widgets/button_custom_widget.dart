import 'package:flutter/material.dart';
import 'package:tasks/ui/widgets/general/colors.dart';

class ButtonCustomWidget extends StatelessWidget {
  String text;
  Color color;
  String icon;
  Function Onpressed;

  ButtonCustomWidget({
    required this.text,
    required this.color,
    required this.icon,
    required this.Onpressed,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {
          Onpressed();
        },
        style: ElevatedButton.styleFrom(
            primary: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            )),
        icon: SvgPicture.asset(
          'assets/icons/$icon.Svg',
          color: Colors.white,
        ),
        label: Text(
          text,
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
