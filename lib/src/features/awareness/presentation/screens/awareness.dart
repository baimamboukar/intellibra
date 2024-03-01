import 'package:auto_route/auto_route.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:intellibra/src/extensions/build_context.dart';
import 'package:intellibra/src/extensions/num.dart';
import 'package:intellibra/src/features/awareness/presentation/cubit/awareness_cubit.dart';
import 'package:intellibra/src/features/awareness/presentation/widgets/article_card.dart';
import 'package:intellibra/src/router/intellibra_router.gr.dart';

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
    context.read<AwarenessCubit>().getAllArticles(1);
    super.initState();
  }

  final TextEditingController searchController = TextEditingController();
  

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
                await context.read<AwarenessCubit>().getAllArticles(1);
              },
              child: state.when(
                noInternet: () => Center(
                  child: Text(
                    'No internet connection',
                    style: context.bodyLg,
                  ),
                ),
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
                            return GestureDetector(
                              onTap: () {
                                AutoRouter.of(context)
                                    .push(ArticleRoute(article: article));
                              },
                              child: ArticleCard(
                                id: article.id,
                                title: article.title,
                                createdAt: article.createdAt,
                                description: article.description,
                                authorName: article.authorName,
                                image: article.imageUrl,
                              ),
                            );
                          },
                          separatorBuilder: (context, i) => 32.vGap,
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
        /*  title: Text('Awareness', style: context.theme.textTheme.titleLarge),
        actions: [
        ], */
        title: EasySearchBar(
          title: Text('Awareness', style: context.theme.textTheme.titleLarge),
          onSearch: (value) => setState(() => searchController.text = value),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }
}
