import 'package:Flutter_Onboarding_Screen_UI/pages/pages.dart';
import 'package:Flutter_Onboarding_Screen_UI/provider/indexNotifier.dart';
import 'package:Flutter_Onboarding_Screen_UI/provider/offsetNotifier.dart';
import 'package:Flutter_Onboarding_Screen_UI/widgets/pageIndicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController _pageController;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OffsetNotifier(_pageController),
      child: Scaffold(
          backgroundColor: Color(0xFFF2F2F2),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 16, 20, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hops",
                      style: TextStyle(
                          fontSize: 22,
                          fontFamily: "Graphik",
                          fontWeight: FontWeight.w800),
                    ),
                    Stack(
                      children: [
                        IconButton(
                          icon: Icon(Icons.shopping_bag),
                          onPressed: () {},
                        ),
                        Positioned(
                          right: 10,
                          bottom: 8,
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (int index) => {
                      Provider.of<IndexNotifier>(context, listen: false).index =
                          index
                    },
                    children: [Page1(), Page2(), Page3()],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PageIndicator(),
                  Text(
                    "View Board",
                    style: TextStyle(
                        letterSpacing: 3,
                        fontFamily: "Graphik",
                        fontWeight: FontWeight.w400),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: IconButton(
                      icon: Icon(Icons.arrow_forward),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
            ],
          )),
    );
  }
}
