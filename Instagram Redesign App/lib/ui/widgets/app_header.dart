import 'package:flutter/material.dart';
import 'package:instagram_redesign/ui/styles/colors.dart';

class AppHeaderBar extends StatelessWidget {
  const AppHeaderBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgColor,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/icons/light_setting.png',
            height: 24.0,
            color: AppColors.nonHighlightedIconColor,
          ),
          const Text(
            "Instagram",
            style: TextStyle(
                fontSize: 28.0,
                fontFamily: 'Billabong',
                fontWeight: FontWeight.w500),
          ),
          Image.asset(
            'assets/icons/light_activity.png',
            height: 24.0,
            color: AppColors.nonHighlightedIconColor,
          ),
        ],
      ),
    );
  }
}
