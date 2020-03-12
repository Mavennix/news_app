import 'package:flutter/material.dart';
import 'package:news_app/core/data-models/article_data_model.dart';

class NewsWidget extends StatefulWidget {
  final Articles article;

  const NewsWidget({Key key, this.article}) : super(key: key);
  @override
  _NewsWidgetState createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 2,
            child: Image.network(
              widget.article.urlToImage,
              height: 100.0,
              width: 100.0,
              fit: BoxFit.cover,
            ),
          ),
          Flexible(
            flex: 5,
            child: Container(
              margin: EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.article.description,
                      style: Theme.of(context).textTheme.body2),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                  Text(widget.article.source.name,
                      style: Theme.of(context).textTheme.caption),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
