import 'package:flutter/material.dart';
import 'package:tasks/ui/widgets/general/colors.dart';

class TextFliedSearchWidget extends StatelessWidget {
  const TextFliedSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14.0),
          prefixIcon: Icon(Icons.search,
              size: 20.0, color: kBrandPrimaryColor.withOpacity(8.6)),
          hintText: "Buscar tarea...",
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
