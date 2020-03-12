import 'package:flutter/material.dart';
import 'package:news_app/core/data-models/article_data_model.dart';
import 'package:news_app/core/enums/view_state.dart';
import 'package:news_app/core/view_models/current_news_view_model.dart';
import 'package:news_app/ui/base_ui.dart';
import 'package:news_app/ui/shared/category_widget.dart';
import 'package:news_app/ui/shared/news_widget.dart';

class CurrentNews extends StatefulWidget {
  final List<Articles> articles;

  const CurrentNews({Key key, this.articles}) : super(key: key);
  @override
  _CurrentNewsState createState() => _CurrentNewsState();
}

List<Articles> articles;
String title = 'Trending';
class _CurrentNewsState extends State<CurrentNews> {
  @override
  Widget build(BuildContext context) {
     return BaseUi<CurrentNewsViewModel>(
        onModelReady: (model) async {
            articles = widget.articles;
        },
        builder: (_, model, child) =>   SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Top News',
                  style: Theme.of(context).textTheme.title.copyWith()),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.network(widget.articles[0].urlToImage),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: Text(widget.articles[0].description,
                          style: Theme.of(context).textTheme.body2),
                    ),
                    ListTile(
                      title: Text(widget.articles[0].author),
                      subtitle: Text(widget.articles[0].source.name),
                      trailing: IconButton(
                          icon: Icon(Icons.favorite_border), onPressed: null),
                    )
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              Text('Categories',
                  style: Theme.of(context).textTheme.title.copyWith()),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),

              Wrap(
                  // scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    GestureDetector(child: Category(text:'Health'), onTap: () async {
                      final healthRes = await model.getNewsCategory(category: 'health');
                      setState(() {
                        articles = healthRes;
                        title = 'Health';
                      });
                    },),
                    GestureDetector(child: Category(text:'Sports'), onTap: () async {
                      final sportRes = await model.getNewsCategory(category: 'sports');
                      setState(() {
                        articles = sportRes;
                        title = 'Sports';
                      });
                    },),
                    GestureDetector(child: Category(text:'Business'), onTap: () async {
                      final businessRes = await model.getNewsCategory(category: 'business');
                      setState(() {
                        articles = businessRes;
                        title = 'Business';
                      });
                    },),
                    GestureDetector(child: Category(text:'Technology'), onTap: () async {
                      final techRes = await model.getNewsCategory(category: 'technology');
                      setState(() {
                        articles = techRes;
                        title = 'Technology';
                      });
                    },),
                     GestureDetector(child: Category(text:'Science'), onTap: () async {
                      final scienceRes = await model.getNewsCategory(category: 'science');
                      setState(() {
                        articles = scienceRes;
                        title = 'Science';
                      });
                    },),
                    
                  ],
                ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(title,
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              model.state == ViewState.Busy
            ? Center(
              child: Text('loading...'),
            ) : Column(
                children: articles
                    .map(
                      (article) => NewsWidget(article: article,),
                    )
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
