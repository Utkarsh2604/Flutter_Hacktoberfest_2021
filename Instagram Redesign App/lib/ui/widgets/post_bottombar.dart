import 'package:flutter/material.dart';
import 'package:instagram_redesign/ui/styles/colors.dart';

class PostBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(36.0)),
      child: Container(
        color: AppColors.bottomBarColor,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(12.0),
        child: TextField(
          onTap: () {},
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.bgColor,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  "assets/images/dp_1.jpg",
                  height: 40.0,
                  width: 40.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            suffixIcon: Icon(Icons.send,
                color: AppColors.highlightedIconColor, size: 18.0),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
            border: OutlineInputBorder(
              gapPadding: 0.0,
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(36.0),
            ),
            hintText: "Add a comment",
            hintStyle: TextStyle(
                color: AppColors.nonHighlightedIconColor,
                fontWeight: FontWeight.bold,
                fontSize: 12.0),
          ),
        ),
      ),
    );
  }
}