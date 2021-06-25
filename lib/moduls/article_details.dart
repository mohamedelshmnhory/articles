import 'package:articles/models/home_model.dart';
import 'package:flutter/material.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final Result article;
  ArticleDetailsScreen({Key key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              article.multimedia
                  .firstWhere((element) => element.format == Format.SUPER_JUMBO)
                  .url,
              width: double.infinity,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Text(
                article.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Text(
                article.resultAbstract,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
