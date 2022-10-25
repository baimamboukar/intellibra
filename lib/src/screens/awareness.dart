import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intellibra/src/riverpods/awareness_riverpod/category_index_provider.dart';
import 'package:intellibra/src/riverpods/storage_riverpod.dart';
import 'package:intellibra/src/utils/mock/fake_posts.dart';
import 'package:intellibra/src/utils/palette.dart';
import 'package:intellibra/src/utils/text_styles.dart';

import '../utils/mock/mock.dart';
import '../widgets/widgets.dart';

class Awareness extends ConsumerWidget {
  const Awareness({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storage = ref.read(storageProvider);
    // ignore: avoid_unnecessary_containers
    ScreenUtil.init(context, designSize: const Size(375, 812));
    final categoryIndex = ref.watch(categeroyIndexProvider);
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Palette.bac,
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
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 18.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Top Stories",
              style: TextStyles.awarenessTitle,
            ),
            SizedBox(
              height: 22.h,
            ),
            SizedBox(
              height: 30.h,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: fakeCategories.length,
                separatorBuilder: (context, index) => SizedBox(
                  width: 10.w,
                ),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  bool selected = false;
                  if (categoryIndex == index) {
                    selected = true;
                  }
                  return GestureDetector(
                      onTap: () {
                        ref.read(categeroyIndexProvider.notifier).state = index;
                      },
                      child: CategoryCard(
                          selected: selected, content: fakeCategories[index]));
                },
                shrinkWrap: true,
              ),
            ),
            SizedBox(
              height: 23.h,
            ),
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => SizedBox(
                        height: 15.h,
                      ),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    final post = fakePosts[index];
                    String? image;
                    if (post.coverImage != null) {
                      storage.getImageLink(post.coverImage!);
                    }
                    return PostCard(
                        id: post.id,
                        content: post.content,
                        keywords: post.keywords,
                        title: post.title,
                        subTitle: post.subTitle,
                        coverImage: post.coverImage,
                        authorName: post.authorName,
                        publishedDate: post.publishedDate);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
