import 'package:Flutter_Onboarding_Screen_UI/provider/offsetNotifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class Page1 extends StatelessWidget {
  const Page1({Key key}) : super(key: key);

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
                builder: (context, notifier, child) => Transform.scale(
                    scale: math.max(0, 1 - notifier.page),
                    child: Opacity(
                      opacity: math.max(0, math.max(0, 1 - notifier.page)),
                      child: child,
                    )),
                child: Container(
                  width: 340,
                  height: 340,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                ),
              ),
              Consumer<OffsetNotifier>(
                builder: (context, notifier, child) => Transform.rotate(
                  angle: math.max(0, (math.pi / 2) * 4 * notifier.page),
                  child: child,
                ),
                child: Image(
                    image: AssetImage(
                  'assets/image1.png',
                )),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Consumer<OffsetNotifier>(
          builder: (context, notifier, child) => Opacity(
              opacity: math.max(0, 1 - 4 * notifier.page), child: child),
          child: Column(
            children: [
              Text(
                'Samurai',
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
                    "A durable deck featured with a menacing face of a samurai at the center of the underside accompanised with a large red sun motif",
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
