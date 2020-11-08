import 'package:Flutter_Onboarding_Screen_UI/provider/offsetNotifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class Page3 extends StatelessWidget {
  const Page3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 500,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Consumer<OffsetNotifier>(
                builder: (context, notifier, child) {
                  return Transform.scale(
                    scale: math.max(0, 1 - (1 - (4 * notifier.page - 7))),
                    child: child,
                  );
                },
                child: Container(
                  width: 340,
                  height: 340,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                ),
              ),
              Consumer<OffsetNotifier>(
                builder: (context, notifier, child) {
                  return Transform(
                    alignment: FractionalOffset.center,
                    transform: Matrix4.translationValues(
                        0, 100 * (1 - (4 * notifier.page - 7)), 0)
                      ..rotateZ((-math.pi / 2) * 2 * notifier.page),
                    child: child,
                  );
                },
                child: Image(
                    image: AssetImage(
                  'assets/image3.png',
                )),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Consumer<OffsetNotifier>(
          builder: (context, notifier, child) {
            return Transform.translate(
                offset: Offset(0, 50 * (1 - (4 * notifier.page - 7))),
                child: child);
          },
          child: Text(
            'Reject',
            style: TextStyle(
                fontSize: 42,
                fontFamily: "Graphik",
                fontWeight: FontWeight.w800),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Consumer<OffsetNotifier>(
          builder: (context, notifier, child) {
            return Opacity(
              opacity: math.max(0, 4 * notifier.page - 7),
              child: child,
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Text(
                "You don't have time to consider whether the graphic on your CSS board would be considered modernist",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: "Graphik",
                    fontWeight: FontWeight.w300)),
          ),
        ),
      ],
    );
  }
}
