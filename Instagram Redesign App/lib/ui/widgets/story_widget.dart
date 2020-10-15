import 'package:flutter/material.dart';
import 'package:instagram_redesign/ui/styles/colors.dart';

class StoryWidget extends StatelessWidget {
  const StoryWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96.0,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      left: 16.0, right: 8.0, top: 8.0, bottom: 8.0),
                  width: 60.0,
                  height: 62.0,
                  decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.circular(24.0),
                    border:
                        Border.all(color: AppColors.nonHighlightedIconColor),
                  ),
                  child: Icon(Icons.add, size: 24.0),
                ),
                Text(
                  "My Story",
                  style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                )
              ],
            );
          } else {
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    gradient: AppColors.gradient,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(2.0),
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      color: AppColors.bgColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        "assets/images/dp_$index.jpg",
                        height: 54.0,
                        width: 52.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Text(
                  "Laura",
                  style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
