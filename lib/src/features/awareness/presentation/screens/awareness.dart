import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intellibra/src/extensions/build_context.dart';
import 'package:intellibra/src/features/awareness/presentation/cubit/awareness_cubit.dart';

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
                loading: () => const Center(child: CircularProgressIndicator()),
                loaded: (articles) => articles.isEmpty
                    ? Center(
                        child: Text(
                          'No article Yet',
                          style: context.bodyLg,
                        ),
                      )
                    : ListView.separated(
                        itemBuilder: (context, i) => ListTile(
                          title: Text(articles[i].title),
                          subtitle: Text(articles[i].description),
                          // onTap: () => context.router.push(ArticleRoute(article: articles[i])),
                        ),
                        separatorBuilder: (context, i) => const Divider(),
                        itemCount: articles.length,
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
        title: Text('Awareness', style: context.theme.textTheme.titleLarge),
      ),
    );
  }
}
