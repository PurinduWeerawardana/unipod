import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kcroz/src/features/core/screens/home_screen_items.dart';


class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _currentIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page){
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    print(_currentIndex);
    double displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: homeScreenItems
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.fromLTRB(displayWidth*.05,displayWidth*.05,displayWidth*.05,displayWidth*.08),
        height: displayWidth * .200,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(25),
        ),
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                _currentIndex = index;
                HapticFeedback.lightImpact();
              });
              navigationTapped(_currentIndex);
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Stack(
              children: [
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == _currentIndex ? displayWidth * .33 : displayWidth * .18,
                  alignment: Alignment.center,
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height: index == _currentIndex ? displayWidth * .15 : 0,
                    width: index == _currentIndex ? displayWidth * .25 : 0,
                    decoration: BoxDecoration(
                      // selected icon color
                      color: index == _currentIndex ? Colors.white: Colors.transparent,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == _currentIndex ? displayWidth * .31 : displayWidth * .18,
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width:
                            index == _currentIndex ? displayWidth * .16 : 0,
                          ),
                          AnimatedOpacity(
                            opacity: index == _currentIndex ? 1 : 0,
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            child: Text(
                              index == _currentIndex ? listOfStrings[index] : '',
                              style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            // icons width
                            width:
                            index == _currentIndex ? displayWidth * .07 : 20,
                          ),
                          Icon(
                            listOfIcons[index],
                            size: displayWidth * .07,
                            color: index == _currentIndex ? Colors.black87 : Colors.black26,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.map_rounded,
    Icons.gamepad,
    Icons.message_rounded,
    Icons.person_outline_rounded,
  ];

  List<String> listOfStrings = [
    'Home',
    'Game',
    'Chats',
    'Me',
  ];
}
