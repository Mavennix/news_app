import 'package:flutter/material.dart';
import 'package:news_app/core/data-models/article_data_model.dart';
import 'package:news_app/ui/shared/news_widget.dart';

class FavouriteNews extends StatefulWidget {
  final List<Articles> articles;

  const FavouriteNews({Key key, this.articles}) : super(key: key);
  
  @override
  _FavouriteNewsState createState() => _FavouriteNewsState();
}

class _FavouriteNewsState extends State<FavouriteNews> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: <Widget>[Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Favourite',
                            style: Theme.of(context).textTheme.title.copyWith()),
                        Padding(
                          padding: EdgeInsets.only(left: 150.0, right: 0.0),
                          child: RaisedButton(
                            textColor: Colors.white,
                            color: Colors.black,
                            child: Text("More"),
                            onPressed: () {},
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                      ],
                    ),
          Expanded(
                    child: ListView(
        physics: BouncingScrollPhysics(),
                      
               children: widget.articles
                    .map(
                      (article) => NewsWidget(article: article,),
                    )
                    .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
