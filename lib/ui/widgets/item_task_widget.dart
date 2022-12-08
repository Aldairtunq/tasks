import 'package:flutter/material.dart';
import 'package:tasks/ui/widgets/general/colors.dart';
import 'package:tasks/ui/widgets/general_widgets.dart';
import 'package:tasks/ui/widgets/item_category_widget.dart';

class ItemTaskWidget extends StatelessWidget {
  const ItemTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 16.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(4, 4),
            blurRadius: 12.0,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemCategoryWidget(
            text: " personal",
          ),
          divider3(),
          Text(
            "Loren ipsum, dolor sit amet0",
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
              color: kBrandPrimaryColor.withOpacity(0.85),
            ),
          ),
          Text(
            "lorem ipsum dolor dit smet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              color: kBrandPrimaryColor.withOpacity(0.75),
            ),
          ),
          divider6(),
          Text(
            "10/12/2022",
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              color: kBrandPrimaryColor.withOpacity(0.75),
            ),
          ),
        ],
      ),
    );
  }
}
