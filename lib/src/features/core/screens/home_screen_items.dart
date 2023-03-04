import 'package:flutter/cupertino.dart';
import 'package:unipod/src/features/core/screens/game/game_screen.dart';
import 'package:unipod/src/features/core/screens/profile/profile_screen.dart';
import 'map/home_page_map.dart';

const homeScreenItems = [
  HomePageMap(),
  GameScreen(),
  Center(child: Text("Message")),
  ProfileScreen()
];
