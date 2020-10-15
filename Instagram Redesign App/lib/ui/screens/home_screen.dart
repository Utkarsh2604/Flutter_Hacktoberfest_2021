import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram_redesign/ui/styles/colors.dart';
import 'package:instagram_redesign/ui/widgets/app_bottombar.dart';
import 'package:instagram_redesign/ui/widgets/app_header.dart';
import 'package:instagram_redesign/ui/widgets/custom_rounded_shape.dart';
import 'package:instagram_redesign/ui/widgets/post_widget.dart';
import 'package:instagram_redesign/ui/widgets/sliver_appbar_delegate.dart';
import 'package:instagram_redesign/ui/widgets/story_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppColors.bgColor));
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.bgColor,
        bottomNavigationBar: AppBottomBar(),
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverAppBarDelegate(
                minHeight: 54.0,
                maxHeight: 54.0,
                child: AppHeaderBar(),
              ),
            ),
            SliverPersistentHeader(
              pinned: false,
              delegate: SliverAppBarDelegate(
                minHeight: 96.0,
                maxHeight: 96.0,
                child: StoryWidget(),
              ),
            ),
            SliverPadding(padding: const EdgeInsets.only(top: 16.0)),
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverAppBarDelegate(
                minHeight: 48.0,
                maxHeight: 48.0,
                child: CustomRoundShape(),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                List.generate(5, (index) => PostWidget(index: index)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
