import 'package:flutter/material.dart';
import 'package:instagram_redesign/ui/styles/colors.dart';
import 'package:instagram_redesign/ui/widgets/comment_widget.dart';
import 'package:instagram_redesign/ui/widgets/custom_rounded_shape.dart';
import 'package:instagram_redesign/ui/widgets/post_bottombar.dart';
import 'package:instagram_redesign/ui/widgets/post_header.dart';
import 'package:instagram_redesign/ui/widgets/post_widget.dart';
import 'package:instagram_redesign/ui/widgets/sliver_appbar_delegate.dart';

class PostScreen extends StatelessWidget {
  final UniqueKey heroTag;
  final int index;

  const PostScreen({Key key, @required this.heroTag, this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.bgColor,
          bottomNavigationBar: PostBottomBar(),
          body: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                delegate: SliverAppBarDelegate(
                  minHeight: 36.0,
                  maxHeight: 36.0,
                  child: PostHeaderBar(),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: SliverAppBarDelegate(
                  minHeight: 48.0,
                  maxHeight: 48.0,
                  child: CustomRoundShape(),
                ),
              ),
              SliverPersistentHeader(
                delegate: SliverAppBarDelegate(
                  minHeight: MediaQuery.of(context).size.height * .62,
                  maxHeight: MediaQuery.of(context).size.height * .62,
                  child: PostWidgetMainChild(
                    heroTag: heroTag,
                    index: index,
                    bottomRadius: true,
                  ),
                ),
              ),
              SliverPadding(padding: const EdgeInsets.only(top: 16.0)),
              SliverList(
                delegate: SliverChildListDelegate(
                  List.generate(5, (index) => CommentWidget(index: index))
                      .toList(),
                ),
              ),
              SliverPadding(padding: const EdgeInsets.only(top: 16.0)),
            ],
          ),
        ),
      ),
    );
  }
}
