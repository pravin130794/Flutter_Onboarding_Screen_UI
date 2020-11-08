import 'package:Flutter_Onboarding_Screen_UI/provider/offsetNotifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class Page2 extends StatelessWidget {
  const Page2({Key key}) : super(key: key);

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
                  double multiplier;
                  if (notifier.page <= 1.0) {
                    multiplier = math.max(0, 4 * notifier.page - 3);
                  } else {
                    multiplier = math.max(0, 1 - (4 * notifier.page - 4));
                  }
                  return Transform.scale(
                    scale: multiplier,
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
                  double multiplier;
                  if (notifier.page <= 1.0) {
                    multiplier = math.max(0, 4 * notifier.page - 3);
                  } else {
                    multiplier = math.max(0, 1 - (4 * notifier.page - 4));
                  }
                  return Transform.translate(
                    offset: Offset(0, -50 * (1 - multiplier)),
                    child: Opacity(
                      opacity: multiplier,
                      child: child,
                    ),
                  );
                },
                child: Image(
                    image: AssetImage(
                  'assets/image2.png',
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
            double multiplier;
            if (notifier.page <= 1.0) {
              multiplier = math.max(0, 4 * notifier.page - 3);
            } else {
              multiplier = math.max(0, 1 - (4 * notifier.page - 4));
            }
            return Transform.translate(
              offset: Offset(0, -50 * (1 - multiplier)),
              child: Opacity(
                opacity: multiplier,
                child: child,
              ),
            );
          },
          child: Column(
            children: [
              Text(
                'Great Wave',
                style: TextStyle(
                    fontSize: 42,
                    fontFamily: "Graphik",
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 28),
                child: Text(
                    "The top of the deck has the same matching graphic in black outline and embodies an overall mellow concave",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Graphik",
                        fontWeight: FontWeight.w300)),
              ),
            ],
          ),
        )
      ],
    );
  }
}
