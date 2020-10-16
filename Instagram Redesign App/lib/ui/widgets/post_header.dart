import 'package:flutter/material.dart';
import 'package:instagram_redesign/ui/styles/colors.dart';

class PostHeaderBar extends StatelessWidget {
  const PostHeaderBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgColor,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  size: 18.0,
                  color: AppColors.highlightedIconColor,
                ),
                const SizedBox(width: 12.0),
              ],
            ),
          ),
          const Spacer(),
          Icon(
            Icons.more_horiz,
            size: 18.0,
            color: AppColors.highlightedIconColor,
          ),
        ],
      ),
    );
  }
}
