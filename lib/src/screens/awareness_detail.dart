// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:intellibra/src/models/post_model.dart';

import '../utils/utils.dart';
import 'package:timeago/timeago.dart' as timeago;

class AwarenessDetail extends ConsumerWidget {
  final PostModel post;
  const AwarenessDetail({
    required this.post,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              size: 24.sp,
              color: Palette.primary,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.search,
                color: Palette.primary,
                size: 24.sp,
              )),
          TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.person_rounded,
              ),
              label: Text(
                'My Profile',
                style: TextStyles.myProfile,
              ))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.title,
                  style: TextStyles.title,
                ),
                SizedBox(
                  height: 14.h,
                ),
                Row(
                  children: [
                    ...post.keywords
                        .map((keyWord) => Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4.h, horizontal: 8.w),
                              margin: EdgeInsets.symmetric(horizontal: 9.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.r),
                                color: Palette.tertiary,
                              ),
                              child: Text(
                                keyWord,
                                style: TextStyles.body
                                    .copyWith(color: Palette.primary),
                              ),
                            ))
                        .toList()
                  ],
                ),
                SizedBox(
                  height: 26.h,
                ),
                Text(
                  post.subTitle,
                  style: TextStyles.awarenessBody,
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 24.h,
                  ),
                  height: 183.h,
                  width: 327.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(post.coverImage!),
                    ),
                  ),
                ),
                SizedBox(
                  height: 35.h,
                ),
                Text(
                  post.content,
                  style: TextStyles.awarenessBody,
                ),
                SizedBox(
                  height: 48.h,
                ),
                Center(
                  child: Text(
                    'Published ${timeago.format(post.publishedDate)}',
                    style: TextStyles.awarenessFooter,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
