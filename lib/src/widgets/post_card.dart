// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:intellibra/src/riverpods/storage_riverpod.dart';

import '../models/post_model.dart';
import '../router/router.gr.dart';
import '../utils/utils.dart';

class PostCard extends ConsumerWidget {
  final String title;
  final String subTitle;
  final String authorName;
  final DateTime publishedDate;
  final String id;
  final String? coverImage;
  final String content;
  final List<String> keywords;

  PostCard({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.authorName,
    required this.publishedDate,
    required this.id,
    this.coverImage,
    required this.content,
    required this.keywords,
  }) : super(key: key);
  late String generatedImage;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storage = ref.read(storageProvider);
    return GestureDetector(
      onTap: () {
        context.router.push(
          AwarenessDetail(
            post: PostModel(
              id: id,
              title: title,
              subTitle: subTitle,
              authorName: authorName,
              publishedDate: publishedDate,
              content: content,
              keywords: keywords,
              coverImage: generatedImage,
            ),
          ),
        );
      },
      child: Container(
        height: 191.h,
        width: 343.w,
        padding: EdgeInsets.symmetric(vertical: 17.h, horizontal: 23.37.w),
        decoration: BoxDecoration(
          color: Palette.light,
          borderRadius: BorderRadius.circular(4.r),
          boxShadow: [boxShadow],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyles.title,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      width: 174.w,
                      child: Text(
                        subTitle,
                        style: TextStyles.awarenessSubTitle,
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
                if (coverImage != null) const Spacer(),
                if (coverImage != null)
                  FutureBuilder(
                      future: storage.getImageLink(coverImage!),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          generatedImage = snapshot.data as String;
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              image: DecorationImage(
                                image: NetworkImage(snapshot.data as String),
                              ),
                            ),
                            height: 76.h,
                            width: 59.w,
                          );
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(
                                color: Palette.primary),
                          );
                        }
                      })
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  authorName,
                  style: TextStyles.awarenessFooter,
                ),
                SizedBox(
                  width: 20.32.w,
                ),
                Text(
                  timeago.format(publishedDate),
                  style: TextStyles.awarenessFooter,
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      IconlyLight.heart,
                      color: Palette.primary,
                    )),
                SizedBox(
                  width: 8.74.w,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share,
                      color: Palette.primary,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
