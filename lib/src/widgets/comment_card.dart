import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intellibra/src/utils/utils.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text("Rakshan (You)"),
              const Spacer(),
              IconButton(onPressed: () {}, icon: const Icon(Icons.thumb_up)),
              SizedBox(
                width: 13.w,
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.thumb_down_alt_outlined))
            ],
          ),
          const Text(
              '''I’ve been a great fan of Samsung products since 2010. Can’t wait for this one. 🔥🔥🔥'''),
          Row(
            children: [
              Text(
                "Posted  on Jul 5, 2021 | 6:22 AM",
                style: TextStyles.awarenessFooter,
              ),
              const Spacer(),
              TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete_outline,
                    color: Palette.danger.withOpacity(0.5),
                  ),
                  label: Text(
                    "Delete Comment",
                    style: TextStyles.awarenessDeleteComment,
                  )),
            ],
          ),
          SizedBox(
            height: 13.h,
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                'Reply',
                style: TextStyles.awarenessReply,
              )),
          SizedBox(
            height: 21.h,
          ),
          Container(
            padding: EdgeInsets.only(
              left: 10.w,
            ),
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(color: Palette.tertiary, width: 2),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text("Sharma KL"),
                    const Spacer(),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.thumb_up)),
                    SizedBox(
                      width: 13.w,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.thumb_down_alt_outlined))
                  ],
                ),
                const Text(
                  '''This Samsung Fold packs plenty of power into its small stature.''',
                  softWrap: true,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Posted  on Jul 5, 2021 | 6:55 AM",
                  style: TextStyles.awarenessFooter,
                ),
                SizedBox(
                  height: 13.h,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Reply',
                      style: TextStyles.awarenessReply,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
