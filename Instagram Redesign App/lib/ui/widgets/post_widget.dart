import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:instagram_redesign/ui/screens/post_screen.dart';
import 'package:instagram_redesign/ui/styles/colors.dart';

class PostWidget extends StatelessWidget {
  final int index;
  final UniqueKey heroTag = UniqueKey();
  PostWidget({
    Key key,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => PostScreen(heroTag: heroTag, index: index)),
      ),
      child: PostWidgetMainChild(index: index, heroTag: heroTag),
    );
  }
}

class PostWidgetMainChild extends StatelessWidget {
  const PostWidgetMainChild({
    Key key,
    @required this.index,
    @required this.heroTag,
    this.bottomRadius: false,
  }) : super(key: key);

  final int index;
  final UniqueKey heroTag;
  final bool bottomRadius;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Hero(
      tag: heroTag,
      child: Container(
        height: size.height * .7 - 48.0,
        color: Colors.transparent,
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Positioned(
              top: -48.0,
              left: 0.0,
              child: ClipRRect(
                borderRadius: bottomRadius
                    ? BorderRadius.circular(36.0)
                    : BorderRadius.vertical(top: Radius.circular(36.0)),
                child: Container(
                  height: size.height * .7,
                  width: size.width,
                  color: Colors.transparent,
                  child: Image.asset('assets/images/p_$index.jpg',
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Positioned(
              top: -24.0,
              left: 18.0,
              right: 18.0,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      "assets/images/dp_$index.jpg",
                      height: 44.0,
                      width: 44.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Text(
                    "Jessy_09",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.postWhite,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 18.0,
              right: 18.0,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 70.0,
                        height: 36.0,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.4),
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18.0),
                          child: BackdropFilter(
                            filter:
                                ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/icons/bold_heart.png',
                                    color: AppColors.postWhite,
                                    height: 24.0,
                                  ),
                                  const SizedBox(width: 4.0),
                                  Text("7.4k",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 12.0,
                                          color: AppColors.postWhite))
                                ]),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Image.asset(
                        'assets/icons/bold_chat.png',
                        color: AppColors.postWhite,
                        height: 24.0,
                      ),
                      const SizedBox(width: 4.0),
                      Text("474",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 12.0,
                              color: AppColors.postWhite)),
                      const SizedBox(width: 16.0),
                      Transform.rotate(
                        angle: -3.14 * .15,
                        child: Icon(Icons.send,
                            color: AppColors.postWhite, size: 22.0),
                      ),
                      const Spacer(),
                      Image.asset(
                        'assets/icons/light_bookmark.png',
                        color: AppColors.postWhite,
                        height: 24.0,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    children: [
                      UserWhoLikedThePostWidget(),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: Text(
                            "Hello friends how are you? I am here to ask that who is Binod",
                            style: TextStyle(
                                color: AppColors.postWhite,
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis),
                      ),
                      const SizedBox(width: 8.0),
                      MaterialButton(
                        minWidth: 56.0,
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0)),
                        onPressed: () {},
                        color: AppColors.postWhite,
                        child: Text(
                          "More",
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4.0)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UserWhoLikedThePostWidget extends StatelessWidget {
  const UserWhoLikedThePostWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.0,
      width: 48.0,
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Positioned(
            left: 28.0,
            height: 24.0,
            width: 24.0,
            child: Container(
              padding: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                color: AppColors.postWhite,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  "assets/images/dp_8.jpg",
                  height: 24.0,
                  width: 24.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            left: 16.0,
            height: 24.0,
            width: 24.0,
            child: Container(
              padding: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                color: AppColors.postWhite,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  "assets/images/dp_7.jpg",
                  height: 24.0,
                  width: 24.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0.0,
            height: 24.0,
            width: 24.0,
            child: Container(
              padding: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                color: AppColors.postWhite,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  "assets/images/dp_9.jpg",
                  height: 24.0,
                  width: 24.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
