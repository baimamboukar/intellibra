import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import 'package:intellibra/src/models/post_model.dart';

import '../utils/utils.dart';
import '../widgets/widgets.dart';

class AwarenessDetail extends ConsumerWidget {
  final PostModel post;
  AwarenessDetail({
    super.key,
    required this.post,
  });
  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          pinned: true,
          floating: true,
          expandedHeight: 180.0,
          flexibleSpace: FlexibleSpaceBar(
              background: Container(
                  decoration: BoxDecoration(
                image: post.coverImage == null
                    ? null
                    : DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(post.coverImage!)),
                color: Palette.primary,
              )),
              collapseMode: CollapseMode.pin,
              stretchModes: const [
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
                StretchMode.zoomBackground
              ],
              title: Text(post.title, overflow: TextOverflow.ellipsis)),
        ),
        SliverToBoxAdapter(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 20.0),
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Palette.primary.withOpacity(0.2),
                border: const BorderDirectional(
                    start: BorderSide(width: 5.0, color: Palette.primary))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title,
                    style: const TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Author : ${post.authorName}",
                        style: const TextStyle(
                            fontSize: 18.0,
                            color: Palette.primary,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text("22 Jul 2021")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [],
                  ),
                ],
              ),
            ),
          ),
        )),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(12.0) +
                const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Text(post.content),
          ),
        ),
        SliverToBoxAdapter(
          child: TextButton(
            onPressed: () {
              scrollController.animateTo(0,
                  duration: const Duration(seconds: 1),
                  curve: Curves.bounceOut);
            },
            child: Text(
              'Back to top',
              style: TextStyles.awarenessBackToTop,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 48.h,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Text(
                  "Add Your Comment",
                  style: TextStyles.awarenessTitle,
                ),
                SizedBox(
                  width: 13.w,
                ),
                const Expanded(
                  child: Divider(
                    color: Palette.grey,
                    thickness: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Container(
              // width: 163.5.w,
              margin: EdgeInsets.symmetric(vertical: 10.h),
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
              ),
              height: 96.h,
              decoration: const BoxDecoration(
                color: Palette.grey,
              ),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: "Enter your comment here..",
                  hintStyle: TextStyles.awarenessFooter,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 11.h),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                width: 169.w,
                height: 38.h,
                decoration: BoxDecoration(
                  color: Palette.primary,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Text('Post Comment',
                    style: TextStyles.awarenessBody.copyWith(
                      color: Palette.light,
                    )),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 20.h),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Row(
              children: [
                Text('View All Comments ',
                    style: TextStyles.awarenessCommentHeader),
                Text(
                  '(02)',
                  style: TextStyles.awarenessCommentHeader
                      .copyWith(decoration: TextDecoration.none),
                ),
                SizedBox(
                  width: 14.w,
                ),
                CircleAvatar(
                  radius: 11.5.r,
                  backgroundColor: Palette.primary.withOpacity(0.5),
                  child: Icon(
                    IconlyLight.arrow_down_2,
                    color: Palette.light,
                    size: 16.w,
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 34.h),
        ),
        const SliverToBoxAdapter(
          child: CommentCard(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 34.h),
        ),
        const SliverToBoxAdapter(
          child: CommentCard(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 74.h),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Text(
                  "More News for you",
                  style: TextStyles.awarenessTitle,
                ),
                SizedBox(
                  width: 13.w,
                ),
                const Expanded(
                  child: Divider(
                    color: Palette.grey,
                    thickness: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 11.h),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: const [],
          ),
        ),
      ],
    ));
  }
}
