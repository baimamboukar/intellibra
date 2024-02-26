import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:intellibra/src/app/assets.dart';
import 'package:intellibra/src/configs/configs.dart';
import 'package:intellibra/src/extensions/build_context.dart';
import 'package:intellibra/src/extensions/num.dart';
import 'package:intellibra/src/features/awareness/presentation/cubit/awareness_cubit.dart';
import 'package:timeago/timeago.dart' as timeago;

//TODO: #37 Implement Awareness feature
@RoutePage()
class Awareness extends StatefulWidget {
  const Awareness({super.key});

  @override
  State<Awareness> createState() => _AwarenessState();
}

class _AwarenessState extends State<Awareness> {
  @override
  void initState() {
    context.read<AwarenessCubit>().getAllArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocConsumer<AwarenessCubit, AwarenessState>(
          listener: (context, state) {
            state.maybeWhen(
              error: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                    backgroundColor: Colors.red,
                  ),
                );
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            return RefreshIndicator.adaptive(
              onRefresh: () async {
                await context.read<AwarenessCubit>().getAllArticles();
              },
              child: state.when(
                initial: () => Center(
                  child: Text(
                    'articles not loaded, please refresh',
                    style: context.bodyLg,
                  ),
                ),
                loading: () =>
                    const Center(child: CircularProgressIndicator.adaptive()),
                loaded: (articles) => articles.isEmpty
                    ? Center(
                        child: Text(
                          'No article Yet',
                          style: context.bodyLg,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(16),
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, i) {
                            final article = articles[i];
                            return ArticleCard(
                              id: article.id ?? '',
                              title: article.title!,
                              createdAt: article.createdAt,
                              description: article.description,
                              authorName: article.authorName!,
                              image: article.imageUrl,
                            );
                          },
                          separatorBuilder: (context, i) =>  32.vGap,
                          itemCount: articles.length,
                        ),
                      ),
                error: (message) => Text(
                  message,
                  style: context.theme.textTheme.titleLarge!
                      .copyWith(color: Colors.red),
                ),
              ),
            );
          },
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(IconlyBroken.bookmark),
        ),
        title: Text('Awareness', style: context.theme.textTheme.titleLarge),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(IconlyBroken.search),
          ),
        ],
      ),
    );
  }
}

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
    return Container(
      height: description == null ? 167 : 232,
      padding: const EdgeInsets.fromLTRB(16,22,16,12 ),
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
                    width: 200,
                    child: Text(
                      title,
                      style: context.theme.textTheme.headlineSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: image == null
                    ? Image.asset(
                        Assets.articlePlaceholder,
                        height: 75,
                        width: 75,
                      )
                    : Image.network(image!, height: 75, width: 75),
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
                )
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz_outlined),
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
        ],
      ),
    );
  }
}
