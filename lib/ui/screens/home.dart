import 'package:flutter/material.dart';
import 'package:news_app/core/data-models/article_data_model.dart';
import 'package:news_app/core/data/home_routes.dart';
import 'package:news_app/core/enums/view_state.dart';
import 'package:news_app/core/view_models/home_view_model.dart';
import 'package:news_app/ui/base_ui.dart';
import 'package:news_app/ui/screens/current_news.dart';
import 'package:news_app/ui/screens/favourite_news.dart';
import 'package:news_app/ui/screens/share_news.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin<Home> {
  List<AnimationController> _faders;
  List<Key> destinationKeys;
  int _currentIndex = 0;
List<Articles> topArticles;
List<Articles> favouriteArticles;
  @override
  void initState() {
    super.initState();

    _faders = destinations.map<AnimationController>((HomeRoutes destination) {
      return AnimationController(
          vsync: this, duration: Duration(milliseconds: 200));
    }).toList();
    _faders[_currentIndex].value = 1.0;
    destinationKeys =
        List<Key>.generate(destinations.length, (int index) => GlobalKey())
            .toList();
  }

  @override
  void dispose() {
    for (AnimationController controller in _faders) controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseUi<HomeViewModel>(
        onModelReady: (model) async {
           favouriteArticles = await model.getFavouriteNews();
           topArticles = await model.getTopNews();
        },
        builder: (_, model, child) =>  Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.sort,
              size: 34.0,
              color: Colors.black,
            ),
            onPressed: () {}),
        actions: <Widget>[
          FlatButton(
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.search,
                    size: 20.0,
                    color: Colors.black,
                  ),
                  Text('Search', style: Theme.of(context).textTheme.caption),
                ],
              ),
              onPressed: () {})
        ],
      ),
      body: model.state == ViewState.Busy
            ? Center(
              child: Text('loading...'),
            ) :  IndexedStack(
        index: _currentIndex,
        children: <Widget>[CurrentNews(articles: topArticles,), FavouriteNews(articles: favouriteArticles,), ShareNews()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: destinations.map((HomeRoutes destination) {
          return BottomNavigationBarItem(
              icon: destination.icon,
              // backgroundColor: destination.color,
              title: Container());
        }).toList(),
      ),
    ));
  }
}
