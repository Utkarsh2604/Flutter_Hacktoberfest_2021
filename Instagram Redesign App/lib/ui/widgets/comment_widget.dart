import 'package:flutter/material.dart';
import 'package:instagram_redesign/ui/styles/colors.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({
    Key key,
    this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Image.asset(
            "assets/images/dp_$index.jpg",
            height: 40.0,
            width: 40.0,
            fit: BoxFit.cover,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mondy",
              style: TextStyle(
                  color: AppColors.nonHighlightedIconColor,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Awesome",
              style: TextStyle(
                  color: AppColors.highlightedIconColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            MaterialButton(
              elevation: 0.0,
              minWidth: 56.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0)),
              onPressed: () {},
              color: AppColors.nonHighlightedIconColor,
              child: Text(
                "Reply",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 8.0),
            MaterialButton(
              elevation: 0.0,
              minWidth: 24.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0)),
              onPressed: () {},
              color: AppColors.nonHighlightedIconColor,
              child: Image.asset("assets/icons/bold_heart.png",
                  color: Colors.black87, height: 14.0),
            ),
          ],
        ),
      ),
    );
  }
}
