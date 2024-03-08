import 'package:flutter/material.dart';
import 'package:intellibra/src/extensions/build_context.dart';
import 'package:intellibra/src/extensions/num.dart';

import 'package:intellibra/src/app/assets.dart';
import 'package:intellibra/src/configs/configs.dart';
import 'package:timeago/timeago.dart' as timeago;

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.authorName,
    this.description,
    this.image,
    super.key,
  });
  final String id;
  final String title;
  final String? description;
  final DateTime createdAt;
  final String? image;
  final String authorName;

  @override
  Widget build(BuildContext context) {
    final isMobile = context.mediaQuery.size.width < 600;
    return Container(
      height: description == null ? 167 : 232,
      padding: const EdgeInsets.fromLTRB(16, 22, 16, 12),
      decoration: BoxDecoration(
        color: context.scheme.onPrimary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    authorName,
                    style: context.theme.textTheme.bodyMedium,
                  ),
                  4.vGap,
                  SizedBox(
                    width: isMobile
                        ? context.mediaQuery.size.width * 0.6
                        : context.mediaQuery.size.width >= 960
                            ? context.mediaQuery.size.width * 0.27
                            : context.mediaQuery.size.width * 0.38,
                    child: Hero(
                      tag: title,
                      child: Text(
                        title,
                        style: context.theme.textTheme.headlineSmall!
                            .copyWith(fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                  ),
                ],
              ),
              if (isMobile)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: image == null
                      ? Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(Assets.articlePlaceholder),
                              fit: BoxFit.cover,
                            ),
                          ),
                          height: 75,
                          width: 75,
                        )
                      : Hero(
                          tag: image!,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(image!),
                                fit: BoxFit.cover,
                              ),
                            ),
                            height: 75,
                            width: 75,
                          ),
                        ),
                ),
            ],
          ),
          4.vGap,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                timeago.format(
                  createdAt,
                ),
                style: context.theme.textTheme.bodySmall!.copyWith(
                  color: Palette.secondaryTextColor.withOpacity(0.5),
                ),
              ),
              PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'bookmark') {
                    // Handle bookmark option
                  } else if (value == 'like') {
                    // Handle like option
                  } else if (value == 'share') {
                    // Handle share option
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'bookmark',
                    child: Text('Bookmark'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'like',
                    child: Text('Like'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'share',
                    child: Text('Share'),
                  ),
                ],
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_horiz_outlined),
                ),
              ),
            ],
          ),
          if (description != null) ...[
            8.vGap,
            Text(
              description!,
              style: context.theme.textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ],
          if (!isMobile) ...[
            8.vGap,
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Hero(
                  tag: image!,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(image!),
                        fit: BoxFit.cover,
                      ),
                    ),
                    // height: context.mediaQuery.size.width >= 960 ? 160: context.mediaQuery.size.width >= 600 ? 210: 135,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
