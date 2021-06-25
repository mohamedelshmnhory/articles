import 'package:articles/layout/home_screen/cubit/cubit.dart';
import 'package:articles/layout/home_screen/cubit/states.dart';
import 'package:articles/models/home_model.dart';
import 'package:articles/moduls/article_details.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => HomeCubit()..getHomeData(),
        child: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            List<Result> articles = HomeCubit.get(context).homeModel?.results;
            return Scaffold(
              backgroundColor: Colors.blueAccent,
              appBar: AppBar(
                title: Text('BEST STORES'),
                centerTitle: true,
              ),
              body: ConditionalBuilder(
                condition: articles != null,
                builder: (context) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                    itemCount: articles.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ArticleDetailsScreen(
                                      article: articles[index],
                                    )));
                      },
                      child: articleItem(articles, index),
                    ),
                  ),
                ),
                fallback: (context) => Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          },
        ));
  }

  Container articleItem(List<Result> articles, int index) {
    return Container(
      height: 300,
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Image.network(
              articles[index]
                  .multimedia
                  .firstWhere((element) => element.format == Format.SUPER_JUMBO)
                  .url,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                            child: Container(
                                child: Text(
                          articles[index].title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ))),
                        Flexible(
                            child: Container(
                                child: Text(
                          articles[index].resultAbstract,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ))),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Flexible(
                            child: Container(
                                child: Text(
                          articles[index]
                              .publishedDate
                              .toString()
                              .substring(0, 10),
                        ))),
                        Flexible(
                            child: Container(
                                child: Text(articles[index]
                                    .createdDate
                                    .toString()
                                    .substring(0, 10)))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
