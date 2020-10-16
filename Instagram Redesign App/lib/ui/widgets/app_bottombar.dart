import 'package:flutter/material.dart';
import 'package:instagram_redesign/ui/styles/colors.dart';

class AppBottomBar extends StatelessWidget {
  const AppBottomBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(36.0)),
      child: Container(
        color: AppColors.bottomBarColor,
        height: 60.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/icons/bold_home.png',
              height: 24.0,
              color: AppColors.highlightedIconColor,
            ),
            Image.asset(
              'assets/icons/light_search.png',
              height: 24.0,
              color: AppColors.nonHighlightedIconColor,
            ),
            Image.asset(
              'assets/icons/light_plus.png',
              height: 24.0,
              color: AppColors.nonHighlightedIconColor,
            ),
            Image.asset(
              'assets/icons/light_heart.png',
              height: 24.0,
              color: AppColors.nonHighlightedIconColor,
            ),
            Image.asset(
              'assets/icons/light_profile.png',
              height: 24.0,
              color: AppColors.nonHighlightedIconColor,
            ),
          ],
        ),
      ),
    );
  }
}