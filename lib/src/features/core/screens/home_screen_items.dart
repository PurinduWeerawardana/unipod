import 'package:flutter/cupertino.dart';
import 'package:unipod/src/features/core/screens/game/game_screen.dart';
import 'package:unipod/src/features/core/screens/game/new_screeen.dart';
import 'package:unipod/src/features/core/screens/profile/profile_screen.dart';
import 'chat/screens/home.dart';
import 'map/home_page_map.dart';

List<Widget> homeScreenItems = [
  HomePageMap(),
  NewScreen(),
  Chat(),
  ProfileScreen()
];
