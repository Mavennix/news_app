import 'package:flutter/material.dart';

class HomeRoutes {
  const HomeRoutes(this.title, this.icon,);
  final String title;
  final Icon icon;
  // final String activeIcon;
  // final MaterialColor color;
}

const List<HomeRoutes> destinations = <HomeRoutes>[
  HomeRoutes('Current News', Icon(Icons.home)),
  HomeRoutes('Favourite', Icon(Icons.favorite_border)),
  HomeRoutes('Share', Icon(Icons.share)),
];